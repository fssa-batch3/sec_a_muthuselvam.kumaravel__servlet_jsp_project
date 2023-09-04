package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.model.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class DeleteCompanyServlet
 */
@WebServlet("/DeleteCompanyServlet")
public class DeleteCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int companyId = Integer.parseInt((String)request.getParameter("id"));
		
		CompanyCardService companyService = new CompanyCardService();
		CompanyCard company = new CompanyCard();
		company.setCompanyId(companyId);
		try {
			companyService.deleteCompany(company);
			response.sendRedirect("companyList.jsp");
		} catch (ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("companyList.jsp?error="+error[1]);
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
