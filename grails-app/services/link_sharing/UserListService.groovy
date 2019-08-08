package link_sharing

import grails.transaction.Transactional

@Transactional
class UserListService {

    def allUser() {
        List allUserList = User1.list()
        return allUserList;

    }
    def changerPermission(String name){
        User1 u = User1.findByEmail(name)
        if(u.id != 1) {
            if (u.active) {
                u.active = false
            } else {
                u.active = true
            }
            u.save(failOnError: true, flush: true)
            return u
        }
    }
    def adminMethod(String name){
        User1 u = User1.findByEmail(name)
        if(u.id != 1) {
            if (u.admin) {
                u.admin = false
            } else {
                u.admin = true
            }
        }
        u.save(failOnError: true, flush: true)
        return u
    }

}
