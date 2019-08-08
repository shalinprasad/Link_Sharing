package link_sharing

import grails.transaction.Transactional

@Transactional
class Resource_RatingService {

    def saveMethod(params) {
        int rating=Integer.parseInt(params.value)
        User1 user=User1.findByUsername(params.username)
        Long resourceId= Long.parseLong(params.resourceId)
        Resource1 res=Resource1.get(resourceId)
        Resource_Rating resRate=Resource_Rating.createCriteria().get{
            eq('user.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {
            resRate.score=rating
            resRate.save(flush:true,failOnError: true)
        }
        else{
            Resource_Rating resourceRate = new Resource_Rating(score:rating)
            res.addToResource(resourceRate)
            user.addToResourceRatings(resourceRate)
            user.save(flush:true,failOnError: true)
            res.save(flush:true,failOnError: true)
            resourceRate.save(flush:true,failOnError: true)}
    }


    def readMethod(username , Resource1 res)
    {
        User1 user=User1.findByUsername(username)
         Resource_Rating resRate=Resource_Rating.createCriteria().get{
            eq('user.id',user.id)
            eq('resource.id',res.id)
        }
        if(resRate)
        {

            return resRate.score
        }
        else
            return 0
    }

}

