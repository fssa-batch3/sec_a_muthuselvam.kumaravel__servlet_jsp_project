package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.inifiniti.model.*;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class CreateBookingServlet
 */
@WebServlet("/Booking")
public class CreateBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Booking> booking = new ArrayList<Booking>();
		String shuttleId = request.getParameter("shuttleId");
		int  shuttleId2 = Integer.parseInt(shuttleId);
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String destination = request.getParameter("destination");
		String seatNum = request.getParameter("seatnum");
		int  seatNum2 = Integer.parseInt(seatNum);
		booking.add( new Booking(shuttleId2,username,email,destination,seatNum2));
		PrintWriter out = response.getWriter();
		out.println("Booking Lists");
		request.setAttribute("BOOKINGS_LIST",booking);
		RequestDispatcher dispatcher = request.getRequestDispatcher("bookingList.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String destination = request.getParameter("destination");
		String seatNum = request.getParameter("seatnum");
		int  seatNum2 = Integer.parseInt(seatNum);
		String time =  request.getParameter("time");
		String date =  request.getParameter("date");
		String companyName =  request.getParameter("companyName");
		ShuttleService shuttleService = new ShuttleService();
		BookingService  bookingService = new BookingService();
		PrintWriter out = response.getWriter();
		try {
			Shuttle shuttle = shuttleService.readIdByShuttleTimeAndDateAndCompanyName(date, time, companyName);
			Booking booking = new Booking(shuttle.getShuttleId(),username,email,destination,seatNum2);
			bookingService.registerBooking(booking);
			out.print("Booking Success");
			response.sendRedirect("GetAllBookingsServlet?email="+email);
		} catch (ServiceException e) {
			String msg = e.getMessage();
			System.out.println(msg);
			response.sendRedirect("GetAllCompanyCardServlet?error="+msg);
		}
		
	}

}
