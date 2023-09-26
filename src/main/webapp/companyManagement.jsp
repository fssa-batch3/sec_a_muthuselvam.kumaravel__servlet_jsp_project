
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./Assests/css/customer.css">
    <title>customer</title>
</head>
<body>
    <div class="navigation">
        <ul>
            <li>
                <a href="#">
                    <span class="icon">
                        
                    </span>
                    <h2 class="title">INIFINITI</h2>
                </a>
            </li>

            <li>
                <a href="admindashboard.jsp">
                    <span class="icon">
                        <ion-icon name="home-outline"></ion-icon>
                    </span>
                    <span class="title">Dashboard</span>
                </a>
            </li>

            <li>
                <a href="../pages/customer.html">
                    <span class="icon">
                        <ion-icon name="people-outline"></ion-icon>
                    </span>
                    <span class="title">Company List</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="icon">
                        <ion-icon name="chatbubble-outline"></ion-icon>
                    </span>
                    <span class="title">Driver View</span>
                </a>
            </li>

            

            <li>
                <a href="#">
                    <span class="icon">
                        <ion-icon name="settings-outline"></ion-icon>
                    </span>
                    <span class="title">Settings</span>
                </a>
            </li>

            

            <li>
                <a href="#">
                    <span class="icon">
                        <ion-icon name="log-out-outline"></ion-icon>
                    </span>
                    <span class="title">Sign Out</span>
                </a>
            </li>
        </ul>
    </div>
   
<% String errMsg = request.getParameter("error");
    if(errMsg!=null){
    	%>
      <script type="text/javascript"> 
      Notify.error("<%= errMsg %>");
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
   
    <script src="./Assests/js/customer.js"></script>
</body>
</html>