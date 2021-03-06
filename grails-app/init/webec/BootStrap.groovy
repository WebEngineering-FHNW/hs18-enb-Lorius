package webec

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
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
    }
    def destroy = {
    }
}
