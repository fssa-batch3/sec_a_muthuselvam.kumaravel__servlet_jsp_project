<%@ page import="com.fssa.inifiniti.services.*"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
<%@ page import="java.util.*"%>

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
  <body>

<button class="button-6" role="button"> <a href="index.jsp">Go Back</a> </button>

 <h1> Booking History </h1>

  
    <table class="table align-middle mb-0 bg-white">
  <thead class="bg-light">
    <tr>
      <th>  Name</th>
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
        <p class="fw-normal mb-1"><%= shuttle.getDate()%></p>
      </td>
      <td><%= shuttle.getTime()%></td>
       <td><%= i.getSeatNum()%></td>
       <td>
        <span class="badge badge-success rounded-pill d-inline">Active</span>
      </td>
      <td>
        <button type="button" class="btn btn-link btn-sm btn-rounded">
          Edit
        </button>
      </td>
    </tr>
    
    <% }%>
   
  </tbody>
</table>

  </body>
<script type="text/javascript">


</script>

</html>