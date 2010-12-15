package com.follett

class Meeting {

    String title
	  String description
	  Date dateTime

	  static constraints = {
	    title(blank: false)
	    description(blank: false, maxSize: 1000)
	    dateTime(validator: {
	      if (it.compareTo(new Date()) < 0) {
	        return false
	      }
	      return true
	    })
	  }

	  static belongsTo = [ speaker : Speaker, sponsor : Sponsor ]

	  String toString() {
	    "$dateTime $title"
	}
}
