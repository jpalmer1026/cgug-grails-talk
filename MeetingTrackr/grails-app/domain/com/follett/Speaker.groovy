package com.follett

class Speaker {

    String firstName
  String lastName
  String email
  String website
  String bio

  static constraints = {
    firstName(blank: false)
    lastName(blank: false)
    email(blank: false, email: true, unique: true)
    website(nullable: true, url: true)
    bio(nullable: true, maxSize: 1000)
  }

  static hasMany = [meetings: Meeting]

  String toString() {
    "$firstName $lastName"
  }
 
}
