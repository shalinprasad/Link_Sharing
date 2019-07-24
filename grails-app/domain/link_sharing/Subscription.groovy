package link_sharing

class Subscription {

    Topic topic
    User1 user
    Seriousness seriousness
    Date dateCreated

    static belongsTo = [user:User1,topic:Topic]

    static constraints = {

    }
}