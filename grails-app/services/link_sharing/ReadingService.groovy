package link_sharing

import grails.transaction.Transactional

import enums.Seriousness

@Transactional
class ReadingService {

    def displayunread(String username)
    {
        Long id = User1.findByUsername(username).id
        List<Long> Verys = Subscription.createCriteria().list {
            projections {
                property("topics")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.VERY_SERIOUS)
        }.collect{it.id}

        List<Long> Ser = Subscription.createCriteria().list {
            projections {
                property("topics")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.SERIOUS)
        }.collect{it.id}

        List<Long> Cas = Subscription.createCriteria().list {
            projections {
                property("topics")
            }
            eq("user.id", id)
            eq("seriousness", Seriousness.CASUAL)
        }.collect{it.id}
        List<Resource1> Verysr
        List<Resource1> Serr
        List<Resource1> Casr
        if(Verys){
            Verysr=Reading_Item.createCriteria().list{
                projections{
                    property("resource")
                }
                'resource' {
                    inList("topics.id" , Verys)
                }
                eq("user.id", id)
                eq("isRead",false)
            }}
        if(Ser){
            Serr= Reading_Item.createCriteria().list{
                projections{
                    property("resource")
                }
                eq("user.id", id)
                'resource' {
                    inList("topics.id" , Ser)
                }

                eq("isRead",false)
            }}
        if(Cas){
            Casr= Reading_Item.createCriteria().list{
                projections {
                    property("resource")
                }
                'resource' {
                    inList("topics.id", Cas)
                }
                eq("user.id", id)
                eq("isRead", false)
            }}


        ArrayList<Resource1> resources = new ArrayList()
        Verysr.each{
            resources.add(it)
        }
        Serr.each{
            resources.add(it)
        }
        Casr.each{
            resources.add(it)
        }
        return resources
    }

    def editreadMethod(params,String username)
    {
        User1 user=User1.findByUsername(username)
        Long id=Long.parseLong(params.id)
        Reading_Item ri=Reading_Item.createCriteria().get{
            eq('resource.id',id)
            eq('user.id',user.id)
        }
        ri.isRead=true
        ri.save()
    }
    def deleteMethod(params)
    {
        Resource1 res= Resource1.get(Long.parseLong(params.id))
        res.delete()
    }
}
