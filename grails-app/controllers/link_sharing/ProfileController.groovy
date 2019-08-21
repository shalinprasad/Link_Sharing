package link_sharing

class ProfileController {
    def profileService
    def dashBoardService

    def profile(params, request) {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            def update = profileService.update(params, request, user)
            redirect url: "/"
        }
    }

    def password() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            def updatepass = profileService.updatepass(params, user)
            redirect(controller: "signup", action: "logout")

        }
    }

    def userDetails() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            List subscriptionLt = dashBoardService.subscriptions(session.name)
            User1 user1 = User1.findByUsername(session.name)
            Integer count_topic = dashBoardService.tCount(session.name)
            Integer count_subscribe = dashBoardService.sCount(session.name)
            List topicsList = profileService.topicsList(session.name)
            List subs1=[]
            if(topicsList){
                subs1 = profileService.topTopicSubs(topicsList)
            }
            List topic1 = profileService.topTopicsPosts(topicsList)
            List allTopics=profileService.allTopics(session.name)
            List allsubs1 = profileService.topTopicSubs(allTopics)
            List alltopics1 = profileService.topTopicsPosts(allTopics)
            List<Resource1> resource = Resource1.createCriteria().list {
                eq("createdBy.id", user1.id)
            }

            render(view: "userDetails", model: [userdata           : user1,
                                                count_topic    : count_topic,
                                                count_subscribe: count_subscribe,
                                                topic1  :topic1,
                                                allTopics:allTopics,
                                                resources:resource,
                                                subs1:subs1,
                                                topics:topicsList,
                                                allSubs1:allsubs1,
                                                allTopics1:alltopics1,
                                                subscripions:subscriptionLt

                                                ])

        }

    }

}


