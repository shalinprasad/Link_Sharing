package link_sharing

class ProfileController {

    def dashboardService
    def profileService
    def topicService

    def profile(params,request){
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            def update = profileService.update(params, request, user)
            redirect(controller: "signup", action: "logout")
        }
    }

    def password() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            def updatepass = profileService.updatepass(params, user)
            redirect(controller: "signup", action: "logout")

        }
    }
}
