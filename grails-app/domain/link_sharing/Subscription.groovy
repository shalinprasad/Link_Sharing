package link_sharing

import enums.Seriousness

class Subscription {

    Topic topics
    User1 user
    Seriousness seriousness
    Date dateCreated

    static belongsTo = [user:User1,topics:Topic]

    static constraints = {

    }
}