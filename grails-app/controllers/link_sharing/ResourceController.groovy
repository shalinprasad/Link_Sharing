package link_sharing

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourceController {
//
//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
//
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Resource1.list(params), model:[resourceCount: Resource1.count()]
//    }
//
//    def show(Resource1 resource) {
//        respond resource
//    }
//
//    def create() {
//        respond new Resource1(params)
//    }
//
//    @Transactional
//    def save(Resource1 resource) {
//        if (resource == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        if (resource.hasErrors()) {
//            transactionStatus.setRollbackOnly()
//            respond resource.errors, view:'create'
//            return
//        }
//
//        resource.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'resource.label', default: 'Resource1'), resource.id])
//                redirect resource
//            }
//            '*' { respond resource, [status: CREATED] }
//        }
//    }
//
//    def edit(Resource1 resource) {
//        respond resource
//    }
//
//    @Transactional
//    def update(Resource1 resource) {
//        if (resource == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        if (resource.hasErrors()) {
//            transactionStatus.setRollbackOnly()
//            respond resource.errors, view:'edit'
//            return
//        }
//
//        resource.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'resource.label', default: 'Resource1'), resource.id])
//                redirect resource
//            }
//            '*'{ respond resource, [status: OK] }
//        }
//    }
//
//    @Transactional
//    def delete(Resource1 resource) {
//
//        if (resource == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        resource.delete flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'resource.label', default: 'Resource1'), resource.id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource1'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//    }


    def dashBoardService
    def resourceService
    def topicService
    def resource_RatingService

    def index() {
        if (!session.name) {
            render("Login reqired")
        } else {
            Resource1 res = Resource1.get(params.id)
            List trending = dashBoardService.trendtopics()
            List trending1 = trending.collect { it.id }
            List subcount = dashBoardService.subscriptioncount(trending1)
            List postcount = dashBoardService.postscount(trending1)
            def rating = resource_RatingService.readMethod(session.name, res)
            render(view: "rating", model: [resource: res, trending: trending, countforsubs: subcount, countforposts: postcount, value: rating])
        }
    }


    def editread(params) {
        if (!session.name) {
            render("Login required")
        } else{
            resourceService.editreadMethod(params.id1,session.name)
            redirect(controller: "dashboard", action: "index")
        }
    }


    def delete()
    {
        User1 user = User1.findByUsername(session.name)
        if(!user)
        {
            flash.message4 = "Please login first!"
            redirect url:'/'
        }
        Resource1 resource = Resource1.get(params.id)
        if(resource.hasProperty("documentPath"))
        {
            String location = '/home/shalin/Desktop/Link_Sharing/grails-app/assets/documents/'+resource.documentpath
            File file = new File(location)
            file.delete()
        }
        resource.delete(flush:true,failOnError:true)
        redirect controller:'dashboard',action:'index'
    }


    def postlist() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            User1 user = User1.findByUsername(session.name)
            List subscriptionLt = dashBoardService.subscriptions(session.name)
            List resources = Resource1.list()
            render(view: 'postlist', model: [list: resources, userdata: user, subscriptions: subscriptionLt])
        }
    }


}

