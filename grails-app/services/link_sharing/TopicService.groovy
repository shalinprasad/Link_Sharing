package link_sharing

import grails.transaction.Transactional
import enums.*

import javax.mail.Session

@Transactional
class TopicService {
    def createTopic(params, email) {
        String tname = params.topicName
        println "params=" + params
        Visibility vi = Visibility.PRIVATE
        println "uemail = " + email
        User1 u = User1.findByUsername(email)
        Topic t = new Topic(name: params.topicName, visibilty: params.selection)
        u.addToTopics(t)
        if (t.validate()) {
            t.save(failOnError: true, flush: true)
            u.save(flush: true)

        } else {
            print 'Topic validation failed'
            print t.errors.getAllErrors()
        }
        Subscription sub = new Subscription(seriousness: Seriousness.VERY_SERIOUS)
        u.addToSubscriptions(sub)
        t.addToSubscriptions(sub)
        if (sub.validate()) {
            sub.save(failOnError: true, flush: true)
        } else {
            print sub.errors.getAllErrors()
        }
        print t.validate()
    }

    def showListMethod()
    {
        List<Topic> topicList = Topic.list()
        return topicList
    }

    def subscriptioncount(List userslist)
    {
        def usercounts=Subscription.createCriteria().list()
                {
                    projections{
                        count('user.id')
                        groupProperty('user.id')

                    }
                    'user'{
                        inList('id',userslist)
                    }
                }
        List <Integer> counts=userslist.collect{ x ->
            usercounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }
        }.collect{it.getAt(0)}
        return counts
    }
    def topiccount(List userslist)
    {
        def topcounts=Topic.createCriteria().list()
                {
                    projections{
                        count('user.id')
                        groupProperty('user.id')
                    }
                    'user'{
                        inList('id',userslist)
                    }
                }
        List <Integer> topiccount=userslist.collect{ x ->
            topcounts.find{
                if (it.getAt(1)==x)
                    return it.getAt(0)
            }
        }.collect{if(!it)
            return 0
        else
            it.getAt(0)}
        return topiccount
    }
    def post(String name) {
        User1 user = User1.findByUsername(name)
        List<Topic> t2 = Topic.createCriteria().list{
            projections{
                eq('user', user)
            }
        }
        return t2
    }
    def visibility(params){
        Topic t = Topic.get(params.id)
        println "params.visibility"+ params.visibility
        t.visibilty = params.visibility
        t.save(flush:true)
    }

}
