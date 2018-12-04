package webec

class PdfController {

    def index() {
        String path = "C:\\Users\\gianm\\IdeaProjects\\hs18-enb-Lorius\\grails-app\\assets\\pdfs\\"
        render file: new File(path + "test.pdf")
    }
}
