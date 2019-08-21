package link_sharing

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Resource_RatingController {

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
//
//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond Resource_Rating.list(params), model:[resource_RatingCount: Resource_Rating.count()]
//    }
//
//    def show(Resource_Rating resource_Rating) {
//        respond resource_Rating
//    }
//
//    def create() {
//        respond new Resource_Rating(params)
//    }
//
//    @Transactional
//    def save(Resource_Rating resource_Rating) {
//        if (resource_Rating == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        if (resource_Rating.hasErrors()) {
//            transactionStatus.setRollbackOnly()
//            respond resource_Rating.errors, view:'create'
//            return
//        }
//
//        resource_Rating.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'resource_Rating.label', default: 'Resource_Rating'), resource_Rating.id])
//                redirect resource_Rating
//            }
//            '*' { respond resource_Rating, [status: CREATED] }
//        }
//    }
//
//    def edit(Resource_Rating resource_Rating) {
//        respond resource_Rating
//    }
//
//    @Transactional
//    def update(Resource_Rating resource_Rating) {
//        if (resource_Rating == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        if (resource_Rating.hasErrors()) {
//            transactionStatus.setRollbackOnly()
//            respond resource_Rating.errors, view:'edit'
//            return
//        }
//
//        resource_Rating.save flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'resource_Rating.label', default: 'Resource_Rating'), resource_Rating.id])
//                redirect resource_Rating
//            }
//            '*'{ respond resource_Rating, [status: OK] }
//        }
//    }
//
//    @Transactional
//    def delete(Resource_Rating resource_Rating) {
//
//        if (resource_Rating == null) {
//            transactionStatus.setRollbackOnly()
//            notFound()
//            return
//        }
//
//        resource_Rating.delete flush:true
//
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'resource_Rating.label', default: 'Resource_Rating'), resource_Rating.id])
//                redirect action:"index", method:"GET"
//            }
//            '*'{ render status: NO_CONTENT }
//        }
//    }
//
//    protected void notFound() {
//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource_Rating.label', default: 'Resource_Rating'), params.id])
//                redirect action: "index", method: "GET"
//            }
//            '*'{ render status: NOT_FOUND }
//        }
//
//    }
    def Resource_RatingService

    def save() {
        if (!session.name) {
            flash.message = "Login First"
            redirect(url: "/")
        } else {
            println"checking rating"+params
            Resource_RatingService.saveMethod(params)
            render([success: true] as JSON)
        }

    }

}
