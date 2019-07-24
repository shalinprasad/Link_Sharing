package link_sharing

import grails.transaction.Transactional
import link_sharing.User1

@Transactional

    class SignupService{

        def register(params,request) {

            String password = params.password
            String confirmpassword = params.confirmpassword

            if(confirmpassword.compareTo(password)!=0)
            {
                return 0
            }
            else {
                String firstname = params.firstname
            String lastname = params.lastname
            String email = params.signup_email
            String username = params.username
            //String password = params.password
            //String confirmpassword = params.confirmpassword
            Boolean admin = 0
            Boolean active = 1


                def s=request.getFile('image')
                String location='/home/shalin/Desktop/Link_Sharing/src/userPhoto/'+ username
                File dest=new File(location)
                s.transferTo(dest)

            User1 user2 = new User1(firstName: firstname,lastName: lastname,email:email,username:username,password:password,admin:admin,active:active,photo:location)
            user2.save(flush:true,failOnError:true,validate:true)


        }
}
    }

