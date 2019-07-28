package link_sharing

import enums.*


class BootStrap {

    def init = { servletContext ->

        User1 user1 = new User1(firstName:"Shalin",lastName: "Prasad",email: "shalinprasad99@gmail.com",username: "shaliin",password: "12345",admin:false,active:true)
        User1 user2 = new User1(firstName:"Vaibhav",lastName: "S",email: "vaibhav@gmail.com",username: "vsh",password: "12345",admin:false,active:true)
        User1 user3 = new User1(firstName:"Saurabh",lastName: "kumar",email: "saurabh@gmail.com",username: "ssr",password: "12345",admin:false,active:true)
        User1 user4 = new User1(firstName:"Rahul",lastName: "Kumar",email: "rahul@gmail.com",username: "rahul",password: "12345",admin:false,active:true)
        User1 user5 = new User1(firstName:"Manish",lastName: "Kumar",email: "manish@gmail.com",username: "mbt",password: "12345",admin:false,active:true)



        Topic topic1 = new Topic(name:"Constructor",visibilty:Visibility.PUBLIC)
        Topic topic2 = new Topic(name:"Inheritance",visibilty:Visibility.PUBLIC)
        Topic topic3 = new Topic(name:"Encapsulation",visibilty:Visibility.PUBLIC)
        Topic topic4 = new Topic(name:"ABSTRACTION",visibilty:Visibility.PUBLIC)
        Topic topic5 = new Topic(name:"MEMORY", visibilty:Visibility.PUBLIC)





        user1.addToTopics(topic1)
        user1.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)
        user1.addToTopics(topic2)
        user1.save(flush:true,failOnError: true)
        topic2.save(flush:true,failOnError: true)

        user2.addToTopics(topic3)
        user2.save(flush:true,failOnError: true)
        topic3.save(flush:true,failOnError: true)



        user3.addToTopics(topic4)
        user3.save(flush:true,failOnError: true)
        topic4.save(flush:true,failOnError: true)


        user4.addToTopics(topic5)
        user4.save(flush:true,failOnError: true)
        topic5.save(flush:true,failOnError: true)


        user5.addToTopics(topic1)
        user5.save(flush:true,failOnError: true)
        topic1.save(flush:true,failOnError: true)



        Subscription s1=new Subscription(seriousness: "CASUAL" ,topic :topic1)
        Subscription s2=new Subscription(seriousness: "CASUAL" , topic : topic2)
        Subscription s3=new Subscription(seriousness: "CASUAL" , topic : topic3)
        Subscription s4=new Subscription(seriousness: "CASUAL" , topic : topic4)
        Subscription s5=new Subscription(seriousness: "CASUAL" , topic: topic5)







        user1.addToSubscriptions(s1)
        user2.addToSubscriptions(s2)
        user3.addToSubscriptions(s3)
        user4.addToSubscriptions(s4)
        user5.addToSubscriptions(s5)

        topic1.addToSubscriptions(s1)
        topic2.addToSubscriptions(s2)
        topic3.addToSubscriptions(s3)
        topic4.addToSubscriptions(s4)
        topic5.addToSubscriptions(s5)



        s1.save(flush:true,failOnError:true)
        s2.save(flush:true,failOnError:true)
        s3.save(flush:true,failOnError:true)
        s4.save(flush:true,failOnError:true)
        s5.save(flush:true,failOnError:true)






















//        Resource1 resource1 = new Resource1(description:"Resource-1 and some random texts here",topics:topic1)
//        Resource1 resource2 = new Resource1(description:"Resource-2 and some random texts here",topics:topic2)
//        Resource1 resource3 = new Resource1(description:"Resource-2 and some random texts here",topics:topic3)
//        Resource1 resource4 = new Resource1(description:"Resource-2 and some random texts here",topics:topic4)
//        Resource1 resource5 = new Resource1(description:"Resource-2 and some random texts here",topics:topic5)
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












    }
    def destroy = {
    }
}
