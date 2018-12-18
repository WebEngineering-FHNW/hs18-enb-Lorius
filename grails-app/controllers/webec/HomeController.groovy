package webec

class HomeController {

    // This method makes sure that all the Posts are displayed in the proper order.
    def index() {
        def result = Post.getAll().reverse()
        render view:"index", model: [posts: result]
    }

    // This method right here actually saves the new posts and redirects the users to the homepage so that they're not on a strange URL after saving Posts
    def savePost() {
        def post = new webec.Post(params)
        post.save()
        redirect(action: "index")
    }


}
