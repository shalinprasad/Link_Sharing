package link_sharing

import enums.Visibility
import grails.transaction.Transactional

@Transactional
class DashBoardService {

    def tCount(String name){
        User1 user = User1.findByUsername(name)
        Integer topicCount = user.topics.size()
        return topicCount
    }

    def sCount(String name) {
        User1 user1 = User1.findByUsername(name)    
        Integer subscriptionCount = user1.subscriptions.size()
        return subscriptionCount
    }

    def subscriptions(String name) {
        User1 user = User1.findByUsername(name)
        List<Long> subscriptionList = Subscription.createCriteria().list {
            eq("user.id", user.id)
        }
        subscriptionList.sort { b, a -> a.topics.lastUpdated <=> b.topics.lastUpdated }
        return subscriptionList
    }

    def subscriptioncount(List topicids) {
        def topiccounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('topics.id')
                        groupProperty('topics.id')
                    }
                    'topics' {
                        inList('id', topicids)
                    }
                }

        List<Integer> counts = topicids.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }

        }.collect { it.getAt(0) }
        return counts
    }

    def postscount(List topicids) {
        def rescounts = Resource1.createCriteria().list()
                {
                    projections {
                        count('topics.id')
                        groupProperty('topics.id')

                    }
                    'topics' {
                        inList('id', topicids)
                    }
                }

        List<Integer> resourcecount = topicids.collect { x ->
            rescounts.find {

                if (it.getAt(1) == x)
                    return it.getAt(0)
            }

        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }
        return resourcecount

    }
    def trendtopics(){
        List interTopic = Topic.createCriteria().list{
            eq('visibilty', Visibility.PUBLIC)
        }.sort{a,b -> b.resource.size()<=>a.resource.size()}
        List<Topic> topicList1 = []
        def i = 0
        while(i < 5 && interTopic.size()>i) {
            topicList1.add(interTopic.get(i))
            i++
        }
        return topicList1
    }

    def topTopicsPosts() {
        List<Long> topicsid = Topic.list().collect {
            it.id
        }

        List abcd = Resource1.createCriteria().list(max: 5)
                {
                    projections {
                        count('topics.id')
                        groupProperty('topics.id')

                    }

                }

        abcd.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
        List<Integer> xyz = topicsid.collect { x ->
            abcd.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
                else
                    return 0
            }
        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }
        return xyz
    }

    def topTopicSubs() {
        List<Long> topicsid = Topic.list().collect {
            it.id
        }
        def topiccounts = Subscription.createCriteria().list()
                {
                    projections {
                        count('topics.id')
                        groupProperty('topics.id')
                    }
                    'topics' {
                        inList('id', topicsid)
                    }
                }

        List<Integer> counts = topicsid.collect { x ->
            topiccounts.find {
                if (it.getAt(1) == x)
                    return it.getAt(0)
            }
        }.collect {
            if (!it)
                return 0
            else
                it.getAt(0)
        }
        return counts
    }
}






























