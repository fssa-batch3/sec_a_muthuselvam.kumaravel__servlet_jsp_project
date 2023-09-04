package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class DeleteBookingServlet
 */
@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bookingId = Integer.parseInt((String)request.getParameter("id"));
		String email = request.getParameter("email");
		BookingService bookingService = new BookingService();
		try {
			bookingService.deleteBookingByBookingId(bookingId);
			response.sendRedirect("bookingList.jsp?email="+email);
		} catch (ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("bookingList.jsp?error="+error[1]+"&email="+email);
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
