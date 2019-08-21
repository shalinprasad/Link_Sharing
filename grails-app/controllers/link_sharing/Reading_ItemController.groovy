package link_sharing

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Reading_ItemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Reading_Item.list(params), model: [reading_ItemCount: Reading_Item.count()]
    }

    def show(Reading_Item reading_Item) {
        respond reading_Item
    }

    def create() {
        respond new Reading_Item(params)
    }

    @Transactional
    def save(Reading_Item reading_Item) {
        if (reading_Item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (reading_Item.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond reading_Item.errors, view: 'create'
            return
        }

        reading_Item.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reading_Item.label', default: 'Reading_Item'), reading_Item.id])
                redirect reading_Item
            }
            '*' { respond reading_Item, [status: CREATED] }
        }
    }

    def edit(Reading_Item reading_Item) {
        respond reading_Item
    }

    @Transactional
    def update(Reading_Item reading_Item) {
        if (reading_Item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (reading_Item.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond reading_Item.errors, view: 'edit'
            return
        }

        reading_Item.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'reading_Item.label', default: 'Reading_Item'), reading_Item.id])
                redirect reading_Item
            }
            '*' { respond reading_Item, [status: OK] }
        }
    }

    @Transactional
    def delete(Reading_Item reading_Item) {

        if (reading_Item == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        reading_Item.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'reading_Item.label', default: 'Reading_Item'), reading_Item.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reading_Item.label', default: 'Reading_Item'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
