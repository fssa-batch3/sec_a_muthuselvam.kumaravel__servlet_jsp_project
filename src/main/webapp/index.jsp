<%@ page import="com.fssa.inifiniti.model.*"%>
 <%@ page import="com.fssa.inifiniti.services.*"%>
 <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./Assests/css/landing.css" />
    <title>INFINITI</title>
    <link rel="website icon"  type="png" href="./Assests/images/html-5.png">
    <link
      href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@500&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body  class="body" id="body" >
    <div class="hero" id="blur">
      <nav>
        <h2 class="logo">INIFI<span class="span-1">NITI</span></h2>
        <ul>
           
          <li><a href="./pages/reviews.html">Reviews</a></li>
          <li><a  <% 
         
          String loggedInEmail3 = (String) session.getAttribute("loggedInEmail");
          List<Booking> bookingList = null;
          BookingService bookingService = new BookingService();
          Booking booking = new Booking();
          booking.setEmail(loggedInEmail3);
          if(loggedInEmail3 !=null ){
         bookingList =   bookingService.readBookingByUser(booking);
          }
         
       if(loggedInEmail3 == null){ %>
    	   onclick="toggle_3()"
      <% } else if (bookingList.isEmpty() == true){ %>
       onclick="toggle_6()"
      <% } else {%>
          href="GetAllBookingsServlet"
          <%} %>>History</a></li>
          <li><a href="#faq-1">FAQ</a></li>
          <li>
            <a href="pages/support.html"  
              >Support</a
            >
          </li>
           <% String loggedInEmail4 = (String) session.getAttribute("loggedInEmail");
             if(loggedInEmail4 == null){
            %>
          <li id="login_li">
            <a   
            
           
              href="login.jsp"
              
              >Log In</a
            >
          </li>
          <%} %>
          <li><a  
          
          <%
          
          String loggedInEmail2 = (String) session.getAttribute("loggedInEmail");
           
          if(loggedInEmail2 == null) {
          %>
          onclick="toggle()"
          <% } else {%> href="profile.jsp" <%} %>
           >Profile</a></li>
           
        </ul>

       <button class="btn">  <a
          class="book-now"<% 
          String loggedInEmail = (String) session.getAttribute("loggedInEmail");
       boolean hasNullValues = false;
          UserService userService = new UserService();
          if(loggedInEmail != null){
          
          hasNullValues =  userService.checkColumnHasNullValues(loggedInEmail);
          }
       if(loggedInEmail == null){ %>
    	   onclick="toggle_3()"
      <% } else if (hasNullValues == false){ %>
       onclick="toggle_4()"
      <% } else { %>
          href="GetAllCompanyCardServlet"
          <% } %>
          >Book Now</a>
        </button>
        
      </nav>
      <div class="sec-2">
        <div class="content">
          <h1>Your <span class="span-1"> Time</span>.</h1>
          <h1>Your <span class="span-1"> Shuttle</span>.</h1>
          <h1><span class="span-1"> Book </span> Anytime.</h1>
          <div class="input-box">
            <form action="">
              <input
                type="number"
                name="email"
                id="mail"
                placeholder="Your ZIP / Postal Code" required
              />
              <button class="submit"> <a href="./pages/company logo.html" class="next">  Next </a> </button>
            </form>
          </div>
          <br />
          <h5 class="h5">
            By clicking " <span class="span-1"> Next </span>", I agree to the
            <span class="span-1"> <u> terms and condidtions </u></span>and have
            <br />read the
            <span class="span-1"> <u> privacy policy </u> </span>.
          </h5>
        </div>
        <div class="content-1">
          <h2 class="inside-phone">INIFI<span class="span-1">NITI</span></h2>
          <img
            class="img-2"
            src="./Assests/images/06CC8DoBFtUSn5mKkQS7ERt-1.fit_lim.size_1600x900.v1569492238-removebg-preview.png"
            height="468"
            width="750"
            alt=""
          />
        </div>
      </div>
      <div class="download">
        <img src="./Assests/images/play_store.png" class="play-store" alt="" />
        <img src="./Assests/images/app_store.png" class="app-store" alt="" />
      </div>
    </div>

    <!-- ABOUT US / LEARN MORE -->
    <div class="popup" id="popup"><button id="close" onclick="toggle_2()" >&times;</button>
      <h2>Please Login To Continue</h2><br> <button class="log_btn"> <a href="./pages/login.html" class="log_popup">Log In</a></button>
    </div>
    <div class="popup_2" id="popup_2"><button id="close" onclick="toggle_5()" >&times;</button>
      <h2>Please Complete your Profile To Book</h2><br><button class="pro_btn"> <a href="./pages/profile.html" class="pro_popup">Profile</a></button>
    </div>
    <div class="popup_3" id="popup_3"><button id="close" onclick="toggle_7()" >&times;</button>
      <h2>Please Complete your First Booking</h2>
    </div>
    <section class="about" id="about-1">
      <div class="main">
        <img src="./Assests/images/undraw_interview_re_e5jn.svg" alt="" />
        <div class="about-text">
          <h1><span class="about-h1"> About </span> Us</h1>
          <p>
            <span> INIFINITI</span> <span> is </span><span>  a </span><span>  shuttle </span><span> providing</span><span> service</span> <span>to</span>
            <span>the </span> <span>office.</span><span>We </span>are</span><span> providing </span><span>world</span><span> class</span><span> best </span><span> services</span>
            <span> for </span><span> the</span><span> officies.</span><span> Currently</span> <span> we</span><span> are</span><span> working </span><span>in </span><span>the </span>
            <span>main</span> <span>feature</span><span> of</span> <span>our</span><span>website.</span><span> INFINITI</span><span> is </span><span>pouplar</span> <span>for </span><span> satisfying</span>
            <span>the </span><span>customer</span> <span>by </span> <span>their </span><span>cab.</span>  
          </p>
        </div>
      </div>
    </section>

    <!-- FAQ -->

    <section class="faq" id="faq-1">
      <div class="container" id="faq-1">
        <h1>
          <span class="span-1"> Frequ</span>ently Asked Quest<span
            class="span-1"
            >ions</span
          >?
        </h1>
        <div class="tab">
          <input type="radio" name="q1" id="q1" />
          <label for="q1">
            <h2>01</h2>
            <h3>How Do I Apply?</h3>
          </label>
          <div class="content">
            <p>
                enter the details such as your name and email to create an INFINITI account. Once you've filled in all the details, tap REGISTER.
            </p>
          </div>
        </div>
        <div class="tab">
          <input type="radio" name="q2" id="q2" />
          <label for="q2">
            <h2>02</h2>
            <h3>Lost or forgotten your password?</h3>
          </label>
          <div class="content">
            <p>
                1.Enter your INFINITI registered email ID or mobile number
                2.Click on Get Verification Code
                3.Enter the verification code that you will receive on the provided mobile number or email ID
                4.Click on Submit
            </p>
          </div>
        </div>
        <div class="tab">
          <input type="radio" name="q3" id="q3" />
          <label for="q3">
            <h2>03</h2>
            <h3>How can i make a change in my application?</h3>
          </label>
          <div class="content">
            <p>
                You will receive an OTP on the new mobile number you entered.

                - Enter the OTP to verify your mobile number. Once you verify, your changes will be updated.
            </p>
          </div>
        </div>
        <div class="tab">
          <input type="radio" name="q4" id="q4" />
          <label for="q4">
            <h2>04</h2>
            <h3>How Do I reset my password?</h3>
          </label>
          <div class="content">
            <p>
                - Tap on Password to change the password. You will be asked to enter your current password before you can create a new one.

                - Enter your New password (minimum of 6 characters and a mix of alphabets & numbers).
                
                - Confirm your new password and click Save to update your password.
            </p>
          </div>
        </div>
      </div>
    </section>



     


    <!-- ContactUs -->

    <section class="contact">
      <div class="contact-form">
        <h2><span class="span-1"> Contact </span>Us</h2>
        <p>
            How can we help you?
        </p>
        <form
          action="https://formsubmit.co/el/demegi"
          method="POST"
        >
          <input type="text" placeholder="Your Name" required />
          <input type="email" name="e-mail" placeholder="Your Email" required />
          <!-- <input type="" placeholder="Write A Subject" required /> -->
          <textarea
            name=""
            id=""
            cols="30"
            rows="10"
            placeholder="Your Message"
            required
          ></textarea>
          <button type="submit" class="btn-s">Submit

           </button> 
        </form>
      </div>
      <div class="contact-img-1">
        <img
          src="./Assests/images/undraw_contact_us_re_4qqt.svg"
          alt=""
          height="400"
          width="500"
        />
      </div>
    </section>


    

    <!--  footer  -->




    <footer class="footer-main">
       
      <div class="bottom-foot">
        <center>
          <span class="credit">Created By <a href="#">INFINITI</a> | </span>
          <span class="far fa-copyright"></span
          ><span> 2023 All rights reserved.</span>
        </center>
      </div>
    </footer>
    

    <script>
      (function (Q, R) {
          if(Q.qr) return;
          var u = 'https://webview.quickreply.ai/whatsapp/script.min.js';
          var h = R.head || R.documentElement;
          var e = R.createElement('script');
          e.type = 'text/javascript';
          e.async = true;
          e.src = u;
          Q.qr = {
              brandSetting: {
                  includePageLink: false,
                  messageText: "Hi.. I have a query.",
                  phoneNumber: "+919363630498"
              },
              chatButtonSetting: {
                  sideMargin: 20,
                  marginBottom: 20,
                  position: "right",
                  buttonType: "ICON_TEXT",
                  buttonText: "Chat Now",
                  buttonBgColor: "#f9004d",
                  buttonTextColor: "#fff"
              }
          };
          e.onload = function () {
              CreateWhatsappChatWidget(Q.qr);
          };
          h.insertBefore(e, h.lastChild);
      })(window, document);
