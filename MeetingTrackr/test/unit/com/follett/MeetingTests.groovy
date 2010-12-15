package com.follett

import grails.test.*

class MeetingTests extends GrailsUnitTestCase {
    void testConstraints() {
	    def today = new Date()
	    def yesterday = today - 1
	    def tomorrow = today + 1
	    def longDescription = 'a' * 1001

	    mockForConstraintsTests Meeting

	    def testMeeting = new Meeting(title: "", description: longDescription, dateTime: yesterday)
	    assertFalse testMeeting.validate()
	    assertEquals "blank", testMeeting.errors["title"]
	    assertEquals "maxSize", testMeeting.errors["description"]
	    assertEquals "validator", testMeeting.errors["dateTime"]

	    testMeeting = new Meeting(title: "Introduction to Grails", description: "Grails basics", dateTime: tomorrow,
	            speaker: new Speaker(), sponsor: new Sponsor() )
	    assertTrue testMeeting.validate()
	  }
	
}
