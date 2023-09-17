package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fssa.inifiniti.model.Shuttle;
import com.fssa.inifiniti.services.BookingService;
import com.fssa.inifiniti.services.ShuttleService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class TimeSelector
 */
@WebServlet("/TimeSelector")
public class TimeSelector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeSelector() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedDate = request.getParameter("date");
        String company = request.getParameter("company");
        BookingService bookingService = new BookingService();
        ShuttleService shuttleService = new ShuttleService();
        Shuttle shuttle = new Shuttle();
        List<String> availableTimes = null;

        try {
            availableTimes = shuttleService.readTimeByCompanyDate(company, selectedDate);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        List<JSONObject> jsonTimeSlots = new ArrayList<>();
        
        for (String i : availableTimes) {
            JSONObject jsonTimeSlot = new JSONObject();
            jsonTimeSlot.put("time", i);
           
            int bookedSeats = 0;
			try {
				 shuttle = shuttleService.readIdByShuttleTimeAndDateAndCompanyName(selectedDate, i, company);
				bookedSeats = bookingService.readRowCountByShuttleId(shuttle.getShuttleId());
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            // Include the bookedSeats property in the JSON object
            jsonTimeSlot.put("bookedSeats", bookedSeats);

            jsonTimeSlots.add(jsonTimeSlot);
        }
        
        // Check if availableTimes is empty or null
        if (availableTimes == null || availableTimes.isEmpty()) {
            // Return a default JSON response
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("error", "No available times found.");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());
        } else {
        	JSONArray jsonTimes = new JSONArray(jsonTimeSlots);

        	// Create a JSON object to hold the response
        	JSONObject jsonResponse = new JSONObject();
        	jsonResponse.put("times", jsonTimes); // Include the time slots and booked seats in the response

        	// Send the JSON object as the response
        	response.setContentType("application/json");
        	try (PrintWriter out = response.getWriter()) {
        	    out.print(jsonResponse.toString());
        	}
        }
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
