package link_sharing

class Resource_Rating {
    Resource1 resource
    User1 user
    Integer score

    static belongsTo = [user:User1, resource:Resource1]

    static constraints = {
        score range: 1..5, nullable: true
    }
}
