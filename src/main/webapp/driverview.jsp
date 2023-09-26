<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./Assests/css/driverview.css" />
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
        <div class="seat sold"></div>
        <small>Booked</small>
      </li>
    </ul>

    <h2>Cab facing this side</h2>
<div class="date">
<form action="" >
    <select  id="date" name="date" >
        <option hidden disabled selected value></option>
       </select> <label class="date">Date</label> </div>
      <div id="cid_7" > <select  id="time" name="time" >   
        <option hidden disabled selected value"></option>  
           <option  value="8.00">8.00</option>
        <option value="08.15">8.15</option>
        <option value="08.30">8.30</option>
        <option value="08.45">8.45</option>
        <option value="09.00">9.00</option>
        <option value="09.15">9.15</option>
        <option value="09.30">9.30</option>
        <option value="09.45">9.45</option>
        <option value="10.00">10.00</option>
        <option value="10.15">10.15</option>
        <option value="10.30">10.30</option>
        <option value="10.45">10.45</option>
        <option value="11.00">11.00</option>
        <option value="11.15">11.15</option>
        <option value="11.30">11.30</option>
        <option value="11.45">11.45</option>
        <option value="12.00">12.00</option>
        <option value="12.15">12.15</option>
        <option value="12.30">12.30</option>
        <option value="19.00">19.00</option>
        <option value="19.15">19.15</option>
        <option value="19.30">19.30</option>
        <option value="19.45">19.45</option>
        <option value="20.00">20.00</option>
        <option value="20.15">20.15</option>
        <option value="20.30">20.30</option>
        <option value="20.45">20.45</option>
        <option value="21.00">21.00</option>
      </select><label class="date">Hour Minutes</label></div>
      <button id="find" type="submit">Find</button>
</form>
    
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


   
  
    <script src="./Assests/js/driverview.js"></script>
  </body>
</html>