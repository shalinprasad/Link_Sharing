package link_sharing

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class UserController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User1.list(params), model: [userCount: User1.count()]
    }

    def show(User1 user) {
        respond user
    }


    def action() {

    }

    def create() {
        respond new User1(params)
    }

    @Transactional
    def save(User1 user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view: 'create'
            return
        }

        user.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User1'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(User1 user) {
        respond user
    }

    @Transactional
    def update(User1 user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view: 'edit'
            return
        }

        user.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User1'), user.id])
                redirect user
            }
            '*' { respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User1 user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User1'), user.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User1'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    static class SignupController {

        def index() {}
    }
    def userListService
    def dashBoardService

    def findUser() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            List<User1> listAll = userListService.allUser();
            render(view: "userList", model: [listAll1: listAll])

        }
    }

    def myaction() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {

            Integer count_topic = dashBoardService.tCount(session.name)
            Integer count_subscribe = dashBoardService.sCount(session.name)
            List subscriptionLt = dashBoardService.subscriptions(session.name)
            User1 user1 = User1.findByUsername(session.name)
            render(view: "EditProfile", model: [userdata: user1, subscriptions: subscriptionLt, count_topic: count_topic, count_subscribe: count_subscribe])
        }
    }

    def changeAdminPermission() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            String key = params.variable1
            println "Valie in controller = " + key
            userListService.changerPermission(key)
            redirect(action: "findUser")
        }
    }

    def makeAdmin() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            String key = params.variable2
            userListService.adminMethod(key)
            redirect(action: "findUser")
        }
    }
    def mailService
    def passreset() {
        User1 user = User1.findByEmail(params.email)
        if (!user) {
            flash.message = "User Doesn't Exist"
            redirect(url: '/')
        } else {
            session.username = params.email
            String link = createLink(controller: 'User', action: 'resetpass', params: [email: user.email], absolute: true)
            mailService.sendMail {
                to "${user.email}"
                subject "Hello .Change password link "
                text link
            }
        }
    }

    def resetpass() {
        render(view: 'password', model: [email: params.email])
    }

    def changepassword() {
        User1 user = User1.findByEmail(params.email)
        User1 user1 = User1.findByEmail(session.username)
        if(user) {
            if (session.username != user.email) {
                session.invalidate()
                flash.message = "Suspicious activity found"
                redirect(url: '/')
            } else {
                user.password = params.password
                user.save(flush: true)
                flash.message = "Password changed "
                redirect(url: "/")
            }
        }
        else{ flash.message = "Please Sign Up"
            redirect(url: '/')}
    }
}
