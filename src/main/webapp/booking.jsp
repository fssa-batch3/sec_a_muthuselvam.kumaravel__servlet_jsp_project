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
<style>
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
</head>
<body>
<!-- HTML structure for the loading screen -->
<div id="cover-spin"></div>

<!-- CSS styles for the loading screen -->


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
					<select id="dateSelection" name="date">
					<option value="" hidden selected disabled></option>
					 <% 

	ShuttleService shuttleService2  = new ShuttleService();
	List<Shuttle> shuttleList2 = shuttleService2.readAllTime();
	 HashSet<String> hashSet = new HashSet<>();
	for (Shuttle i : shuttleList2){
		hashSet.add(i.getDate());
	}
	for (String i : hashSet){
		
	
    	%>
						<option  value="<%= i%>" ><%= i %></option>
							<%
	}
    
    
    %>
					</select> <label class="date">Date</label>
				</div>
				<div id="cid_7">
				<div class="time_slot" >
					
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
	function showLoadingScreen() {
		  document.querySelector('#cover-spin').style.display = 'block';
		}

		// Hide the loading screen
		function hideLoadingScreen() {
		  document.querySelector('#cover-spin').style.display = 'none';
		}
	
	 document.getElementById('dateSelection').addEventListener('change', function () {
		 showLoadingScreen();
		    const selectedDate = this.value;
		    var company = '<%= session.getAttribute("currentCompany") %>';
		    console.log(company);
		    const timeSelect = document.querySelector('.time_slot');
		    timeSelect.innerHTML = '';
		    fetch('TimeSelector?date=' + selectedDate +'&company=' + company)
		      .then(response => response.json())
		      .then(data => {
		    	  data.times.forEach(item => {
		          const div = document.createElement('div');
		          div.setAttribute("class" , "time");
		         div.setAttribute ("id" , item.time);
		        div.setAttribute("onclick" , "removeDisabled()");
		          div.textContent = item.time;
		          const bookedSeats = item.bookedSeats;
		          
		          // Here, you can use the `bookedSeats` value as needed
		          // For example, you can change the div's background color based on the number of booked seats
		          if (bookedSeats === 0) {
		            div.style.border = "1px solid #18bd5b"; 
		            div.style.backgroundColor = " #18bd5b"; 
		            div.style.color = " #FFF";
		          } else if (bookedSeats >=1 && bookedSeats <=3) {
		            div.style.border = " 1px solid #FFCC00"; 
		            div.style.backgroundColor = " #FFCC00"; 
		            div.style.color = "#FFF"; 
		          } else if (bookedSeats >=4 && bookedSeats <=6){
		            div.style.border = " 1px solid #FF5733 "; 
		            div.style.backgroundColor = " #FF5733"; 
		            div.style.color = "#FFF";
		          } else {
		        	  div.style.border = " 1px solid #D0342C "; 
			            div.style.color = "#D0342C";
		          }
		          timeSelect.appendChild(div);
    });
		    	  hideLoadingScreen();
		      })
		      .catch(error => {
		        console.error('Error:', error);
		      }); 
		  });
	
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