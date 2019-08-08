package link_sharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {
    def seriousness(params) {
        Subscription s = Subscription.get(params.id)
        s.seriousness = params.seriousness
    }
    def unsubscribeMethod(Long sid) {
        Subscription sub = Subscription.get(sid)
        println(sub)
        sub.delete(flush: true, failOnError: true)
    }
    def  deletePost(params){
        Long topic_id = Long.parseLong(params.variable1)
        String email = params.variable2
        Topic t1 = Topic.findById(topic_id)
        t1.delete(flush: true)
    }



}