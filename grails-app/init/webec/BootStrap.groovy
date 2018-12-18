package webec

class BootStrap {

    def init = { servletContext ->
        new Post(content:"Bootstrap Test 1").save()
        new Post(content:"Bootstrap Test 2").save()
    }
    def destroy = {
    }
}
