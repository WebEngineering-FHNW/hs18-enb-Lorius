package webec

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }

        /*
        def adminRole = new Role(authority: 'ROLE_ADMIN').save flush:true
        def userRole = new Role(authority: 'ROLE_USER').save flush:true
        def adminUser = new User(username: 'admin', password: 'admin').save flush:true
        def guestUser = new User(username: 'guest', password: 'guest').save flush:true
        UserRole.create adminUser, adminRole
        UserRole.create guestUser, userRole
        UserRole.withSession {
            it.flush()
            it.clear()
        }
        /*
        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2
        */



        new Post(content:"Bootstrap Test 1").save()
        new Post(content:"Bootstrap Test 2").save()
    }
    def destroy = {
    }
}
