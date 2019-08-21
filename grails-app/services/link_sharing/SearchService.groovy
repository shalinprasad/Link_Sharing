package link_sharing

import grails.transaction.Transactional

import enums.*

@Transactional

class SearchService {
    def showSearch(String searchKey) {
        String entry = searchKey
        if (entry == null)
            return null
        List<String> topicResults = Topic.createCriteria().list {
            ilike("name", "%${entry}%")

        }.collect { it.name }
        List<String> resourceResults = Resource1.createCriteria().list {
            ilike("description", "%${entry}%")
        }.collect { it.description }
        List<String> resultSet = topicResults + resourceResults
        return resultSet
    }
}

