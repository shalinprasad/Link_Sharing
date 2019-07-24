package link_sharing


class Reading_Item {
        Resource1 resource
        User1 user
        Boolean isRead
        static belongsTo = [user:User1,resource:Resource1]
        static constraints = {

        }
    }