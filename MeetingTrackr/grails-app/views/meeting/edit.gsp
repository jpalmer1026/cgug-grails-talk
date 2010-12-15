

<%@ page import="com.follett.Meeting" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meeting.label', default: 'Meeting')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${meetingInstance}">
            <div class="errors">
                <g:renderErrors bean="${meetingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${meetingInstance?.id}" />
                <g:hiddenField name="version" value="${meetingInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="meeting.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${meetingInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="meeting.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${meetingInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateTime"><g:message code="meeting.dateTime.label" default="Date Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingInstance, field: 'dateTime', 'errors')}">
                                    <g:datePicker name="dateTime" precision="day" value="${meetingInstance?.dateTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="speaker"><g:message code="meeting.speaker.label" default="Speaker" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingInstance, field: 'speaker', 'errors')}">
                                    <g:select name="speaker.id" from="${com.follett.Speaker.list()}" optionKey="id" value="${meetingInstance?.speaker?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sponsor"><g:message code="meeting.sponsor.label" default="Sponsor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: meetingInstance, field: 'sponsor', 'errors')}">
                                    <g:select name="sponsor.id" from="${com.follett.Sponsor.list()}" optionKey="id" value="${meetingInstance?.sponsor?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
