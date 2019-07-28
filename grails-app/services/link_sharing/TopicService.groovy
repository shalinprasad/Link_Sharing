package link_sharing

import grails.transaction.Transactional
import enums.*

@Transactional
class TopicService {

        def createTopic(params,email)
        {
           String tname=params.topicName
            println "params=" +params

            Visibility vi= Visibility.PRIVATE
            println "uemail = "+email
            User1 u=User1.findByUsername(email)
            Topic t=new Topic(name:params.topicName,visibilty:params.selection)
           // Subscription sub=new Subscription(seriousness:'VERY_SERIOUS',topic:t1)
            //u.addToSubscriptions(sub)
            u.addToTopics(t)
            print t.validate()
            if(t.validate()){
                t.save(failOnError:true,flush:true)
                u.save(flush:true)
            }
            else
                t.errors.getAllErrors()

        }






}
