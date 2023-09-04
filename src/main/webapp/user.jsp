<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
 <%@ page import="com.fssa.inifiniti.services.*"%>
 <%@ page import="com.fssa.inifiniti.services.exceptions.*"%>
 <%@ page import="java.util.List"%>
 <%@ page import="java.util.ArrayList"%>
<%@ page  import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Display All bookings</title>
</head>
<body>
	<jsp:include page="adminHeader.jsp"></jsp:include>
	<h1>Display All User</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>User ID</th>
				<th>Username</th>
				<th>Email</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${USER_LIST}" varStatus="loop">


				<tr>
					<td><c:out value="${user.id}" /></td>
					<td><c:out value="${user.userName}" /></td>
					<td><c:out value="${user.email}" /></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>