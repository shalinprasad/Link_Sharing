package link_sharing

import enums.*

class Topic {


    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibilty
    User1 user
    static belongsTo = [user:User1]
    static hasMany = [resource:Resource1,subscriptions:Subscription]


    static constraints = {

    }
}
