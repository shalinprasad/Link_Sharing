package link_sharing

import enums.Seriousness

class Subscription {


    Seriousness seriousness
    Date dateCreated

    static belongsTo = [user:User1,topics:Topic]

    static constraints = {

    }
}