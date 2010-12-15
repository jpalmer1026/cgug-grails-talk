package com.follett

import grails.test.*

class SponsorTests extends GrailsUnitTestCase {
    void testConstraints() {
	    def longDescription = 'a' * 1001

	    mockForConstraintsTests Sponsor

	    def testSponsor = new Sponsor(name: "", description: longDescription, website: 'acme.com')
	    assertFalse testSponsor.validate()
	    assertEquals "blank", testSponsor.errors["name"]
	    assertEquals "maxSize", testSponsor.errors["description"]
	    assertEquals "url", testSponsor.errors["website"]

	    testSponsor = new Sponsor(name: "Acme Corporation", description: "Acme Corporation is a small software boutique",
	            website: "http://www.acme.com")
	    assertTrue testSponsor.validate()
	  }
	
}
