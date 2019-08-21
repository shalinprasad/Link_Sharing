package link_sharing

import enums.Visibility
import grails.transaction.Transactional

@Transactional
class DashBoardService {

    def tCount(String name) {
        Integer topicCount = User1.findByUsername(name).topics.size()
        return topicCount
    }

    def sCount(String name) {
        Integer subscriptionCount = User1.findByUsername(name).subscriptions.size()
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

    def trendtopics() {
        List interTopic = Topic.createCriteria().list {
            eq('visibilty', Visibility.PUBLIC)
        }.sort { a, b -> b.resource.size() <=> a.resource.size() }
        List<Topic> topicList1 = []

        for (int i = 0; i < 5 && interTopic.size() > i; i++) {
            topicList1.add(interTopic.get(i))

        }
        return topicList1
    }

}






























