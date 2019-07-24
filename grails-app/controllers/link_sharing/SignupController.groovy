package link_sharing

class SignupController {
    def signupService
    def loginService

    def index(){
        //print "inside cont"
        def signValue=signupService.register(params,request)
        if(signValue) {
        render "SignUp" }
        else {
            render "Sign Up Failed"
        }
    }



    def login() {
        def loginValue = loginService.loginMethod(params)
       // println loginValue
        if (loginValue) {
            session.name = loginValue.username
            redirect(controller:"dashboard",action:"index")

        }  else {
            render "Login Failed"
        }


    }








}