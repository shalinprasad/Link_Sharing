package link_sharing

class SignupController {
    def signupService
    def loginService

    def signup() {
        //print "inside cont"
        def signValue = signupService.register(params, request)
        if (signValue) {
            session.name = signValue.username
            flash.message="signUp succeed"
            //redirect(controller: "dashboard", action: "index")
        } else {
            flash.message="signUp Failure "
            redirect(url:'/')
        }
    }


    def login() {
        def loginValue = loginService.loginMethod(params)
        // println loginValue
        if (loginValue) {
            session.name = loginValue.username
            flash.message="login succeed"
            redirect(controller: "dashboard", action: "index")

        } else {
            flash.message="login failed"
            redirect(url:'/')
        }


    }


    def logout() {
        session.invalidate()
        redirect(url:'/')
    }





}