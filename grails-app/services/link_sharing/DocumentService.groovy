package link_sharing

import grails.transaction.Transactional

@Transactional
class DocumentService {

    def saveDoc(params, request, email) {
        User1 user1 = User1.findByUsername(email)
        String uname = user1.username
        String description1 = params.select
        String tname = params.topics
        def tobj = Topic.findByName(tname)
        Long tID = tobj.id
        def f = request.getFile('document')
        String fName = f.getOriginalFilename()
        String fname = f.getOriginalFilename()
        String fpath = '/home/shalin/Desktop/Link_Sharing/grails-app/assets/documents/' + uname + fName
        File des = new File(fpath)
        f.transferTo(des)
        Document_Resource newRes = new Document_Resource(description: description1, topics: tID, documentpath: fpath)
        user1.addToResource(newRes)
        tobj.addToResource(newRes)
        newRes.save(flush: true, failOnError: true)
        List<User1> userids = Subscription.createCriteria().list {
            projections {
                property("user.id")
            }
            eq("topics.id", tID)
        }
        Boolean isRead = false
        userids.each {
            User1 us = User1.get(it)
            Reading_Item ri = new Reading_Item(isRead: isRead, resource: newRes, user: us)
            ri.save(failOnError: true, flush: true)
            us.addToReadingItems(ri)
            newRes.addToReadingItem(ri)
            us.save(flush:true,failOnError:true)
            newRes.save(flush:true,failOnError:true)
        }
    }
    def saveLink(params, request, email) {
        User1 user1 = User1.findByUsername(email)
        String uname = user1.username
        String description1 = params.selectlink
        String tname = params.topics
        def tobj = Topic.findByName(tname)
//        Integer tID = tobj.id
         Long tID = tobj.id
        String link = params.linkres

        Link_Resource newRes = new Link_Resource(description: description1, topics: tID, url: link)
        user1.addToResource(newRes)
        tobj.addToResource(newRes)
        newRes.save(flush: true, failOnError: true)
        List<User1> userids = Subscription.createCriteria().list {
            projections {
                property("user.id")
            }
            eq("topics.id", tID)
        }
        Boolean isRead = false
        userids.each {
            User1 us = User1.get(it)
            Reading_Item ri = new Reading_Item(isRead: isRead, resource: newRes, user: us)
            ri.save(failOnError: true, flush: true)
            us.addToReadingItems(ri)
            newRes.addToReadingItem(ri)
            us.save(flush:true,failOnError:true)
            newRes.save(flush:true,failOnError:true)
        }


    }
}




















