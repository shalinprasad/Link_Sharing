package link_sharing

class Topic {


    String name
    User1 user//createdBy
    Date dateCreated
    Date lastUpdated

    Visibility visibilty
    static belongsTo = [user:User1]
    static hasMany = [resource:Resource1,subscription:Subscription]


    static constraints = {

    }
}
