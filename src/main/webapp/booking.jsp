<%@ page import="com.fssa.inifiniti.services.*"%>
<%@ page import="com.fssa.inifiniti.model.*"%>
<%@ page import="java.util.List"%>
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
%>
	<form id="231190591447457" action="Booking" method="post">
	
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
					<input type="text" id="first_29" value="<%= user.getFirstName() %>"  readonly><label
						id="sublabel_8_first" style="min-height: 13px"  >First Name</label>
					<div id="last_name">
						<input type="text" id="last_29" value="<%= user.getLastName() %>" readonly > <label
							id="sublabel_8_first" style="min-height: 13px">Last Name</label>
					</div>
				</div>
			</div>

			<div class="email-top">
				<label id="label_6"> E-mail<span>*</span>
				</label>
				<div id="cid_6">
					<input type="email" id="input_30" value="<%= loggedInEmail %>" readonly>
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
				<select id="date">
						<option hidden disabled selected value></option>
					</select>
					</div>
			</div>
			<div id="departure">
				<label id="label_6">Departure Date/Time <span>*</span>
				</label>
				<div id="cid_7">
					<select id="date">
						<option hidden disabled selected value></option>
					</select> <label class="date">Date</label>
				</div>
				<div id="cid_7">
				<div class="time_slot">
					 <% 

	ShuttleService shuttleService  = new ShuttleService();
	List<Shuttle> shuttleList = shuttleService.readAllTime();
	
	for (Shuttle i : shuttleList){
    	%>
					<div class="time" id="<%= i.getTime() %>" >
							
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

				<button id="input_2" type="submit">Submit</button>
			</div>




		</div>





	</form>
	<!--   <script src="./Assests/js/booking.js"></script>-->
	<script type="text/javascript">
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