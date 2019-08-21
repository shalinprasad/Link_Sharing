package link_sharing

import grails.transaction.Transactional

@Transactional
class ResourceService {

    def editreadMethod(identifier, String username) {
        User1 user = User1.findByUsername(username)
        Long id = Long.parseLong(identifier)
        Reading_Item ri = Reading_Item.createCriteria().get {
            eq('resource.id', id)
            eq('user.id', user.id)
        }
        ri.isRead = true
        ri.save(flush: true)
        println "This is final stage" + ri.isRead

    }
}
