package link_sharing

import grails.test.mixin.*
import spock.lang.*

@TestFor(Reading_ItemController)
@Mock(Reading_Item)
class Reading_ItemControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.reading_ItemList
            model.reading_ItemCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.reading_Item!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def reading_Item = new Reading_Item()
            reading_Item.validate()
            controller.save(reading_Item)

        then:"The create view is rendered again with the correct model"
            model.reading_Item!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            reading_Item = new Reading_Item(params)

            controller.save(reading_Item)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/reading_Item/show/1'
            controller.flash.message != null
            Reading_Item.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def reading_Item = new Reading_Item(params)
            controller.show(reading_Item)

        then:"A model is populated containing the domain instance"
            model.reading_Item == reading_Item
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def reading_Item = new Reading_Item(params)
            controller.edit(reading_Item)

        then:"A model is populated containing the domain instance"
            model.reading_Item == reading_Item
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/reading_Item/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def reading_Item = new Reading_Item()
            reading_Item.validate()
            controller.update(reading_Item)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.reading_Item == reading_Item

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            reading_Item = new Reading_Item(params).save(flush: true)
            controller.update(reading_Item)

        then:"A redirect is issued to the show action"
            reading_Item != null
            response.redirectedUrl == "/reading_Item/show/$reading_Item.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/reading_Item/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def reading_Item = new Reading_Item(params).save(flush: true)

        then:"It exists"
            Reading_Item.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(reading_Item)

        then:"The instance is deleted"
            Reading_Item.count() == 0
            response.redirectedUrl == '/reading_Item/index'
            flash.message != null
    }
}
