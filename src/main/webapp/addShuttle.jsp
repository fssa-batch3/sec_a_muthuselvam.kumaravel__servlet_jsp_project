 <%@ page import="com.fssa.inifiniti.model.*"%>
 <%@ page import="com.fssa.inifiniti.services.*"%>
 <%@ page import="java.util.*"%>
 <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservation Form</title>
        <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://codepen.io/gymratpacks/pen/VKzBEp#0">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style type="text/css">
       
        *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 1000px;
  position:relative;
  top:50px;
  left:220px;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}


button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #0d6efd;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #0d6efd;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

a{
color:#fff;text-decoration: none;}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}
.btn-primary {
    color: #fff;
    background-color: #f9004d;
    border-color: #f9004d;
    }
    .form-select {
    display: block;
    width: 100%;
    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
    -moz-padding-start: calc(0.75rem - 3px);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    height: 54px;
    color: #212529;
    background-color: #fff;
    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e);
    background-repeat: no-repeat;
    background-position: right 0.75rem center;
    background-size: 16px 12px;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
 
 
  #shuttle{
 margin-top: 100px;
 }
        </style>
    </head>
    <body>
   <jsp:include page="adminHeader.jsp"></jsp:include>
     <%
	
     String title = request.getParameter("title");
    
%>
      
       <form class="row g-3" action="AddShuttle?title=<%= title %>" method="post">
      
        <h1>Add Shuttle Date/Time</h1>
  
  
  <div class="col-12">
    <label for="inputAddress" class="form-label">Shuttle Date:</label>
    <input type="text" name="shuttleDate"  pattern="\d{2}/\d{2}/\d{4}" title="Please enter a date in the format dd/mm/yyyy" class="form-control" id="inputAddress" placeholder="dd/mm/yyyy" required>
  </div>
  
  <div class="col-12">
    <label for="inputZip" class="form-label">Shuttle Time:</label>
    <input type="text" name="shuttleTime" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]" title="Please enter a time in the format hh:mm (e.g., 18:00)" class="form-control" id="inputZip" placeholder="hh:mm"  required>
  </div>
  <div class="col-4">
    <button type="submit" id="submit-btn" class="btn btn-primary" disabled>Submit</button>
  </div>
</form>
       
       
     
       
      
      <script>
  document.getElementById('inputAddress').addEventListener('blur', function () {
    var inputDate = this.value;
    var dateParts = inputDate.split('/');
    var day = parseInt(dateParts[0], 10);
    var month = parseInt(dateParts[1], 10) - 1;
    var year = parseInt(dateParts[2], 10);
    var selectedDate = new Date(year, month, day);
    var currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0); 
    if (selectedDate < currentDate) {
      alert('Please enter a current date or future date.');
      this.value = ''; 
    }
  });
  
  
  var dateInput = document.getElementById('inputAddress');
  var timeInput = document.getElementById('inputZip');
  var submitButton = document.getElementById('submit-btn'); // Assuming you have a button with an id "submitButton"

 

  timeInput.addEventListener('blur', function () {
    validateDateTime();
  });

  function validateDateTime() {
    var inputDate = dateInput.value;
    var inputTime = timeInput.value;

    var dateParts = inputDate.split('/');
    var day = parseInt(dateParts[0], 10);
    var month = parseInt(dateParts[1], 10) - 1; // Month is 0-based
    var year = parseInt(dateParts[2], 10);

    var selectedDate = new Date(year, month, day);
    var currentDate = new Date();

    currentDate.setHours(0, 0, 0, 0); // Set time to midnight for date comparison

    if (selectedDate < currentDate) {
      alert('Please enter a future date.');
      dateInput.value = ''; // Clear the date input field
    } else if (selectedDate.getTime() === currentDate.getTime()) {
    	var timeParts = inputTime.split(':');
        var hours = parseInt(timeParts[0], 10);
        var minutes = parseInt(timeParts[1], 10);
        var currentTime = new Date();

        if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) {
          alert('Please enter a valid time (hh:mm).');
          timeInput.value = '';
          submitButton.setAttribute('disabled', 'disabled');
        } else if (hours < currentTime.getHours() || (hours === currentTime.getHours() && minutes <= currentTime.getMinutes())) {
          alert('The selected time cannot be in the past for today.');
          timeInput.value = ''; 
          submitButton.setAttribute('disabled', 'disabled'); // Disable the button
        } else {
          submitButton.removeAttribute('disabled'); // Enable the button
        }
      } else {
        submitButton.removeAttribute('disabled'); // Enable the button
      }
  }
</script>
    </body>
</html>
