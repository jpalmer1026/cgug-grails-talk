
<%@ page import="com.follett.Meeting" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meeting.label', default: 'Meeting')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'meeting.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'meeting.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'meeting.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="dateTime" title="${message(code: 'meeting.dateTime.label', default: 'Date Time')}" />
                        
                            <th><g:message code="meeting.speaker.label" default="Speaker" /></th>
                        
                            <th><g:message code="meeting.sponsor.label" default="Sponsor" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${meetingInstanceList}" status="i" var="meetingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${meetingInstance.id}">${fieldValue(bean: meetingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: meetingInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: meetingInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${meetingInstance.dateTime}" /></td>
                        
                            <td>${fieldValue(bean: meetingInstance, field: "speaker")}</td>
                        
                            <td>${fieldValue(bean: meetingInstance, field: "sponsor")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
				<div>
					<g:remoteLink action="performLongCalculation" update="[success:'message']" onLoading="showSpinner()"
								  onComplete="hideSpinner()">Perform Long Calculation</g:remoteLink>
				</div>
				<div id="message"></div>
            <div class="paginateButtons">
                <g:paginate total="${meetingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
