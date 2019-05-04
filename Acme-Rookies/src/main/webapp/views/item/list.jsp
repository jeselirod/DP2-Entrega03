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
		<jstl:if test="${providerId eq null}">
		<display:column>
			<a style="color: green;"
				href="item/show.do?itemId=${row.id}"><spring:message
					code="item.show" /></a>
		</display:column>
		</jstl:if>
				
	</display:table>
	<jstl:if test="${providerId ne null}">
<input type="button" name="back" value="<spring:message code="item.back" />"
			onclick="javascript: relativeRedir('provider/list.do');" />
			</jstl:if>
</security:authorize>

<security:authorize access="hasRole('PROVIDER')">

	<display:table pagesize="5" name="items" id="row" requestURI="item/provider/list.do">

		<display:column property="name" titleKey="item.name" />
		<display:column property="description" titleKey="item.description" />
		<display:column property="link" titleKey="item.link" />
		<display:column property="pictures" titleKey="item.pictures" />
		<display:column>
			<a style="color: green;"
				href="item/provider/show.do?itemId=${row.id}"><spring:message
					code="application.show" /></a>
		</display:column>
		
		<display:column>
			<a style="color: gold;"
				href="item/provider/edit.do?itemId=${row.id}"><spring:message
					code="item.edit" /></a>
		</display:column>
		
		<display:column>
			<a style="color: red;"
				href="item/provider/delete.do?itemId=${row.id}"><spring:message
					code="item.delete" /></a>
		</display:column>
	</display:table>
	
	<input type="button" name="create" value="<spring:message code="item.create" />"
			onclick="javascript: relativeRedir('item/provider/edit.do?itemId=0');" />

</security:authorize>
