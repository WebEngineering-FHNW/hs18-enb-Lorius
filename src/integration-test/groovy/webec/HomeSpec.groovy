package webec

import geb.Page
import geb.spock.GebSpec
import grails.testing.mixin.integration.Integration

/**
 * See http://www.gebish.org/manual/current/ for more instructions
 */
@Integration
class HomeSpec extends GebSpec {

    // Test the Homepage Layout
    void "Homepage Layout"() {
        when: "arrive"
        go '/'
        then:
        title == "BlogThread"

        when: "Default View"
        $("button").click()
        then: "Switch Button Text"
        $("button").text() == "Create Post"
    }
}