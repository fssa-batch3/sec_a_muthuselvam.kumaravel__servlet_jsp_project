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
import com.fssa.inifiniti.model.*;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;



/**
 * Servlet implementation class GetAllAccounts
 */
@WebServlet("/GetAllBookingByAdminServlet")
public class GetAllBookingByAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Booking> booking = new ArrayList<Booking> ();
		BookingService bookingService =  new BookingService();
		try {
			booking = bookingService.readBookingByAdmin();
			request.setAttribute("BOOKINGS_LIST", booking);
			RequestDispatcher dispatcher = request.getRequestDispatcher("bookingListByAdmin.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("admin.jsp?error="+error[1]);
		}
		
	}

}