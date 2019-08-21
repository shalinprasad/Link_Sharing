package link_sharing

import grails.transaction.Transactional

@Transactional

class LoginService {
    def loginMethod(Map params) {
        String emailOrUsername = params.s_email
        String loginPassword = params.s_pwd
        User1 x = User1.findByEmail(emailOrUsername)
        if (x == null) {
            return null
        }
        if (!x.active) {
            return null
        } else {
            def fetchUser = User1.findByEmail(emailOrUsername)
            def fetchPassword = fetchUser.password

            if (loginPassword == fetchPassword) {
                return fetchUser
            } else {
                return null
            }
        }
    }
}
