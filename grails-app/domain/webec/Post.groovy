package webec
import grails.rest.*

@Resource(uri='/posts')
class Post {

    String content

    static constraints = {
        content blank:false
    }
}
