package link_sharing

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

         "/"(controller: "Signup", action:  "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
