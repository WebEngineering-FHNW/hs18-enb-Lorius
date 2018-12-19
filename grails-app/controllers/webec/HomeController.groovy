package webec

import grails.plugin.springsecurity.annotation.Secured

class HomeController {
    // This method makes sure that all the Posts are displayed in the proper order.
    @Secured(["ROLE_USER","ROLE_ADMIN"])
    def index() {
        def result = Post.getAll().reverse()
        render view:"index", model: [posts: result]
    }

    // This method right here actually saves the new posts and redirects the users to the homepage so that they're not on a strange URL after saving Posts
    @Secured("ROLE_ADMIN")
    def savePost() {
        def post = new Post(params)
        post.save()
        redirect(action: "index")
    }


}
