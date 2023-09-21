<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <script src=" https://smtpjs.com/v3/smtp.js"></script>
    <title>Sign in & Sign up Form</title>
    <style type="text/css">
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.notify {
    position: absolute;
    top: 46px;
    right: -477px;
    max-width: 400px;
    font-weight: normal;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
    animation-name: fadeOutRight;
    animation-delay: 6s;
    animation-duration: 10s;
}

body{
  background-image: url(data:image/jpeg;base64,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);
  background-color: rgb(216, 216, 216);
  background-blend-mode: multiply;
  width: 100%;
  height: 100vh;
  background-position: center;
  background-repeat: no-repeat;
  font-family: "Poppins", sans-serif;
  background-size: cover;
}


input {
  font-family: "Poppins", sans-serif;
  
}

.g-signin2{
  background-color: #f9000d;
  margin-top: 30px;
  

}

.container {
  position: relative;
  width: 100%;
  /* background-color: #fff; */
  min-height: 100vh;
  overflow: hidden;
 
}

.forms-container {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

.signin-signup {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  left: 75%;
  width: 50%;
  transition: 1s 0.7s ease-in-out;
  display: grid;
  grid-template-columns: 1fr;
  z-index: 5;
}

form {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0rem 5rem;
  transition: all 0.2s 0.7s;
  overflow: hidden;
  grid-column: 1 / 2;
  grid-row: 1 / 2;
}

form.sign-up-form {
  opacity: 0;
  z-index: 1;
}

form.sign-in-form {
  z-index: 2;
  margin-right: 100px;
}

.title {
  font-size: 2.2rem;
  color: #000;
  margin-bottom: 10px;
}

.input-field {
  max-width: 390px;
  width: 100%;
  background-color: #f0f0f0;
  margin: 10px 0;
  height: 55px;
  border-radius: 55px;
  display: grid;
  grid-template-columns: 15% 85%;
  padding: 0 0.4rem;
  position: relative;
  margin-bottom: 30px;
}

.input-field small {
  color: red;
  position: absolute;
  left: 0;
  bottom: 0;
  visibility: hidden;
}

.input-field.error small {
  visibility: visible;
}
.input-field i {
  text-align: center;
  line-height: 55px;
  color: #acacac;
  transition: 0.5s;
  font-size: 1.1rem;
}

.input-field input {
  background: none;
  outline: none;

  line-height: 1;
  font-weight: 600;
  font-size: 1.1rem;
  color: #333;
  /* border-color: red; */
}

.input-field input::placeholder {
  color: #aaa;
  font-weight: 500;
}

/* .input-field.success input {
  border-color: #2ecc71;
}

.input-field.error input {
  border-color: red;
} */

.input-field .social-text {
  padding: 0.7rem 0;
  font-size: 1rem;
}

.social-media {
  display: flex;
  justify-content: center;
}

form div input {
  /* border-color: red; */
  border-radius: 30px;
  width: 390px;
  margin-left: -6px;
  padding: 10px;
  outline: none;
}
.fa-eye{
  position: absolute;
  top: -3%;
  right: 4%;
  cursor: pointer;
  color: lightgray;
}
#username:valid {
  border-color: green;
}

#username:focus:invalid {
  border-color: red;
}

#password:focus:invalid {
  border-color: red;
}
#password:valid {
  border-color: green;
}

#username_1:valid {
  border-color: green;
}

#username_1:focus:invalid {
  border-color: red;
}

#email_1:valid {
  border-color: green;
}

#email_1:focus:invalid {
  border-color: red;
}
#email:valid {
  border-color: green;
}

#email:focus:invalid {
  border-color: red;
}
#password_1:valid {
  border-color: green;
}

#password_1:focus:invalid {
  border-color: red;
}

#password_2:valid {
  border-color: green;
}

#password_2:focus:invalid {
  border-color: red;
}
.strength{
  width: 20%;
  display: inline-block;
  position: relative;
  height: 100%;
  bottom: 8px;
  /* border-radius: 10px; */

}
#strength-bar{
  background-color: #dcdcdc;
  width: 60%;
  height: 10px;
  position: relative;
  margin-top: -15px;
  margin-left: -5px;
  border-radius: 10px;
}



/* .sign-up-form div input :invalid {
  border-color: red;
}

.sign-up-form div input:focus:valid {
  border-color: green;
} */
.input-field {
  height: fit-content;
}

.social-icon {
  height: 46px;
  width: 46px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 0.45rem;
  color: #333;
  border-radius: 50%;
  border: 1px solid #333;
  text-decoration: none;
  font-size: 1.1rem;
  transition: 0.3s;
}

.social-icon:hover {
  color: #f9004d;
  border-color: #f9004d;
}



.btn {
  width: 150px;
  background-color: #f9004d;
  border: none;
  outline: none;
  height: 49px;
  border-radius: 49px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  margin: 10px 0;
  cursor: pointer;
  transition: 0.5s;
}

.btn:hover {
  background-color: #f9009d;
}
.panels-container {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
}

.container:before {
  content: "";
  position: absolute;
  height: 2000px;
  width: 2000px;
  top: -10%;
  right: 48%;
  transform: translateY(-50%);
  background-image: #f9004d;
  transition: 1.8s ease-in-out;
  border-radius: 50%;
  z-index: 6;
}

.panel {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  justify-content: space-around;
  text-align: center;
  z-index: 6;
}

.left-panel {
  pointer-events: all;
  padding: 3rem 17% 2rem 12%;
  margin-top: 200px;
}

