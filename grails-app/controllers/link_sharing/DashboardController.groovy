package link_sharing

class DashboardController {

    def dashBoardService




    def index() {
        println session.name
        User1 user1 = User1.findByUsername(session.name)
        //dashboardService.methodName()
        //render(view:"index",model:[user:user])
        println session.name
       Integer count_topic = dashBoardService.tCount(session.name)

        Integer  count_subscribe= dashBoardService.sCount(session.name)
        println session.name
//newwwwwwwwwwwwww



        List  subscriptionLt=dashBoardService.subscriptions(session.name)
        print subscriptionLt

        List topicList=subscriptionLt*.topics

        List<Long>topicids = topicList.collect{it.id}

        List counts=dashBoardService.subscriptioncount(topicids)
        List resourcecount=dashBoardService.postscount(topicids)

        List trending=dashBoardService.trendtopics()

        User1 user =User1.findByUsername(session.name)


        render(view: "index" ,model : [user : user ,
                                           userdata: user1,
                                           count_topic : count_topic ,
                                           count_subscribe  : count_subscribe ,
                                           subscriptions : subscriptionLt,
                                           subscount:counts,
                                           resourcecount:resourcecount ,
                                           trending : trending])



        //render(view: "index", model: [user: user,topicCount:topicCount,total:subs,subName:subs1])


    }




}
