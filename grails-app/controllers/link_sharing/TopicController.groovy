
package link_sharing
import enums.*
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {
    def topicService
    def dashBoardService

    def create() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            Topic t=Topic.findByName(params.topicName)
            if(!params.topicName)
            {
                flash.message4 = "Please provide Topic name"
                redirect(controller: "dashboard", action: "index")
            }
            else {

                List<Topic> t1 = topicService.post(session.name)
                Boolean topicExist = t1.contains(t)
                if (topicExist) {
                    flash.message4 = "Topic already exists"
                    redirect(controller: "dashboard", action: "index")
                } else {
                    String email = session.name
                    topicService.createTopic(params, email)
                    redirect(controller: "dashboard", action: "index")
                }
            }
        }
    }
    def updateVisibility() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            topicService.visibility(params)
            redirect(controller: "dashboard", action: "index")
        }
    }
    def topiclist() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            List topiclist = topicService.showListMethod()
            render(view: 'topiclist', model: [topiclists: topiclist])
        }
    }
    def topicshow() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            User1 user1 = User1.findByUsername(session.name)
            Long tid = 0.0
            Long id = Long.parseLong(params.id)
            Subscription sub = Subscription.get(id)
            List subscriptionLt = dashBoardService.subscriptions(session.name)
            if (sub) {
                Topic t = sub.topics
                tid = t.id
            } else {
                tid = id
            }
            Long subscount = Subscription.createCriteria().count {
                eq("topics.id", tid)
            }
            int postcount = Resource1.createCriteria().count {
                eq('topics.id', tid)
            }
            List<Subscription> subscription = Subscription.createCriteria().list {
                eq("topics.id", tid)
            }
            List<User1> users = subscription*.user
            List<Long> userslist = users.collect { it.id }
            List subscriptioncount = topicService.subscriptioncount(userslist)
            List postscount = topicService.topiccount(userslist)
            List<Resource1> resource = Resource1.createCriteria().list {
                eq("topics.id", tid)
            }


            render(view: "topicshow",
                    model: [user             : user, subs: sub,
                            subscount        : subscount,
                            postcount        : postcount,
                            subscription     : subscription,
                            subscriptions    : subscriptionLt,
                            subscriptioncount: subscriptioncount,
                            postscount       : postscount,
                            resources        : resource,
                            userdata         : user1,
                            subscriptions    : subscriptionLt])
        }
    }

    def delete() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            Long t_id = Long.parseLong(params.id)
            Topic t1 = Topic.findById(t_id)
            t1.delete(flush: true)
            redirect(action: "topiclist")
        }
    }
    def sendInvite() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByEmail(params.email)
            if (!user) {
                flash.message6 = "No user is found"
                redirect controller: 'dashboard', action: 'index'
            } else {
                Topic topic = Topic.findByName(params.topicName)
                Long topicId = topic.id
                String link = createLink(controller: 'Subscription', action: 'subscribeOther', params: [id: topicId, email: user.email], absolute: true)
                sendMail {
                    to "${user.email}"
                    subject "Hello ${user.firstName} You have been invited to join this topic at LinkSharing!!!"
                    text link
                }
                redirect controller: 'dashboard', action: 'index'
            }
        }

    }
}


























































