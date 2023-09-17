package com.fssa.inifinitiWeb.servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fssa.inifiniti.model.Booking;
import com.fssa.inifiniti.services.BookingService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class RegisterBooking
 */
@WebServlet("/RegisterBooking")
public class RegisterBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        // Retrieve the JSON data from the request body
	        BufferedReader reader = request.getReader();
	        StringBuilder requestBody = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            requestBody.append(line);
	        }

	        // Parse the JSON data into a Booking object
	        ObjectMapper objectMapper = new ObjectMapper();
	        Booking booking = objectMapper.readValue(requestBody.toString(), Booking.class);
	        System.out.println("Booking Object:");
	        System.out.println("Shuttle ID: " + booking.getShuttleId());
	        System.out.println("Seat Number: " + booking.getSeatNum());
	        System.out.println("email: " + booking.getEmail());
	        System.out.println("destination: " + booking.getDestination());
//	        
	        BookingService bookingService = new BookingService();
//	        // Call your registerBooking method with the Booking object
	        boolean registrationSuccess =false ;
			try {
				registrationSuccess = bookingService.registerBookingWithUserId(booking);
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//
	        if (registrationSuccess) {
	            // Handle success, you can send a success response back to the client if needed
	            response.setStatus(HttpServletResponse.SC_OK);
	            response.getWriter().write("Booking registered successfully");
	        } else {
	            // Handle failure, you can send an error response back to the client if needed
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            response.getWriter().write("Booking registration failed");
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set an appropriate error status
	    }
	}

}
