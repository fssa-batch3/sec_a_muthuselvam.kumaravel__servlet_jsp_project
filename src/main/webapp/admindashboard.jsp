<%@ page import="com.fssa.inifiniti.model.*"%>
 <%@ page import="com.fssa.inifiniti.services.*"%>
  <%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./Assests/css/admindashboard.css">
</head>

<body>
    <!--  Navigation  -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="admindashboard.jsp">
                        <span class="icon">
                            
                        </span>
                        <h2 class="title">INIFINITI</h2>
                    </a>
                </li>

                <li>
                    <a href="admindashboard.jsp">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>

                <li>
                    <a href="companyList.jsp">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                        <span class="title">Company List</span>
                    </a>
                </li>

                <li>
                    <a href="driverview.jsp">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">Driver View</span>
                    </a>
                </li>

                

                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="settings-outline"></ion-icon>
                        </span>
                        <span class="title">Settings</span>
                    </a>
                </li>

                

                <li>
                    <a href="login.jsp">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title"  >Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Main  -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user" style="visibility: hidden;">
                    <img src="assets/imgs/customer01.jpg" alt="">
                </div>
            </div>

            <!-- Cards  -->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers" id="total_users"><% UserService service2 = new UserService();
                      List<User> users =  service2.readUserByAdmin();
                        %> <%= users.size() %></div>
                        <div class="cardName">Total User</div>
                    </div>

                    <div class="iconBx">
                        
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers" id="total_active">0</div>
                        <div class="cardName">Active</div>
                    </div>

                    <div class="iconBx">
                        
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers" id="today_login">0</div>
                        <div class="cardName">Today Login</div>
                    </div>

                    <div class="iconBx">
                      
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers" id="total_booking"><% BookingService service = new BookingService();
                      List<Booking> bookings =  service.readBookingByAdmin();
                        %> <%= bookings.size() %></div>
                        <div class="cardName">Total Booking</div>
                    </div>

                    <div class="iconBx">
                      
                    </div>
                </div>
            </div>

            <!-- Order Details List  -->
            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Booking</h2>
                        <a href="#" class="btn">View All</a>
                    </div>

                    <table id="recent_book">
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Date</td>
                                <td>Seat-No</td>
                                <td>Status</td>
                            </tr>
                        </thead>

                        <tbody>
                         <%
                    BookingService bookingService = new BookingService();
                    List<Booking> booking = bookingService.readBookingByAdmin();
                    for(Booking i: booking){
                    %>
                             <tr>
    <td id="name"><%= i.getUserName() %></td>
    <td id="date"></td>
    <td id="seat_num"><%= i.getSeatNum() %></td>
    <td>
      <span class="status delivered">Active</span>
    </td>
  </tr>
  <%} %>
           
                        </tbody>
                    </table>
                </div>

                <!--  New Customers  -->
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Recent Users</h2>
                    </div>

                    <table id="recent_cus">
                    <%
                    UserService userService = new UserService();
                    List<User> user = userService.readUserByAdmin();
                    for(User i: user){
                    %>
                        <tr>
    <td width="60px">
      <div class="imgBx">
        <img src="https://www.freeiconspng.com/thumbs/profile-icon-png/am-a-19-year-old-multimedia-artist-student-from-manila--21.png" alt="">
      </div>
    </td>
    <td>
      <h4><%= i.getUserName() %></h4>
      <span><%= i.getEmail() %></span>
    </td>
  </tr>

                       

                       
<%} %>
                        

                        

                        
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="./Assests/js/admindashboard.js"></script>

  
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
       

    </script>
</body>

</html>