<%--
 * action-1.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="isAnonymous()">

	<display:table pagesize="5" name="items" id="row" requestURI="item/provider/list.do">

		<display:column property="name" titleKey="item.name" />
		<display:column property="description" titleKey="item.description" />
		<display:column property="link" titleKey="item.link" />
		<display:column property="pictures" titleKey="item.pictures" />
		<display:column>
			<a style="color: green;"
				href="item/show.do?itemId=${row.id}"><spring:message
					code="item.show" /></a>
		</display:column>
		
	</display:table>

</security:authorize>

<security:authorize access="hasRole('PROVIDER')">

	<display:table pagesize="5" name="items" id="row" requestURI="item/provider/list.do">

		<display:column property="name" titleKey="item.name" />
		<display:column property="description" titleKey="item.description" />
		<display:column property="link" titleKey="item.link" />
		<display:column property="pictures" titleKey="item.picture" />
		<display:column>
			<a style="color: green;"
				href="item/provider/show.do?itemId=${row.id}"><spring:message
					code="application.show" /></a>
		</display:column>
		
	</display:table>

</security:authorize>
