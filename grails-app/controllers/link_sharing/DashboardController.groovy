package link_sharing

class DashboardController {

    def dashBoardService
    def readingService

    def index() {
        if(!session.name){
            flash.message = "Login First"
            redirect(url: "/")
        }else {
            User1 user1 = User1.findByUsername(session.name)
            Integer count_topic = dashBoardService.tCount(session.name)
            Integer count_subscribe = dashBoardService.sCount(session.name)
            List subscriptionLt = dashBoardService.subscriptions(session.name)
            if (!subscriptionLt) {
                List trending = dashBoardService.trendtopics()
                User1 user = User1.findByUsername(session.name)
                List<Long> aa = trending.collect{
                    it.id
                }
                List subs2 = dashBoardService.subscriptioncount(aa)
                List topic2 = dashBoardService.postscount(aa)
                render(view: "index", model: [user           : user1,
                                              userdata       : user,
                                              count_topic    : count_topic,
                                              count_subscribe: count_subscribe,
                                              subscriptions  : [],
                                              subscount      : [],
                                              resourcecount  : [],
                                              trending       : trending,
                                              topic2         : topic2,
                                              subs2          : subs2,


                ])


            } else {
                List topicList = subscriptionLt*.topics
                List<Long> topicids = topicList.collect { it.id }
                List counts = dashBoardService.subscriptioncount(topicids)
                List resourcecount = dashBoardService.postscount(topicids)
                List trending = dashBoardService.trendtopics()

                List<Long> aa = trending.collect {
                    it.id

                }
                List subs2 = dashBoardService.subscriptioncount(aa)
                List topic2 = dashBoardService.postscount(aa)
                List<Resource1> resource = readingService.displayunread(session.name)
                User1 user = User1.findByUsername(session.name)
                render(view: "index", model: [user           : user1,
                                              userdata       : user,
                                              count_topic    : count_topic,
                                              count_subscribe: count_subscribe,
                                              subscriptions  : subscriptionLt,
                                              subscount      : counts,
                                              resourcecount  : resourcecount,
                                              trending       : trending,
                                              topic2         : topic2,
                                              subs2          : subs2,
                                              resource       : resource
                ])


            }
        }
    }




}