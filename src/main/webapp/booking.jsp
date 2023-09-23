<%@ page import="com.fssa.inifiniti.services.*"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Booking Form</title>
<link rel="stylesheet" href="./Assests/css/booking.css" />
<style>
#cover-spin {
	position: fixed;
	width: 100%;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background-color: rgba(255, 255, 255, 0.7);
	z-index: 9999;
	display: none;
}
#cover-spin::after {
	content: '';
	display: block;
	position: absolute;
	left: 48%;
	top: 40%;
	width: 100px;
	height: 100px;
	border-style: solid;
	border-color: #f9004d;
	border-top-color: transparent;
	border-width: 10px;
	border-radius: 50%;
	-webkit-animation: spin .8s linear infinite;
	animation: spin .8s linear infinite;
}

@-webkit-keyframes spin {
  from {
    -webkit-transform: rotate(0deg);
  }
  to {
    -webkit-transform: rotate(360deg);
  }
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
}

</style>
</head>
<body>
	<div id="cover-spin"></div>
	<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	UserService userService = new UserService();
	User user = userService.getUserByEmail(loggedInEmail);
	String companyName = request.getParameter("title");
	%>
	<form id="231190591447457"
		action="SeatBooking?company=<%=companyName%>" method="post">

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
					<input type="text" id="first_29" name="firstname"
						value="<%=user.getFirstName()%>" readonly><label
						id="sublabel_8_first" style="min-height: 13px">First
						Name</label>
					<div id="last_name">
						<input type="text" id="last_29" value="<%=user.getLastName()%>"
							readonly> <label id="sublabel_8_first"
							style="min-height: 13px">Last Name</label>
					</div>
				</div>
			</div>

			<div class="email-top">
				<label id="label_6"> E-mail<span>*</span>
				</label>
				<div id="cid_6">
					<input type="email" id="input_30" name="email"
						value="<%=loggedInEmail%>" readonly>
				</div>
			</div>
			<div id="phone">
				<label id="label_6"> Phone Number<span>*</span>
				</label>
				<div id="cid_6">
					<input type="number" id="input_31_full"
						value="<%=user.getPhoneNumber()%>" readonly>
				</div>
			</div>
			<div id="phone">
				<label id="label_6"> Destination <span>*</span>
				</label>
				<div id="cid_7">
					<select id="date" class="destination" name="destination">
						<option selected value="taramani">Taramani</option>
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
						ShuttleService shuttleService2 = new ShuttleService();
						List<Shuttle> shuttleList2 = shuttleService2.readAllTime();
						HashSet<String> hashSet = new HashSet<>();
						for (Shuttle i : shuttleList2) {
							hashSet.add(i.getDate());
						}
						for (String i : hashSet) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
						}
						%>
					</select> <label class="date">Date</label>
				</div>
				<div id="cid_7">
					<div class="legends-container">
						<div class="times-legend">
							<div class="legend-icon"></div>
							<div class="legend-text">Available</div>
						</div>
						<div class="times-legend">
							<div class="legend-icon fast"></div>
							<div class="legend-text">Fast Filling</div>
						</div>
						<div class="times-legend">
							<div class="legend-icon almost"></div>
							<div class="legend-text">Almost Full</div>
						</div>
						<div class="times-legend">
							<div class="legend-icon full"></div>
							<div class="legend-text">Fully Booked</div>
						</div>
					</div>
					<div class="time_slot"></div>

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
		function hideLoadingScreen() {
		  document.querySelector('#cover-spin').style.display = 'none';
		}
	 document.getElementById('dateSelection').addEventListener('change', function () {
		 showLoadingScreen();
		 document.querySelector('.legends-container ').style.visibility = 'visible';
		    const selectedDate = this.value;
		    var company = '<%=session.getAttribute("currentCompany")%>';
		    console.log(company);
		    const timeSelect = document.querySelector('.time_slot');
		    timeSelect.innerHTML = '';
		    const currentTime = new Date().toLocaleTimeString('en-US', { hour12: false }).slice(0, 5);
		    const selectedDateParts = selectedDate.split('/');
		    const selectedYear = parseInt(selectedDateParts[2], 10);
		    const selectedMonth = parseInt(selectedDateParts[1], 10) - 1; 
		    const selectedDay = parseInt(selectedDateParts[0], 10);
		    const selectedDateObj = new Date(selectedYear, selectedMonth, selectedDay);

		    const today = new Date(); 
		    today.setHours(0, 0, 0, 0);
		    fetch('TimeSelector?date=' + selectedDate +'&company=' + company)
		      .then(response => response.json())
		      .then(data => {
		    	  data.times.forEach(item => {
		    	  let isToday = false;
		    	  if (selectedDateObj.getTime() === today.getTime()) {
		    		   isToday = true;
		    		}
		    	  console.log(isToday);
		    	  if(isToday && item.time > currentTime && item.check == false ){
		          const div = document.createElement('div');
		          div.setAttribute("class" , "time");
		         div.setAttribute ("id" , item.time);
		        div.setAttribute("onclick" , "removeDisabled()");
		          div.textContent = item.time;
		          const bookedSeats = item.bookedSeats;
		          if (bookedSeats === 0) {
		            div.style.border = "1px solid #18bd5b"; 
		            div.style.backgroundColor = "#18bd5b"; 
		            div.style.color = "#FFF";
		          } else if (bookedSeats >=1 && bookedSeats <=3) {
		            div.style.border = " 1px solid #FFCC00"; 
		            div.style.backgroundColor = "#FFCC00"; 
		            div.style.color = "#FFF"; 
		          } else if (bookedSeats >=4 && bookedSeats <=6){
		            div.style.border = " 1px solid #FF5733 "; 
		            div.style.backgroundColor = "#FF5733"; 
		            div.style.color = "#FFF";
		          } else {
		        	div.style.border = " 1px solid #D0342C "; 
		        	div.style.backgroundColor = "#D0342C"; 
			        div.style.color = "#FFF";
		          }
		          timeSelect.appendChild(div);
		    		  }
		    	  
		    	  if(isToday == false && item.check == false ){
			          const div = document.createElement('div');
			          div.setAttribute("class" , "time");
			         div.setAttribute ("id" , item.time);
			        div.setAttribute("onclick" , "removeDisabled()");
			          div.textContent = item.time;
			          const bookedSeats = item.bookedSeats;
			          if (bookedSeats === 0) {
			            div.style.border = "1px solid #18bd5b"; 
			            div.style.backgroundColor = "#18bd5b"; 
			            div.style.color = "#FFF";
			          } else if (bookedSeats >=1 && bookedSeats <=3) {
			            div.style.border = " 1px solid #FFCC00"; 
			            div.style.backgroundColor = "#FFCC00"; 
			            div.style.color = "#FFF"; 
			          } else if (bookedSeats >=4 && bookedSeats <=6){
			            div.style.border = " 1px solid #FF5733 "; 
			            div.style.backgroundColor = "#FF5733"; 
			            div.style.color = "#FFF";
			          } else {
			        	div.style.border = " 1px solid #D0342C "; 
			        	div.style.backgroundColor = "#D0342C"; 
				        div.style.color = "#FFF";
			          }
			          timeSelect.appendChild(div);
			    		  }
   					 });
		    	  hideLoadingScreen();
		     		 })
		      .catch(error => {
		        console.error('Error:', error);
		      		 }); 
		  });
	
	
	 
		document.getElementById("231190591447457").addEventListener("submit", function (event) {
		showLoadingScreen();
		  let div = document.querySelector(".time.selected").id;
		  const data = {
		    divValue: div
		    };
		  fetch("/inifinitiWeb/SeatBooking", {
		    method: "POST",
		    headers: {
		      "Content-Type": "application/json" 
		    },
		    body: JSON.stringify(data)
		    })
		    .then(response => {
		    	console.log(response); 
		      if (response.ok) {
		    	  hideLoadingScreen();
		        return response.text(); 
		      } else {
		        throw new Error("Network response was not ok.");
		      }
		    })
		    .then(responseText => {
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