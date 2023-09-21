package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.inifiniti.model.Shuttle;
import com.fssa.inifiniti.services.ShuttleService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class AddShuttleServlet
 */
@WebServlet("/AddShuttle")
public class AddShuttleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShuttleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date = request.getParameter("shuttleDate");
		String time = request.getParameter("shuttleTime");
		String title = request.getParameter("title");
		Shuttle shuttle = new Shuttle();
		ShuttleService shuttleService = new ShuttleService();
		shuttle.setCompanyName(title);
		shuttle.setDate(date);
		shuttle.setTime(time);
		try {
			shuttleService.registerShuttle(shuttle);
			response.sendRedirect("companyList.jsp");
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
