package webec

import grails.rest.*

@Resource(uri='/api/post', formats=['json'])
class Post {

    String content

    static constraints = {
        content blank:false
    }
}
