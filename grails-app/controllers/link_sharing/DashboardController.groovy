package link_sharing

class DashboardController {
    def index() {
        println session.name
        User1 user =User1.findByUsername(session.name)
        //println user
        render(view:"index",model:[user:user])
    }
}
