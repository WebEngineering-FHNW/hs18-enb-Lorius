package webec

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/posts"(resources:'post')
        "/"(controller: "home", action: "index")
        "/about"(view:"/about")

        "/old"(view:"/oldIndex")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
