package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;
import javax.servlet.http.*;
/**
 * Servlet implementation class EditBookingServlet
 */
@WebServlet("/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String email = request.getParameter("email");
//		String id = request.getParameter("id");
//		String shuttleId= request.getParameter("shuttleId");
//		request.setAttribute("email", email);
//		request.setAttribute("id", id);
//		request.setAttribute("shuttleId", shuttleId);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("EditBookingServlet");
//        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int id = Integer.parseInt((String) session.getAttribute("id"));
		int shuttleId = Integer.parseInt((String) session.getAttribute("shuttleId"));
		String destination = (String) request.getParameter("destination");
		int seatNum = Integer.parseInt((String) request.getParameter("seatnum"));
		BookingService bookingService = new BookingService();
		try {
			bookingService.updateBookingByBookingId(id, destination, seatNum, shuttleId);
			response.sendRedirect("bookingList.jsp?email="+email);
		} catch (ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("bookingList.jsp?error="+error[1]+"&email="+email);
		}
	}
		
		
	}


