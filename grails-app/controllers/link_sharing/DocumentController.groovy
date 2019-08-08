package link_sharing

class DocumentController {

    def documentService

    def save() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            if(!params.select)
            {
                flash.message4="Please provide the description"
                redirect(controller: "dashboard",action: "index")
            }
           else {
                documentService.saveDoc(params, request, session.name)
                redirect(controller: "Dashboard", action: "index")
            }
        }
    }


    def saveLink() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            if (!(params.selectlink && params.linkres)) {
                flash.message4 = "Please provide the  link description"
                redirect(controller: "dashboard", action: "index")
            } else {
                documentService.saveLink(params, request, session.name)
                redirect(controller: "Dashboard", action: "index")
            }
        }
    }

    def download()
    {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            Long id = Long.parseLong(params.id)
            Document_Resource dr = (Document_Resource) Resource1.get(id)
            if (dr == null) {
                redirect(controller: "Dashboard", action: "index")
            } else {
                User1 user = User1.findByUsername(session.name)
                def file = new File("/home/shalin/Pictures/grailsDocs/")
                def temp = new File(dr.documentpath)
                if (temp.exists()) {
                    file = temp
                } else {
                    file = null
                }
                response.setHeader("Content-disposition", "attachment;filename=\"${dr.documentpath}\"")
                response.outputStream << file.bytes
            }

        }

    }




}