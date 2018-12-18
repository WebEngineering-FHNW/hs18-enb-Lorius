package webec

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }


        new Post(content:"Bootstrap Test 1").save()
        new Post(content:"Bootstrap Test 2").save()
    }
    def destroy = {
    }
}