.right-panel {
  pointer-events: none;
  padding: 3rem 12% 2rem 17%;
}

.panel .content {
  color: #000;
  transition: transform 0.9s ease-in-out;
  transition-delay: 0.6s;
  margin-top: -400px;
}

.panel h3 {
  font-weight: 600;
  line-height: 1;
  font-size: 2.2rem;
}

.panel p {
  font-size: 1.5rem;
  color: #000;
  padding: 0.7rem 0;
}

.btn.transparent {
  margin: 0;
  background: none;
  border: 2px solid #fff;
  width: 130px;
  height: 41px;
  font-weight: 600;
  font-size: 0.8rem;
  background-color: #000;
  border-color: #000;
}

.right-panel .image,
.right-panel .content {
  transform: translateY(1100px);
}



.container.sign-up-mode:before {
  transform: translate(100%, -50%);
  right: 52%;
}

.container.sign-up-mode .left-panel .image,
.container.sign-up-mode .left-panel .content {
  transform: translateY(-800px);
}

.container.sign-up-mode .signin-signup {
  left: 25%;
}

.container.sign-up-mode form.sign-up-form {
  opacity: 1;
  z-index: 2;
}

.container.sign-up-mode form.sign-in-form {
  opacity: 0;
  z-index: 1;
}

.container.sign-up-mode .right-panel .image,
.container.sign-up-mode .right-panel .content {
  transform: translateX(0%);
}

.container.sign-up-mode .left-panel {
  pointer-events: none;
}

.container.sign-up-mode .right-panel {
  pointer-events: all;
  margin-top: 100px;
  /* margin-right: 100px; */
}
    </style>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
	 <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>
  </head>
  <body>
  <%
String errorOccurredParam =  request.getParameter("errorOccurred");
  boolean error = Boolean.parseBoolean(errorOccurredParam);
%>
    <div class="container <% if(error){ %>
    	sign-up-mode
  <% } %>">
      <div class="forms-container">
        <div class="signin-signup">
          <!-- log in -->
          <form action="login" class="sign-in-form" id="log_form" method="post">
            <h2 class="title">Sign in</h2>
 
            <div class="input-field">
              <input
                type="email"
                id="email"
                placeholder="Email"
                name="email"
                autofocus
                required
              />
            </div>
            <div class="input-field">
              <input
                type="password"
                id="password"
                placeholder="Password"
                pattern="^\S{4,25}\S"
                minlength="5"
                name="password"
                maxlength="25"
                
                required
              />
              <i class="fa-solid fa-eye" id="eye"></i>
            </div>
            <!-- <div id=”strength-bar”></div> -->
            <button type="submit" class="btn solid" >Login</button>
            <p class="social-text">Or Sign in with social platf<span>orms</span></p>
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
          </form>

          <!-- sign in -->

          <form name="myForm" action="register" class="sign-up-form" id="sign_form" method="post">
            <h2 class="title">Sign up</h2>
            <% String err = request.getParameter("error");
    if(err!=null){
    	%>
    	<script type="text/javascript">
    	Notify.error("<%= err %>");
    	</script>
    	
    	<%
    }
    %>
    
     <% String success = request.getParameter("successMsg");
    if(success!=null){
    	%>
    	<script type="text/javascript">
    	Notify.success("<%= success %>");
    	</script>
    	
    	<%
    }
    %>
            <div class="input-field">
              <input
                type="text"
                id="username_1"
                name="username"
                autocomplete="off"
                pattern="[A-Za-z0-9]{1,16}"
                placeholder="Username"
                minlength="5"
                maxlength="25"
                autofocus
                required
              />
              <small id="small"></small>
            </div>
            <div class="input-field">
              <input
                class="email-hover"
                type="email"
                name="email"
                id="email_1"
                placeholder="Email"
                pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
         
                required
              />
              <small>Error Message</small>
            </div>
            <div class="input-field">
              <input
                id="password_1"
                type="password"
                placeholder="Password"
                autocomplete="off"
                minlength="8"
                maxlength="25"
                name="password"
                oninput="strengthChecker()"
                pattern="^\S{8,25}\S"

                required
              />
              <i class="fa-solid fa-eye" id="eye2"></i>
              <small>Error Message</small>
            </div>
            <div id="strength-bar" ></div>

            <div class="input-field">
              <input
                id="password_2"
                type="password"
                placeholder="Confirm Password"
                autocomplete="off"
                minlength="8"
                maxlength="25"
                pattern="^\S{8,25}\S"
               
                required
              />
              <i class="fa-solid fa-eye" id="eye3"></i>

              <small>Error Message</small>
            </div>
            <button class="btn" type="submit">Sign up</button>
            <p class="social-text">Or Sign up with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
            
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
              You are new to this site so you are asked to register, Click the
              below button to register
            </p>
            <button class="btn transparent sign-up" id="sign-up-btn">Sign up</button>
          </div>
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>Are you Exisiting user?? click the below button to login</p>
            <button class="btn transparent" id="sign-in-btn">Sign in</button>
          </div>
        </div>
      </div>
    </div>

            <script type="text/javascript">
    const sign_in_btn = document.querySelector("#sign-in-btn");
    const sign_up_btn = document.getElementById('sign-up-btn');
    const container = document.querySelector(".container");
    sign_up_btn.addEventListener("click", () => {
      container.classList.add("sign-up-mode");
    });
    sign_in_btn.addEventListener("click", () => {
      container.classList.remove("sign-up-mode");
    });
    
    
    	// Usage example:
    	// Access the 'param2' value from the URL
</script>            
  </body>
</html>
