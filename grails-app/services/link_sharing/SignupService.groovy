package link_sharing

import enums.Visibility
import grails.transaction.Transactional
import link_sharing.User1

@Transactional

class SignupService {

    def register(params, request) {
        String password = params.password
        String confirmpassword = params.confirmpassword
        if (confirmpassword.compareTo(password) != 0) {
            return 0
        } else {
            String firstname = params.firstname
            String lastname = params.lastname
            String email = params.signup_email
            String username = params.username
            Boolean admin = 0
            Boolean active = 1
            def s = request.getFile('inputphoto')
            String sName = s.getOriginalFilename()
            String image = username + sName
            String location = '/home/shalin/Desktop/Link_Sharing/grails-app/assets/images/' + image
            File dest = new File(location)
            s.transferTo(dest)
            User1 user2 = new User1(firstName: firstname, lastName: lastname, email: email, username: username, password: password, admin: admin, active: active, photo: image)
            user2.save(flush: true, failOnError: true, validate: true)
        }
    }

    List<Resource1> recentShare() {
        List<Resource1> recentShare = Resource1.createCriteria().list(max: 5) {
            'topics' {
                eq('visibilty', Visibility.PUBLIC)
            }
        }
        recentShare.sort { Resource1 r2, Resource1 r1 -> r1.dateCreated <=> r2.dateCreated }
    }

    List<Resource1> postList() {
        List<Resource1> topPosts = Resource_Rating.createCriteria().list(max: 5) {
            projections {
                avg("score")
                groupProperty("resource.id")
            }
            'resource' {
                'topics' {
                    eq('visibilty', Visibility.PUBLIC)
                }
            }
        }
        List<Long> resIds = topPosts.collect { it.getAt(1) }
        return resIds
    }

}


