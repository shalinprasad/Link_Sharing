
package link_sharing
import enums.*
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {
    def topicService
    //def topicListService
    def create()
    {
        String email = session.name
        println "params.selection = "+email
        topicService.createTopic(params,email)
        //print "here"
        redirect(controller: "dashboard", action: "index")

    }


    def updateVisibility(){
        topicService.updateVisibility(params)
        redirect(controller: "dashboard" ,action: "index")
    }

}