</script>
                        

<script>
function toggle(){

  event.preventDefault();
let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup");
popup.classList.toggle("active");
let body = document.getElementById("body")
body.classList.add("stop-scrolling");
}
function toggle_2(){
  
  let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup");
popup.classList.toggle("active");
let body_2 = document.getElementById("body")
body_2.classList.remove("stop-scrolling");
}
function toggle_5(){
  
  let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup_2");
popup.classList.toggle("active");
let body_2 = document.getElementById("body")
body_2.classList.remove("stop-scrolling");
}

function toggle_3(){


  event.preventDefault();
let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup");
popup.classList.toggle("active");
let body = document.getElementById("body")
body.classList.add("stop-scrolling");
} 



function toggle_4(){
  event.preventDefault();
let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup_2");
popup.classList.toggle("active");
let body = document.getElementById("body")
body.classList.add("stop-scrolling");
}

function toggle_6(){
  event.preventDefault();
let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup_3");
popup.classList.toggle("active");
let body = document.getElementById("body")
body.classList.add("stop-scrolling");
}

function toggle_7(){
  
  let blur = document.getElementById("blur");
blur.classList.toggle("active");
let popup = document.getElementById("popup_3");
popup.classList.toggle("active");
let body_2 = document.getElementById("body")
body_2.classList.remove("stop-scrolling");
}




function toggles(){
  if(JSON.parse(localStorage.getItem("login_user")) == null){
  toggle_3();
  } else if (JSON.parse(localStorage.getItem("profile_count")) == null){
    toggle_4();
  
  } else{
    window.open("/pages/company logo.html")
  }

}

function toggles_2(){
  if(JSON.parse(localStorage.getItem("login_user")) == null){
  toggle_3();
  } else if (JSON.parse(localStorage.getItem("bookingObject")) == null){
    toggle_6();
  
  } else{
    window.open("/pages/pricing.html")
  }

}

if(JSON.parse(localStorage.getItem("login_user")) != null){
  let item = document.getElementById("login_li");
  item.parentNode.removeChild(item)
}

if(JSON.parse(localStorage.getItem("login_user")) == null){
  let item = document.getElementById("login_li");
  item.parentNode.appendChild(item)
}




</script>   
                      

  </body>
</html>