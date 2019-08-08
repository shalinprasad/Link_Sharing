package link_sharing

import enums.*


class BootStrap {

    def init = { servletContext ->

//        User1 user1 = new User1(firstName:"Shalin",lastName: "Prasad",email: "shalinprasad99@gmail.com",username: "shalin",password: "12345",admin:true,active:true)
////        User1 user2 = new User1(firstName:"Vaibhav",lastName: "S",email: "vaibhav@gmail.com",username: "vsh",password: "12345",admin:false,active:true)
////        User1 user3 = new User1(firstName:"Saurabh",lastName: "kumar",email: "saurabh@gmail.com",username: "ssr",password: "12345",admin:false,active:true)
////        User1 user4 = new User1(firstName:"Rahul",lastName: "Kumar",email: "rahul@gmail.com",username: "rahul",password: "12345",admin:true,active:true)
////        User1 user5 = new User1(firstName:"Manish",lastName: "Kumar",email: "manish@gmail.com",username: "mbt",password: "12345",admin:true,active:true)
////
//
//
//        Topic topic1 = new Topic(name:"Constructor",visibilty:Visibility.PUBLIC)
//        Topic topic2 = new Topic(name:"Inheritance",visibilty:Visibility.PUBLIC)
//        Topic topic3 = new Topic(name:"Encapsulation",visibilty:Visibility.PUBLIC)
//        Topic topic4 = new Topic(name:"ABSTRACTION",visibilty:Visibility.PUBLIC)
//        Topic topic5 = new Topic(name:"MEMORY", visibilty:Visibility.PUBLIC)
//
//
//
//
//
//        user1.addToTopics(topic1)
//        user1.save(flush:true,failOnError: true)
//        topic1.save(flush:true,failOnError: true)
//        user1.addToTopics(topic2)
//        user1.save(flush:true,failOnError: true)
//        topic2.save(flush:true,failOnError: true)
//
//        user2.addToTopics(topic3)
//        user2.save(flush:true,failOnError: true)
//        topic3.save(flush:true,failOnError: true)
//
//
//
//        user3.addToTopics(topic4)
//        user3.save(flush:true,failOnError: true)
//        topic4.save(flush:true,failOnError: true)
//
//
//        user4.addToTopics(topic5)
//        user4.save(flush:true,failOnError: true)
//        topic5.save(flush:true,failOnError: true)
//
//
//        user5.addToTopics(topic1)
//        user5.save(flush:true,failOnError: true)
//        topic1.save(flush:true,failOnError: true)
//
//
//
//        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
//        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
//        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
//        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic4)
//        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic5)
//
//
//
//
//
//
//
//        user1.addToSubscriptions(s1)
//        user2.addToSubscriptions(s2)
//        user3.addToSubscriptions(s3)
//        user4.addToSubscriptions(s4)
//        user5.addToSubscriptions(s5)
//
//        topic1.addToSubscriptions(s1)
//        topic2.addToSubscriptions(s2)
//        topic3.addToSubscriptions(s3)
//        topic4.addToSubscriptions(s4)
//        topic5.addToSubscriptions(s5)
//
//
//
//        s1.save(flush:true,failOnError:true)
//        s2.save(flush:true,failOnError:true)
//        s3.save(flush:true,failOnError:true)
//        s4.save(flush:true,failOnError:true)
//        s5.save(flush:true,failOnError:true)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//        Resource1 resource1 = new Resource1(description:"Resource-1",topics:topic1)
//        Resource1 resource2 = new Resource1(description:"Resource-2",topics:topic2)
//        Resource1 resource3 = new Resource1(description:"Resource-3",topics:topic3)
//        Resource1 resource4 = new Resource1(description:"Resource-4",topics:topic4)
//        Resource1 resource5 = new Resource1(description:"Resource-5",topics:topic5)
//
//        user1.addToResource(resource1)
//        user1.save(flush:true,failOnError: true)
//
//        user2.addToResource(resource2)
//        user2.save(flush:true,failOnError: true)
//
//        user3.addToResource(resource3)
//        user3.save(flush:true,failOnError: true)
//
//        user4.addToResource(resource4)
//        user4.save(flush:true,failOnError: true)
//
//        user5.addToResource(resource5)
//        user5.save(flush:true,failOnError: true)
//
//        topic1.addToResource(resource1)
//        topic1.save(flush:true,failOnError: true)
//
//        topic2.addToResource(resource2)
//        topic2.save(flush:true,failOnError: true)
//
//        topic3.addToResource(resource3)
//        topic3.save(flush:true,failOnError: true)
//
//        topic4.addToResource(resource4)
//        topic4.save(flush:true,failOnError: true)
//
//        topic5.addToResource(resource5)
//        topic5.save(flush:true,failOnError: true)
//
//
//
//        resource1.save(flush:true,failOnError:true)
//        resource2.save(flush:true,failOnError:true)
//        resource3.save(flush:true,failOnError:true)
//        resource4.save(flush:true,failOnError:true)
//        resource5.save(flush:true,failOnError:true)
//
//
//
//
//
        User1 u1=new User1(firstName:"Shalin",lastName: "Prasad",email: "shalinprasad24@gmail.com",username: "shalin",password: "12345",admin:true,active:true)
        User1 u2=new User1(firstName:"Vaibhav",lastName: "S",email: "shalinprasad01gmail.com",username: "vsh",password: "12345",admin:false,active:true)
        User1 u3=new User1(firstName:"Saurabh",lastName: "kumar",email: "saurabh@gmail.com",username: "ssr",password: "12345",admin:false,active:true)
        User1 u4=new User1(firstName:"Rahul",lastName: "Kumar",email: "rahul@gmail.com",username: "rahul",password: "12345",admin:true,active:true)

        u1.save(flush:true,failOnError:true)
        Topic topic1 = new Topic(name:"html",visibilty:Visibility.PUBLIC)
        Topic topic2 = new Topic(name:"css",visibilty:Visibility.PUBLIC)
        Topic topic3 = new Topic(name:"javascript",visibilty:Visibility.PUBLIC)
        Topic topic11 = new Topic(name:"groovy",visibilty:Visibility.PRIVATE)
        Topic topic12 = new Topic(name:"grails",visibilty:Visibility.PUBLIC)
        u4.addToTopics(topic1)
        u4.addToTopics(topic2)
        u4.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)
        u3.addToTopics(topic3)
        u3.addToTopics(topic11)
        u3.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)
        topic11.save(flush:true,failOnError: true)
        u2.addToTopics(topic12)
        u2.save(flush:true,failOnError: true)
        topic12.save(flush:true,failOnError: true)
        u4.save()
        Link_Resource resource1 = new Link_Resource(description:"This is first Post",topics:topic1,url:'https://www.facebook.com/')
        Link_Resource resource2 = new Link_Resource(description:"This is second Post",topics:topic1,url:'https://www.facebook.com/')
        Link_Resource resource3 = new Link_Resource(description:"This is third Post",topics:topic2,url:'https://www.facebook.com/')
        Link_Resource resource4 = new Link_Resource(description:"This is fourth Post",topics:topic3,url:'https://www.facebook.com/')
        u4.addToResource(resource1)
        u4.addToResource(resource2)
        u4.addToResource(resource3)
        u4.save(flush:true,failOnError: true)
        u3.addToResource(resource4)
        u3.save(flush:true,failOnError: true)
        topic1.addToResource(resource1)
        topic1.addToResource(resource2)
        topic1.save(flush:true,failOnError: true)
        topic2.addToResource(resource3)
        topic2.save(flush:true,failOnError: true)
        topic3.addToResource(resource4)
        topic3.save(flush:true,failOnError: true)
        resource1.save(flush:true,failOnError:true)
        resource2.save(flush:true,failOnError:true)
        resource3.save(flush:true,failOnError:true)
        resource4.save(flush:true,failOnError:true)
        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic11)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic12)
        Subscription subs=new Subscription(seriousness: "CASUAL" ,topic:topic11)
        Subscription sub=new Subscription(seriousness: "CASUAL" , topic :topic1)
        Subscription su=new Subscription(seriousness: "CASUAL" , topic :topic2)
        u4.addToSubscriptions(s1)
        u4.addToSubscriptions(s2)
        u4.addToSubscriptions(su)
        u4.addToSubscriptions(subs)
        u3.addToSubscriptions(s3)
        u3.addToSubscriptions(s4)
        u2.addToSubscriptions(su)
        u2.addToSubscriptions(s5)
        u1.addToSubscriptions(sub)
        u1.addToSubscriptions(su)
        topic1.addToSubscriptions(s1)
        topic1.addToSubscriptions(sub)
        topic2.addToSubscriptions(su)
        topic2.addToSubscriptions(s2)
        topic3.addToSubscriptions(s3)
        topic11.addToSubscriptions(s4)
        topic11.addToSubscriptions(subs)
        topic12.addToSubscriptions(s5)

        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)
        subs.save(flush:true,failOnError:true)
        sub.save(flush:true,failOnError:true)
        su.save(flush:true,failOnError:true)

        Reading_Item r1=new Reading_Item(resource: resource1,user:u4,isRead: true)
        Reading_Item r2=new Reading_Item(resource: resource1,user:u1,isRead: false)
        Reading_Item r3=new Reading_Item(resource: resource2,user:u4,isRead:true )
        Reading_Item r4=new Reading_Item(resource: resource2,user:u1,isRead:false )
        Reading_Item r5=new Reading_Item(resource: resource3,user:u4,isRead: true)
        Reading_Item r6=new Reading_Item(resource: resource3,user:u2,isRead:false )
        Reading_Item r7=new Reading_Item(resource: resource3,user:u1,isRead:false )
        Reading_Item r8=new Reading_Item(resource: resource4,user:u3,isRead:true )

        r1.save(flush:true,failOnError:true)
        r2.save(flush:true,failOnError:true)
        r3.save(flush:true,failOnError:true)
        r4.save(flush:true,failOnError:true)
        r5.save(flush:true,failOnError:true)
        r6.save(flush:true,failOnError:true)
        r7.save(flush:true,failOnError:true)
        r8.save(flush:true,failOnError:true)







//        User1 user =User1.findById(1)
//        Topic t1=Topic.findById(26)
//        user.addToTopics(t1)
//        user.save()
//        t1.save()
//        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic:t1)
//        user.addToSubscriptions(s1)
//        t1.addToSubscriptions(s1)


   }
    def destroy = {
  }
}
