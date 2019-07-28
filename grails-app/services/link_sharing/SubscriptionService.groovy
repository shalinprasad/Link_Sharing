package link_sharing

import grails.transaction.Transactional

@Transactional
class SubscriptionService {


    def seriousness(params) {
        Subscription s = Subscription.get(params.id)
        s.seriousness = params.seriousness
    }

}