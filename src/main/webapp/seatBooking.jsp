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
  <style>
  
  .disable{
  visibility: hidden;
  }
 #cover-spin {
    position:fixed;
    width:100%;
    left:0;right:0;top:0;bottom:0;
    background-color: rgba(255,255,255,0.7);
    z-index:9999;
    display:none;
}

@-webkit-keyframes spin {
	from {-webkit-transform:rotate(0deg);}
	to {-webkit-transform:rotate(360deg);}
}

@keyframes spin {
	from {transform:rotate(0deg);}
	to {transform:rotate(360deg);}
}

#cover-spin::after {
    content:'';
    display:block;
    position:absolute;
    left:48%;top:40%;
    width:100px;height:100px;
    border-style:solid;
    border-color:#f9004d;
    border-top-color:transparent;
    border-width: 10px;
    border-radius:50%;
    -webkit-animation: spin .8s linear infinite;
    animation: spin .8s linear infinite;
}

</style>
  <body>
    
   
  <div id="cover-spin"></div>

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
      <script>
      let allSeats = document.querySelectorAll('.seat');
      console.log(allSeats);
      </script>
     <% 
    
    List<Integer> seatList = (List<Integer>) request.getAttribute("seatList");
    
    for (Integer item : seatList) {
      
    	System.out.println(item);
    %>
    
     <script type="text/javascript">
    allSeats[<%= item %>+ 2 ].classList.add('sold');
    </script>

<% } %>
      
     
      
    </div>

    <p class="text">
      You have selected seat number  <span id="count">0</span> <span class="confirm"> <a href="" id="confirm" class="disable" >Confirm</a> </span>
      <span class="confirm"> <a href="index.jsp"  >Cancel</a> </span>
    </p>
  
   

<%  HttpSession session5 = request.getSession(false); %>

<script>

function showLoadingScreen() {
	  document.querySelector('#cover-spin').style.display = 'block';
	}

	// Hide the loading screen
	function hideLoadingScreen() {
	  document.querySelector('#cover-spin').style.display = 'none';
	}
	
function preventBack() {
    window.history.forward(); 
}
  
setTimeout("preventBack()", 0);
  
window.onunload = function () { null };

let confirm_btn = document.getElementById("confirm")
confirm_btn.addEventListener("click", function(event){
	event.preventDefault();
	 showLoadingScreen();
	registerBooking();
  }
)

function createBookingObjectFromForm() {
	let seatNum = document.getElementById("count").innerHTML;
	 let  email = '<%= (String) session5.getAttribute("loggedInEmail") %>';
	 let destination = '<%= (String) session5.getAttribute("destination") %>';
	let shuttleId = '<%= (int) session5.getAttribute("shuttleId") %>';
	
	let booking = {
			seatNum : seatNum ,
			email: email,
			destination : destination , 
			shuttleId: shuttleId,
	}
  return booking;
}

function registerBooking() {
  let booking = createBookingObjectFromForm();
  fetch("RegisterBooking", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(booking),
  })
    .then((response) => {
      if (response.ok) {
    	  hideLoadingScreen();
       window.location.href="GetAllBookingsServlet";
      } else {
        throw new Error("Network response was not ok.");
      }
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}

</script>
  <script src="./Assests/js/seatbooking.js"></script>
  </body>
</html>