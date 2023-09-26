<%@ page import="com.fssa.inifiniti.services.*"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat, java.text.ParseException" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>card</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
    />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="./Assests/css/pricing.css">
  </head>
  <style>
  .badge-secondary{
  		background-color:#ff0f0f;
  }
  .btn-link{
  text-decoration:none;
  }
  </style>
  
  <body>

 <a href="index.jsp"><button class="button-6" role="button">Go Back</button></a> 
 <% String errMsg = request.getParameter("error");
    if(errMsg!=null){
    	%>
      <script type="text/javascript"> 
      Notify.error("<%= errMsg %>");
      </script>	
    	
    	<%
    }
    %>
 <h1> Booking History </h1>

  
    <table class="table align-middle mb-0 bg-white">
  <thead class="bg-light">
    <tr>
      <th>Name</th>
      <th>Date</th>
      <th>Time</th>
       <th>Seat No</th>
       <th>Status</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  <% 
  
  List<Booking> bookings = new ArrayList<>();
  ShuttleService shuttleService = new ShuttleService();
  Shuttle shuttle = new Shuttle();
   bookings = (List<Booking>) request.getAttribute("BOOKINGS_LIST");
  
   for (Booking i : bookings){
	   
	shuttle = shuttleService.readDateAndTimeByShuttleId(i.getShuttleId());
	   
	   
  %>
    <tr>
      <td>
        <div class="d-flex align-items-center">
          <div class="ms-3">
            <p class="fw-bold mb-1"><%= i.getUserName() %></p>
            <p class="text-muted mb-0"><%= i.getEmail()%></p>
          </div>
        </div>
      </td>
      <td>
        <p class="fw-normal mb-1"><%= shuttle.getDate() %></p>
      </td>
      <td><%= shuttle.getTime()%></td>
       <td><%= i.getSeatNum()%></td>
       <td>
 <% 
    String shuttleDate = shuttle.getDate();
    String shuttleTime = shuttle.getTime();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    Date currentDateTime = new Date();
    try {
      Date parsedShuttleDateTime = sdf.parse(shuttleDate + " " + shuttleTime);
      if (parsedShuttleDateTime.before(currentDateTime)) {
  %>
        <span class="badge badge-secondary rounded-pill d-inline">Completed</span>
  <%
      } else {
  %>
        <span class="badge badge-success rounded-pill d-inline">Active</span>
  <%
      }
    } catch (ParseException e) {
      e.printStackTrace();
    }
  %>     </td>
      <td>
      <% 
    String shuttleDate2 = shuttle.getDate();
    String shuttleTime2 = shuttle.getTime();
    SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    Date currentDateTime2 = new Date();
    try {
      Date parsedShuttleDateTime2 = sdf2.parse(shuttleDate2 + " " + shuttleTime2);
      if (parsedShuttleDateTime2.before(currentDateTime2)) {
  %>
 <button type="button" class="btn btn-link btn-sm btn-rounded"  >
        <a  style="text-decoration: none !important;">Completed</a>  
        </button>  <%
      } else {
  %>
 <button type="button" class="btn btn-link btn-sm btn-rounded"  >
        <a href="DeleteBookingServlet?id=<%= i.getBookingId()%>" style="text-decoration: none !important;">Cancel</a>  
        </button>  <%
      }
    } catch (ParseException e) {
      e.printStackTrace();
    }
  %>   
       
      </td>
    </tr>
    
    <% }%>
   
  </tbody>
</table>

  </body>
<script type="text/javascript">


</script>

</html>