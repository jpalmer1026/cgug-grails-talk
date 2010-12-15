package com.follett

class Sponsor {

    String name
	  String description
	  String website
	  byte[] image

	  static constraints = {
	    name(blank: false)
	    description(blank: false, maxSize: 1000)
	    website(url: true)
	    image(nullable: true)
	  }

	  static hasMany = [ meetings : Meeting ]

	  String toString() {
	    "$name"
	  }
	
}
