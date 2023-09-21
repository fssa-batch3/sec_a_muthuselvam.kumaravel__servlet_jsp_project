package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.inifiniti.services.ShuttleService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class EditShuttleServlet
 */
@WebServlet("/EditShuttle")
public class EditShuttleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditShuttleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("shuttleDate");
		String time = request.getParameter("shuttleTime");
		int id = Integer.parseInt(request.getParameter("id"));
		
		ShuttleService shuttleService = new ShuttleService();
		try {
			shuttleService.updateDateAndTimeByShuttleId(id, date, time);
			response.sendRedirect("companyList.jsp");
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
