package link_sharing

class SearchController {

    def searchService

    def search()
        {
            println params.q


            List<String> resultSet = searchService.showSearch(params.q)
            println ">>>>>>>>>>>>>>>>>>>>>>>>"
            println resultSet
            if(resultSet)
                render view:'search',model:[result:resultSet]
            else
                redirect url:"/dashboard"
        }
    }


















