<%@ page import="com.fssa.inifiniti.services.*"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Booking Form</title>
<link rel="stylesheet" href="./Assests/css/booking.css" />
</head>
<body>

<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	UserService userService = new UserService();
	User user = userService.getUserByEmail(loggedInEmail);
	
	String companyName = request.getParameter("title");
%>
	<form id="231190591447457" action="SeatBooking?company=<%= companyName %>" method="post">
	
		<div id="main">
			<div id="main_2">
				<h1 id="header_1">Reservation Form</h1>
				<div id="subHeader_1" style="color: #57647e;">To reserve seats
					please complete and submit the below form.</div>
			</div>
			<hr>

			<div id="label_8">
				<label id="label_8"> Name<span>*</span>
				</label>

				<div id="name">
					<input type="text" id="first_29" name="firstname" value="<%= user.getFirstName() %>"  readonly><label
						id="sublabel_8_first" style="min-height: 13px"  >First Name</label>
					<div id="last_name">
						<input type="text" id="last_29" value="<%= user.getLastName() %>" readonly  > <label
							id="sublabel_8_first" style="min-height: 13px">Last Name</label>
					</div>
				</div>
			</div>

			<div class="email-top">
				<label id="label_6"> E-mail<span>*</span>
				</label>
				<div id="cid_6">
					<input type="email" id="input_30" name="email" value="<%= loggedInEmail %>" readonly>
				</div>
			</div>
			<div id="phone">
				<label id="label_6"> Phone Number<span>*</span>
				</label>
				<div id="cid_6">
					<input type="number" id="input_31_full" value="<%= user.getPhoneNumber() %>"  readonly>
				</div>
			</div>
			<div id="phone">
				<label id="label_6"> Destination <span>*</span>
				</label>
				<div id="cid_7">
				<select id="date" class="destination" name="destination">
						<option  selected value="taramani">Taramani</option>
					</select>
					</div>
			</div>
			<div id="departure">
				<label id="label_6">Departure Date/Time <span>*</span>
				</label>
				<div id="cid_7">
					<select id="date" name="date">
					 <% 

	ShuttleService shuttleService2  = new ShuttleService();
	List<Shuttle> shuttleList2 = shuttleService2.readAllTime();
	 HashSet<String> hashSet = new HashSet<>();
	for (Shuttle i : shuttleList2){
		hashSet.add(i.getDate());
	}
	for (String i : hashSet){
		
	
    	%>
						<option  selected value="<%= i%>" ><%= i %></option>
							<%
	}
    
    
    %>
					</select> <label class="date">Date</label>
				</div>
				<div id="cid_7">
				<div class="time_slot" >
					 <% 

	ShuttleService shuttleService  = new ShuttleService();
	List<Shuttle> shuttleList = shuttleService.readAllTime();
	
	for (Shuttle i : shuttleList){
    	%>
					<div class="time" id="<%= i.getTime() %>"  onclick="removeDisabled()" >
							
												<%= i.getTime() %>
											
					</div>
					<%
	}
    
    
    %>
					</div>
					 <label class="hour">Hour Minutes</label>
					
					
				</div>

			</div>




			<hr id="second">

			<div id="cid_2">

				<button id="input_2" type="submit" disabled>Submit</button>
			</div>
		</div>
	</form>
	 
	<script type="text/javascript">
	
    function preventBack() {
        window.history.forward(); 
    }
      
    setTimeout("preventBack()", 0);
      
    window.onunload = function () { null };
	
	document.getElementById("231190591447457").addEventListener("submit", function (event) {
		 // Prevent the default form submission

		  // Get the value from the div element
		  let div = document.querySelector(".time.selected").id;
	
		  // Prepare the data to send to the servlet (you can use JSON, FormData, or any suitable format)
		  const data = {
		    divValue: div
		  };

		  // Make an AJAX request to the servlet
		  fetch("/inifinitiWeb/SeatBooking", {
		    method: "POST",
		    headers: {
		      "Content-Type": "application/json" // Adjust the content type as needed
		    },
		    body: JSON.stringify(data) // Convert data to JSON format
		  })
		    .then(response => {
		      // Handle the response from the servlet if needed
		      if (response.ok) {
		        return response.text(); // Read the response body
		      } else {
		        throw new Error("Network response was not ok.");
		      }
		    })
		    .then(responseText => {
		      // Handle the responseText from the servlet if needed
		      console.log(responseText);
		    })
		    .catch(error => {
		      console.error("Error:", error);
		    });
		});
	
	function removeDisabled(){
		const myButton = document.getElementById("input_2");
		myButton.disabled = false;	
	}
	
	const slots = document.querySelector(".time_slot");
	slots.addEventListener("click", (e) => {
		let time_selected = document.querySelectorAll('.time.selected');
	if (
		    e.target.classList.contains("time") &&
		    !e.target.classList.contains("selected") 
		  ) {
		
		  for(let i=0; i<time_selected.length; i++){
		    if (time_selected[i].classList.contains("selected")){
		    	time_selected[i].classList.remove("selected")
		    }
		  }
		    e.target.classList.add("selected");
		   
		  }
	});
	
	</script>
</body>
</html>