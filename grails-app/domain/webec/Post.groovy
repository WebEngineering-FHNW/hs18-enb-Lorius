package webec

import grails.rest.*

@Resource(uri='/api/post')
class Post {

    String content

    static constraints = {
        content type:'text'
        content blank:false
    }
}
