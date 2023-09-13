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
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
	 <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Display All bookings</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
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
    List<Booking> booking = new ArrayList<Booking> ();
	String email = request.getParameter("email");
	BookingService bookingService =  new BookingService();
	Booking bookingObj = new Booking();
	bookingObj.setEmail(email);
	try {
		booking = bookingService.readBookingByUser(bookingObj);
		request.setAttribute("BOOKINGS_LIST", booking);
	} catch (ServiceException e) {
		String msg = e.getMessage();
		String[] error = msg.split(":");
		response.sendRedirect("GetAllCompanyCardServlet?error="+error[1]);
	}
	
 %>
	<h1>Display All bookings</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Shuttle No</th>
				<th>Username</th>
				<th>Email</th>
				<th>Destination</th>
				<th>Seat Num</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="booking" items="${BOOKINGS_LIST}" varStatus="loop">


				<tr>
					<td><c:out value="${booking.shuttleId}" /></td>
					<td><c:out value="${booking.userName}" /></td>
					<td><c:out value="${booking.email}" /></td>
					<td><c:out value="${booking.destination}" /></td>
					<td><c:out value="${booking.seatNum}" /></td>
						<td><button><a href="editBooking.jsp?id=${booking.bookingId}&shuttleId=${booking.shuttleId}&email=${booking.email}">Edit</a></button></td>
							<td><button ><a  href="DeleteBookingServlet?id=${booking.bookingId}&email=${booking.email}">Delete</a></button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>