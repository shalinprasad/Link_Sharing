package link_sharing

class Resource1 {
    String description
    User1 createdBy
    Topic topics
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topics:Topic,createdBy:User1]
    static hasMany = [readingItem:Reading_Item,resource:Resource_Rating]

    static constraints = {
        //description nullable:true,size:1..100

    }
}


class Link_Resource extends Resource1 {
    String url
    static constraints={

    }
}

class Document_Resource extends Resource1 {

    String  documentpath
    static constraints={
        documentpath nullble:true
    }

    }

