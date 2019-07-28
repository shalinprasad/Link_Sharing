package link_sharing

import grails.transaction.Transactional

@Transactional
class DashBoardService {

    def tCount(String name) {
        User1 user=User1.findByUsername(name)
        Integer topicCount=user.topics.size()
        println topicCount;
        return topicCount

    }



    def sCount(String name) {
        User1 user1 = User1.findByUsername(name)
        Integer subscriptionCount = user1.subscriptions.size()
        // println topicCount;
        return subscriptionCount
    }

   // Subscription


    def subscriptions(String name) {
        User1 user =User1.findByUsername(name)

        List<Long> subscriptionList = Subscription.createCriteria().list{
            eq("user.id",user.id)
        }

        //print subscriptionList
        subscriptionList.sort{b,a-> a.topics.lastUpdated<=>b.topics.lastUpdated}
        //print subscriptionList
        return subscriptionList

    }

    def subscriptioncount(List topicids)
    {
        def topiccounts=Subscription.createCriteria().list()
                {
                    projections{
                        count('topics.id')
                        groupProperty('topics.id')
                        // countDistinct('topic.id')
                    }
                    'topics'{
                        inList('id',topicids)
                    }
                }

        List <Integer> counts = topicids.collect{ x ->
            topiccounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{it.getAt(0)}
        return counts
    }
// for displaying topic  which has more resources as a trending topic
    def postscount(List topicids)
    {
        def rescounts=Resource1.createCriteria().list()
                {
                    projections{
                        count('topics.id')
                        groupProperty('topics.id')
                        // countDistinct('topic.id')
                    }
                    'topics'{
                        inList('id',topicids)
                    }
                }

        List <Integer> resourcecount=topicids.collect{ x ->
            rescounts.find{

                if (it.getAt(1)==x)
                    return it.getAt(0)
            }

        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}

        return resourcecount

    }

    def trendtopics()
    {
        List <Long> topicsid=Topic.list().collect{
            it.id
        }

        List abcd=Resource1.createCriteria().list(max:5)
                {
                    projections{
                        count('topics.id')
                        groupProperty('topics.id')

                    }


                }

        abcd.sort{b,a-> a.getAt(0)<=>b.getAt(0)}

        List <Integer> xyz=topicsid.collect{ x ->
            abcd.find{

                if (it.getAt(1)==x)
                    return it.getAt(0)
                else
                    return 0

            }

        }.collect{if(!it)
            return 0
        else
            it.getAt(1)}
        xyz.removeAll{it==0}
        List bbb= xyz+(topicsid-xyz)
        List <Topic> topicstrendy=Topic.createCriteria().list{
            inList('id' , bbb)

        }
        return topicstrendy
    }


}
