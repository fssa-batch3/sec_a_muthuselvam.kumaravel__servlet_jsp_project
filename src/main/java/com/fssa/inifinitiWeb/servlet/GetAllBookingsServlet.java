package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.inifiniti.model.*;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;



/**
 * Servlet implementation class GetAllAccounts
 */
@WebServlet("/GetAllBookingsServlet")
public class GetAllBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Booking> booking = new ArrayList<Booking> ();
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("loggedInEmail");
		BookingService bookingService =  new BookingService();
		Booking bookingObj = new Booking();
		bookingObj.setEmail(email);
		PrintWriter out = response.getWriter();
		try {
			booking = bookingService.readBookingByUser(bookingObj);
			request.setAttribute("BOOKINGS_LIST", booking);
			RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("GetAllCompanyCardServlet?error="+error[1]);
		}
		
	}

}