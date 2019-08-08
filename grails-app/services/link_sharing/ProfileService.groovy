package link_sharing

import grails.transaction.Transactional

@Transactional
class ProfileService {

    def update(params,request,user) {
        user.firstName=params.fname
        user.lastName=params.lname
        user.username=params.username
        user.save(failOnError: true, flush: true)

        def des = request.getFile('inputphoto')

        if(des){
            File file=new File( "/home/shalin/Desktop/Link_Sharing/grails-app/assets/images/${params.username}.jpg")
            des.transferTo(file)
        }
        String photo1 = "${params.username}.jpg"
        user.photo=photo1
        user.save(failOnError: true, flush: true)
    }
    def updatepass(params,user){
        user.password=params.password
        user.save(failOnError: true, flush: true)
        return 1
    }
}

