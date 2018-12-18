package webec

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class PostSpec extends Specification implements DomainUnitTest<Post> {

    // Make sure that no Blog Post is null or empty
    void "Blog entires cannot be empty"() {
        expect:
        domain != null
        when:
        true
        then:
        domain.content != ''
    }
}
