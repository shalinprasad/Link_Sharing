package link_sharing

import grails.transaction.Transactional

@Transactional
class UserListService {

    def allUser() {

        List allUserList = User1.list()

        println ".,,,,,,,,.,,.,.,.,,,,,,,,,,,,,,,"+allUserList
        return allUserList;
    }
}
