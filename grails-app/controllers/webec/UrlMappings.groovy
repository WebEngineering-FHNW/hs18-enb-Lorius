package webec

import grails.plugin.springsecurity.annotation.Secured

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/posts"(resources:'post')
        "/users"(resources:'user')
        "/roles"(resources:'role')
        "/userRoles"(resources:'userRoles')
        "/"(controller: "home", action: "index")
        "/about"(view:"/about")

        "/old"(view:"/oldIndex")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }

    grails.plugin.springsecurity.controllerAnnotations.staticRules = [
    '/':               ['permitAll'],
    '/about':          ['permitAll'],
    '/posts':          ['permitAll'],
    '/users':          ['ROLE_ADMIN'],
    '/roles':          ['ROLE_ADMIN'],
    '/userRoles':      ['ROLE_ADMIN'],

    '/old':            ['permitAll'],
    '500':             ['permitAll'],
    '404':             ['permitAll']
    ]
}
