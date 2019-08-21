package link_sharing

import enums.Visibility
import grails.transaction.Transactional

@Transactional
class ProfileService {

    def update(params, request, user) {
        user.firstName = params.fname
        user.lastName = params.lname
        user.username = params.username
        user.save(failOnError: true, flush: true)
        def des = request.getFile('inputphoto')
        if (des) {
            File file = new File("/home/shalin/Desktop/Link_Sharing/grails-app/assets/images/${params.username}.jpg")
            des.transferTo(file)
        }
        String photo1 = "${params.username}.jpg"
        user.photo = photo1
        user.save(failOnError: true, flush: true)
    }

    def updatepass(params, user) {
        user.password = params.password
        user.save(failOnError: true, flush: true)
        return 1
    }

    def topicsList(sessionname) {
        User1 user1 = User1.findByUsername(sessionname)
        List interTopic = Topic.createCriteria().list {
            eq('visibilty', Visibility.PUBLIC)
            eq("user.id", user1.id)
        }
        return interTopic
    }

    def allTopics(sessionname) {
        User1 user1 = User1.findByUsername(sessionname)
        List interTopic = Topic.createCriteria().list {
            eq("user.id", user1.id)
        }
        return interTopic
    }


    def topTopicsPosts(List<Topic> trending) {
        if (trending) {
            List abcd = Resource1.createCriteria().list(max: 5)
                    {
                        projections {
                            count('topics.id')
                            groupProperty('topics.id')
                        }
                    }
            abcd.sort { b, a -> a.getAt(0) <=> b.getAt(0) }
            List<Integer> xyz = trending.collect { x ->
                abcd.find {
                    if (it.getAt(1) == x.id)
                        return it.getAt(0)
                    else
                        return 0
                }
            }
            List x = xyz.collect {
                if (!it)
                    return 0
                else
                    return it.getAt(0)
            }
            return x
        }
    }

    def topTopicSubs(List<Topic> trending) {
        if (trending) {
            def topiccounts = Subscription.createCriteria().list()
                    {
                        projections {
                            count('topics.id')
                            groupProperty('topics.id')
                        }
                        'topics' {
                            inList('id', trending.id)
                        }
                    }
            List<Integer> counts = trending.collect { x ->
                topiccounts.find {
                    if (it.getAt(1) == x.id)
                        return it.getAt(0)
                }
            }
            List l = counts.collect {
                if (!it)
                    return 0
                else
                    return it.getAt(0)
            }
            return l
        }


    }
}
