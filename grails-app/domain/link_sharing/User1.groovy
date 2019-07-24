package link_sharing

class User1 {
    String email
    String username
    String password
    String firstName
    String lastName
    String photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated

    static hasMany = [subscription: Subscription, topic: Topic, resource: Resource1, readItem: Reading_Item, resourceRated: Resource_Rating]


    static constraints = {
        photo(nullable: true)
        username(unique: true)
    }
    static mappings = {
       // lastUpdated column : "DATE_UPDATED"
    }

}
