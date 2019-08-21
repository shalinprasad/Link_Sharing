package link_sharing

import enums.Seriousness

class SubscriptionController {
    def subscriptionService

    def updateSerious() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            subscriptionService.seriousness(params)
            redirect(controller: "dashboard", action: "index")
        }
    }

    def unsubscribe(params) {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            println params.id
            Long sid = 0.0
            User1 user = User1.findByUsername(session.name)
            Subscription su = Subscription.findById(params.id)
            if (su) {
                sid = Long.parseLong(params.id)
            } else {
                Long topid = Long.parseLong(params.id)
                Subscription sub = Subscription.createCriteria(). get {
                    eq('topics.id', topid)
                    eq('user.id', user.id)
                }
                sid = sub.id
            }
            Subscription s = Subscription.findById(sid)
            s.delete(flush: true)
            if (params.page == "dashboard") {
                redirect(controller: "dashboard", action: "index")
            } else if (params.page == "topic") {
                redirect(controller: "Topic", action: "topicshow", params: [id: params.id])
            }
        }
    }


    def subscribe(params) {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            Long topid = Long.parseLong(params.id)
            Topic t = Topic.get(topid)
            Subscription s = new Subscription(seriousness: Seriousness.CASUAL, topics: t)
            user.addToSubscriptions(s)
            s.save(flush: true, failOnError: true)
            user.save(flush: true, failOnError: true)
            redirect(controller: "dashboard", action: "index")
        }
    }

    def deleteTopics() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            List topicList1 = subscriptionService.deletePost(params)
            redirect(controller: "dashboard", action: "index")
        }
    }


    def subscribeOther(params) {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            Long topid = Long.parseLong(params.id)
            User1 user = User1.findByEmail(params.email)
            Topic topic = Topic.get(topid)
            Subscription sub = Subscription.findByTopicsAndUser(topic, user)
            if (session.name != user.username) {
                flash.message = "Login first"
                session.invalidate()
                redirect(url: '/')
            } else if (sub == null) {
                Subscription sub1 = new Subscription(seriousness: "CASUAL")
                topic.addToSubscriptions(sub1)
                user.addToSubscriptions(sub1)
                topic.save(flush: true)
                user.save(flush: true, failOnError: true)
                sub1.save(flush: true, failOnError: true)
                redirect(controller: "dashboard", action: "index")
            } else {
                flash.message6 = "Already subscribed"
            }
        }
    }
}