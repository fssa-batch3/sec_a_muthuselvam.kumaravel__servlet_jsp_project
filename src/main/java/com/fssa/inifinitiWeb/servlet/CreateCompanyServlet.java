package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;
import com.fssa.inifiniti.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateCompanyServlet
 */
@WebServlet("/CreateCompanyServlet")
public class CreateCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String companyName = request.getParameter("companyName");
		String companyUrl = request.getParameter("companyLogo");
		CompanyCardService companyCardService= new CompanyCardService();
		CompanyCard company = new CompanyCard();
		company.setCompanyTitle(companyName);
		company.setImageUrl(companyUrl);
		try {
			companyCardService.registerCompany(company);
			response.sendRedirect("companyList.jsp");
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
