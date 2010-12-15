import com.follett.*

class BootStrap {

    def init = { servletContext ->

	    if (!Speaker.findByEmail('jpalmer@fheg.follett.com')) {

	      def jpalmer = new Speaker(firstName: 'Jeff', lastName: 'Palmer', email: 'jpalmer@fheg.follett.com',
	              website: 'http://jpalmer.com', bio: 'Jeff is a Prototype Developer from Follett who ...')
	      if (!jpalmer.save()) {
	        jpalmer.errors.allErrors.each { error ->
	          println error
	        }
	      }

	      def follett = new Sponsor(name: 'Follett Higher Education Group', website: 'http://www.efollett.com/',
	              description: 'follett.com provides you with access to over 1,200 online bookstores ... ')
	      follett.save(failOnError: true)

	      new Meeting(title: 'Introdution to Grails', description: 'A basic introduction to Grails ...',
	              dateTime: new Date ().parse ("MM/dd/yyyy H:m", "12/15/2010 18:00"), speaker: jpalmer, sponsor: follett).save()
	    }
	  }
	
}
