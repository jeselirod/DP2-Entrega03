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

<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>


<security:authorize access="hasRole('HACKER')">
<form:form action="finder/hacker/edit.do" modelAttribute="finder">

<jstl:if test="${not empty exception}">
		<p style="color:red"> <spring:message code="notification.error" /> </p>
</jstl:if>

<form:hidden path="id"/>
<form:hidden path="version"/>

<acme:textbox code="finder.keyWord" path="keyWord"/>
<acme:textbox code="finder.deadLine" path="deadLine"/>
<acme:textbox code="finder.minSalary" path="minSalary"/>
<acme:textbox code="finder.maxSalary" path="maxSalary"/>


<input type="submit" name="save" 
	value="<spring:message code="notification.save" />" />
	

</form:form>

<input type="button" name="cancel" value="<spring:message code="finder.show" />"
			onclick="javascript: relativeRedir('finder/hacker/show.do');" />

<input type="button" name="clear" value="<spring:message code="finder.clear.results" />"
			onclick="javascript: relativeRedir('finder/hacker/clear.do');" />

<!-- <button type="button" onclick="exportFunction()"><spring:message code="finder.clear.results" /></button>
<p id="message"></p>
 <script type="text/javascript">
	function exportFunction() {
		$.ajax({
			type:'GET',
			url:'finder/hacker/clear.do',
			success: function(res) {
				document.getElementById("message").innerHTML = res;
		    }
		});
	}
</script> -->
</security:authorize>
