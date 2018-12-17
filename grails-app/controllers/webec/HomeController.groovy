package webec

class HomeController {

    def index() {
        def result = Post.list()


        render view:"index", model: [posts: result]
    }
}
