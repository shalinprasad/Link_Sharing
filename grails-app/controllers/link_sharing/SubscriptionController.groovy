package link_sharing

class SubscriptionController {
  def subscriptionService

    def updateSerious() {
        subscriptionService.seriousness(params)
        redirect(controller: "dashboard", action: "index")
   }

}