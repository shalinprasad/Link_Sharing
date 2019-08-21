package link_sharing

class SignupController {
    def signupService
    def loginService

    def index() {
        def recent = signupService.recentShare()
        def postListt = signupService.postList()
        [posts: postListt, resources: recent]
    }

    def signup() {
        Boolean user = User1.findByUsernameOrEmail(params.username, params.signup_email)
        if (user) {
            flash.message3 = "Username or Email already exist"
            redirect(url: '/')
        } else {
            def signValue = signupService.register(params, request)
            if (signValue) {
                session.name = signValue.username
                flash.message = "signUp succeed"
                redirect(controller: "dashboard", action: "index")
            } else {
                flash.message = "signUp Failure "
                redirect(url: '/')
            }
        }
    }

    def login() {
        String emailOrUsername = params.s_email
        User1 user = User1.findByEmail(emailOrUsername)
        if (user == null) {
            flash.message = "Login failed"
        }
        def loginValue = loginService.loginMethod(params)
        if (loginValue) {
            session.name = loginValue.username
            flash.message = "login succeed"
            redirect(controller: "dashboard", action: "index")

        } else {
            flash.message = "login failed"
            redirect(url: '/')
        }
    }
    def logout() {
        session.invalidate()
        redirect(url: '/')
    }
}

