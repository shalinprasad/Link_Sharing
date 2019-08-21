package link_sharing

class SearchController {

    def searchService

    def search(params) {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            List<String> resultSet = searchService.showSearch(params.q)
            if (resultSet)
                render view: 'search', model: [result: resultSet]
            else {
                flash.message6 = "No result Found"
                redirect(controller:"Dashboard",action:"index")
            }
        }
    }



}


















