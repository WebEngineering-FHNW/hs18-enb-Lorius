package webec

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/test"(controller:"pdf",action:"index")
        "/"(view:"/index")
        "/old"(view:"/oldIndex")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
