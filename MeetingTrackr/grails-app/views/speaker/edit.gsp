

<%@ page import="com.follett.Speaker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'speaker.label', default: 'Speaker')}" />
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
            <g:hasErrors bean="${speakerInstance}">
            <div class="errors">
                <g:renderErrors bean="${speakerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${speakerInstance?.id}" />
                <g:hiddenField name="version" value="${speakerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="speaker.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speakerInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${speakerInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="speaker.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speakerInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${speakerInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="speaker.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speakerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${speakerInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="website"><g:message code="speaker.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speakerInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${speakerInstance?.website}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bio"><g:message code="speaker.bio.label" default="Bio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speakerInstance, field: 'bio', 'errors')}">
                                    <g:textArea name="bio" cols="40" rows="5" value="${speakerInstance?.bio}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="meetings"><g:message code="speaker.meetings.label" default="Meetings" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: speakerInstance, field: 'meetings', 'errors')}">
                                    
<ul>
<g:each in="${speakerInstance?.meetings?}" var="m">
    <li><g:link controller="meeting" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="meeting" action="create" params="['speaker.id': speakerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'meeting.label', default: 'Meeting')])}</g:link>

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
