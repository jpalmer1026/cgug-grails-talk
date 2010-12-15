package com.follett

import grails.test.*

class SpeakerTests extends GrailsUnitTestCase {
    void testConstraints() {
	    def longBio = "a" * 1001

	    def speaker = new Speaker(email: 'joe@acme.com')
	    mockForConstraintsTests(Speaker, [speaker])

	    def testSpeaker = new Speaker(firstName: "", lastName: "", email: "joe@test", website: "acme.com", bio: longBio)
	    assertFalse testSpeaker.validate()
	    assertEquals "blank", testSpeaker.errors["firstName"]
	    assertEquals "blank", testSpeaker.errors["lastName"]
	    assertEquals "email", testSpeaker.errors["email"]
	    assertEquals "url", testSpeaker.errors["website"]
	    assertEquals "maxSize", testSpeaker.errors["bio"]

	    testSpeaker = new Speaker(firstName: "joe", lastName: 'smith', email: 'joe@acme.com',
	            website: 'http://www.acme.com', bio: "Joe is a software architect with Acme Corporation")
	    assertFalse testSpeaker.validate()
	    assertEquals "unique", testSpeaker.errors["email"]

	    testSpeaker = new Speaker(firstName: "joe", lastName: 'smith', email: 'joesmith@acme.com',
	            website: 'http://www.acme.com', bio: "")
	    assertTrue testSpeaker.validate()
	  }
	
}
