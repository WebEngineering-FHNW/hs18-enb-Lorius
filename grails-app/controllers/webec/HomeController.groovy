package webec

class HomeController {

    def index() {
        def result = Post.getAll().reverse()
        render view:"index", model: [posts: result]
    }

    def savePost() {
        def post = new Post(params)
        post.save()
        redirect(action: "index")
    }


}
