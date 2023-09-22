package com.fssa.inifinitiWeb.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.fssa.inifiniti.model.Shuttle;
import com.fssa.inifiniti.services.BookingService;
import com.fssa.inifiniti.services.ShuttleService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class SeatBooking
 */
@WebServlet("/SeatBooking")
public class SeatBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeatBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String time = (String)session.getAttribute("value");
		System.out.println(time);
		String date = (String)session.getAttribute("date");
		System.out.println(date);
		String company = (String)session.getAttribute("currentCompany");
		System.out.println(company);
		ShuttleService shuttleService = new ShuttleService();
		BookingService bookingService = new BookingService();
		Shuttle shuttle = new Shuttle();
		List<Integer> seats = new ArrayList<>();
		try {
		shuttle = shuttleService.readIdByShuttleTimeAndDateAndCompanyName(date, time, company);
		System.out.println(shuttle.getShuttleId());
		 HttpSession session2 = request.getSession(false);
    	 session2.setAttribute("shuttleId", shuttle.getShuttleId());
		 seats  = bookingService.readSeatNumByshuttleId(shuttle.getShuttleId());
		 request.setAttribute("seatList", seats);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("seatBooking.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Read the JSON data from the request body
        
		String contentType = request.getContentType();

        if (contentType != null && contentType.startsWith("application/json")) {
            // JSON request
            handleJsonRequest(request, response);
        } else if (contentType != null && contentType.startsWith("application/x-www-form-urlencoded")) {
            // Form data request
            handleFormDataRequest(request, response);
        } else {
            // Unsupported content type, return an error response
            response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
        }
        
        doGet(request, response);
	}
	private void handleJsonRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Read the JSON data from the request body
        BufferedReader reader = request.getReader();
        String requestBody = reader.lines().collect(Collectors.joining());

        try {
            // Parse the JSON data to retrieve the divValue
            JSONObject jsonData = new JSONObject(requestBody);
            String divValue = jsonData.getString("divValue");

            // Now, you have the divValue and can use it as needed
            if( divValue != null) {
            	 System.out.println("divValue :" + divValue);
            	 HttpSession session = request.getSession(false);
            	 session.setAttribute("value", divValue);
            }
           

            // You can also send a response back to the client if needed
            

            
        } catch (Exception e) {
            // Handle JSON parsing or other exceptions here
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set an appropriate error status
        }
    }
	private void handleFormDataRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Extract form data from the request
        String divValue = request.getParameter("divValue");
        String firstname = request.getParameter("firstname");
        String email = request.getParameter("email");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");

        // Now, you have the form data and can use it as needed
        if( divValue != null) {
       	 System.out.println("divValue :" + divValue);
       	 HttpSession session = request.getSession(false);
    	 session.setAttribute("value", divValue);
    	
       }
      
        System.out.println("firstname: " + firstname);
        System.out.println("email: " + email);
        System.out.println("destination: " + destination);
        System.out.println("date: " + date);
        HttpSession session = request.getSession(false);
        session.setAttribute("date", date);
        session.setAttribute("destination", destination);
        // You can also send a response back to the client if needed
       
    }

}