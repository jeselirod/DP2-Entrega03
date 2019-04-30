<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>



</head>
<body>

<security:authorize access="hasRole('AUDITOR')">
<form:form action=" audit/auditor/edit.do" modelAttribute="audit">

	<form:hidden path="id" />
	<form:hidden path="version" />
 
 	<acme:textbox code="audit.text" path="text"/>
	<br />
	<acme:textbox code="audit.score" path="score"/>
	<br />
	<acme:textbox code="audit.moment" path="moment"/>
	<br />
	<acme:textbox code="audit.draftMode" path="draftMode"/>
	<br />
	<acme:select items="${positions}" itemLabel="ticker" code="audit.position" path="position"/>
	<br />

	<acme:submit name="save" code="save"/>
	<acme:cancel url="audit/auditor/list.do" code="cancel"/>
	<br />
	
</form:form>
</security:authorize>
</body>
</html>