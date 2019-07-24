package link_sharing

import grails.transaction.Transactional

@Transactional

class LoginService {


    def loginMethod(Map params) {
        String emailOrUsername = params.s_email
        String loginPassword = params.s_pwd

        if(emailOrUsername == null || loginPassword == null){
            return 0
        }
        else {

            def fetchUser = User1.findByEmail(emailOrUsername)

            def fetchPassword = fetchUser.password

            def fetchEmail    = fetchUser.email

            if(fetchEmail != email)
            {
             return 0;
            }

            if(loginPassword == fetchPassword){
                return fetchUser
            }else{
                return 0;
            }
        }
    }
}

