<%@ page import="com.fssa.inifiniti.services.*"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./Assests/css/seatbooking.css" />
    <title>Seat Booking</title>
  </head>
  <body>
    
   
  

    <div class="movie-container">
      
    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>Available</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>
      <li>
        <div class="seat sold"></div>
        <small>Booked</small>
      </li>
    </ul>

    <h2>Cab facing this side</h2>
    <h3>Selected Time Slot</h3>
    <h3 id="time_slot">  
    
    <% HttpSession session2 = request.getSession(false);
      String time = (String) session2.getAttribute("value");
    %>
    
    <%= time %>
    </h3>
    <div class="container">
      

      <div class="row">
        <div class="seat "></div>
        <div class="seat" style="visibility: hidden;"></div>
        <div class="seat sold"></div>
        
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        
      </div>
      
     
      
     
      
    </div>

    <p class="text">
      You have selected seat number  <span id="count">0</span> <span class="confirm"> <a href="" id="confirm">Confirm</a> </span>
    </p>
  
   <% 
    
    List<Integer> seatList = (List<Integer>) request.getAttribute("seatList");
    
    for (Integer item : seatList) {
      
    	System.out.println(item);
    %>
    
     <script type="text/javascript">
     const allSeats = document.querySelectorAll('.seat');
     const seatIndexToClose = <%= item %>;
  // Check if the seatIndexToClose is within the valid range
  if (seatIndexToClose >= 0 && seatIndexToClose <8) {
    // Add the "sold" class to close the seat
    allSeats[seatIndexToClose+3].classList.add('sold');
  } else {
    console.log(`Invalid seat index: ${seatIndexToClose}`);
  }

    </script>

<% } %>
  <script src="./Assests/js/seatbooking.js"></script>
  </body>
</html>