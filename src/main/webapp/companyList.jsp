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
<% String errMsg = request.getParameter("error");
    if(errMsg!=null){
    	%>
      <script type="text/javascript"> 
      alert("<%= errMsg %>");
      </script>	
    	
    	<%
    }
    %>
    <%
    List<CompanyCard> company = new ArrayList<CompanyCard> ();
	
	CompanyCardService companyCard =  new CompanyCardService();
	try {
		company = companyCard.readCompany();
		request.setAttribute("COMPANYS_LIST", company);
	} catch (ServiceException e) {
		String msg = e.getMessage();
		String[] error = msg.split(":");
		response.sendRedirect("createCompany.jsp?error="+error[1]);
	}
	
 %>
	<h1>Display All Companies</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Company ID</th>
				<th>Company Name</th>
				<th>Image URL</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="company" items="${COMPANYS_LIST}" varStatus="loop">


				<tr>
					<td><c:out value="${company.companyId}" /></td>
					<td><c:out value="${company.companyTitle}" /></td>
					<td><c:out value="${company.imageUrl}" /></td>
					
						<td><button><a href="editCompany.jsp?id=${company.companyId}&title=${company.companyTitle}&url=${company.imageUrl}">Edit</a></button></td>
							<td><button ><a  href="DeleteCompanyServlet?id=${company.companyId}">Delete</a></button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>