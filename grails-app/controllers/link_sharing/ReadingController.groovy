package link_sharing

class ReadingController {
    def readingService

    def editread() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            readingService.editreadMethod(params, session.name)
            redirect(controller: "dashboard", action: "index")
        }
    }

    def delete() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            readingService.deleteMethod(params)
            redirect(controller: "dashboard", action: "index")
        }
    }
}
