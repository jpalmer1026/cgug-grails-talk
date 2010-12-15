
<%@ page import="com.follett.Speaker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'speaker.label', default: 'Speaker')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'speaker.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'speaker.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'speaker.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'speaker.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="website" title="${message(code: 'speaker.website.label', default: 'Website')}" />
                        
                            <g:sortableColumn property="bio" title="${message(code: 'speaker.bio.label', default: 'Bio')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${speakerInstanceList}" status="i" var="speakerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${speakerInstance.id}">${fieldValue(bean: speakerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: speakerInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: speakerInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: speakerInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: speakerInstance, field: "website")}</td>
                        
                            <td>${fieldValue(bean: speakerInstance, field: "bio")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${speakerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
