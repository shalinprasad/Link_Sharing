package link_sharing

class DocumentController {

    def documentService

    def save() {
        println ".,,,,,,,,.,,.,.,.,,,,,,,,,,,,,,,"+session.name
        documentService.saveDoc(params,request,session.name)
        redirect(controller: "Dashboard", action: "index")
    }


    def saveLink(){
        documentService.saveLink(params,request,session.name)
        redirect(controller: "Dashboard", action: "index")
    }



}