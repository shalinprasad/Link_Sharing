package link_sharing

class Resource1 {
    String decription
    User1 createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingItem:Reading_Item,resourceRated:Resource_Rating]
    static belongsTo = [topic:Topic,createdBy:User1]
    static constraints = {
        description nullable:true,size:1..100

    }
}


class Link_Resource extends Resource1 {
    String url
}

class Document_Resource extends Resource1 {

    String filePath
}
