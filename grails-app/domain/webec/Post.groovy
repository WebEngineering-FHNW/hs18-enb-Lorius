package webec

import grails.rest.*

class Post {

    String content

    static constraints = {
        content blank:false
    }
}
