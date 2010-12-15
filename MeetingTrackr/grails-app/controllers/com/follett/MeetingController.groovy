package com.follett

class MeetingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [meetingInstanceList: Meeting.list(params), meetingInstanceTotal: Meeting.count()]
    }

    def create = {
        def meetingInstance = new Meeting()
        meetingInstance.properties = params
        return [meetingInstance: meetingInstance]
    }

    def save = {
        def meetingInstance = new Meeting(params)
        if (meetingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'meeting.label', default: 'Meeting'), meetingInstance.id])}"
            redirect(action: "show", id: meetingInstance.id)
        }
        else {
            render(view: "create", model: [meetingInstance: meetingInstance])
        }
    }

    def show = {
        def meetingInstance = Meeting.get(params.id)
        if (!meetingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])}"
            redirect(action: "list")
        }
        else {
            [meetingInstance: meetingInstance]
        }
    }

    def edit = {
        def meetingInstance = Meeting.get(params.id)
        if (!meetingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [meetingInstance: meetingInstance]
        }
    }

    def update = {
        def meetingInstance = Meeting.get(params.id)
        if (meetingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (meetingInstance.version > version) {
                    
                    meetingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'meeting.label', default: 'Meeting')] as Object[], "Another user has updated this Meeting while you were editing")
                    render(view: "edit", model: [meetingInstance: meetingInstance])
                    return
                }
            }
            meetingInstance.properties = params
            if (!meetingInstance.hasErrors() && meetingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'meeting.label', default: 'Meeting'), meetingInstance.id])}"
                redirect(action: "show", id: meetingInstance.id)
            }
            else {
                render(view: "edit", model: [meetingInstance: meetingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def meetingInstance = Meeting.get(params.id)
        if (meetingInstance) {
            try {
                meetingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])}"
            redirect(action: "list")
        }
    }

	def performLongCalculation = {
		Long sum = 0
		0.upto(20000000) {
			sum += it
		}
		
		render sum
	}
}
