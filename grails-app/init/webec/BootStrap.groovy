package webec

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }
        def h = new User(username:'admin', password:'secret', enable:true, accountExpired:false, accountLocked:false, passwordExpired:false).save();
        Role a = new Role(authority:'ROLE_ADMIN').save()
        UserRole.create(admin, a);

        new Post(content:"Bootstrap Test 1").save()
        new Post(content:"Bootstrap Test 2").save()
    }
    def destroy = {
    }
}
