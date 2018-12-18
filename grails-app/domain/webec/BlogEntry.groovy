package webec

class BlogEntry {
    String content

    static constraints = {
        content blank: false
    }
}
