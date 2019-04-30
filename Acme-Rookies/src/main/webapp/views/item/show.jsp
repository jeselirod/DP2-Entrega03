<%--
 * action-1.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="isAnonymous()">
<spring:message code="item.name"/>:<jstl:out value=" ${item.name}"></jstl:out><br>
<spring:message code="item.description"/>: <jstl:out value="${item.description}"></jstl:out><br>
<spring:message code="item.link"/>: <jstl:out value="${item.link}"></jstl:out><br>
<spring:message code="item.pictures"/>: <jstl:out value="${item.pictures}"></jstl:out><br>
<spring:message code="item.provider"/>: <br>

<jstl:out value="${item.provider.name}"></jstl:out><br>
<jstl:out value="${item.provider.surnames}"></jstl:out><br>
<jstl:out value="${item.provider.email}"></jstl:out><br>
<jstl:out value="${item.provider.make}"></jstl:out><br>
<input type="button" name="back" value="<spring:message code="item.back" />"
			onclick="javascript: relativeRedir('item/list.do');" />

</security:authorize>
