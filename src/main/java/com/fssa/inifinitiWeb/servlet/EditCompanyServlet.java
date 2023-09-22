package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import com.fssa.inifiniti.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fssa.inifiniti.services.*;
import com.fssa.inifiniti.services.exceptions.ServiceException;
/**
 * Servlet implementation class EditCompanyServlet
 */
@WebServlet("/EditCompanyServlet")
public class EditCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCompanyServlet() {
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
		int id = Integer.parseInt((String) request.getParameter("id"));
		String companyName = request.getParameter("companyName");
		String companyLogo = request.getParameter("companyLogo");
		CompanyCardService service = new CompanyCardService();
		CompanyCard company = new CompanyCard();
		company.setCompanyTitle(companyName);
		company.setImageUrl(companyLogo);
		company.setCompanyId(id);
		
		try {
			service.updateCompany(company);
			response.sendRedirect("companyList.jsp");
		} catch (ServiceException e) {
			String msg = e.getMessage();
			System.out.println(msg);
			response.sendRedirect("editCompany.jsp?id="+id+"&title="+companyName+"&url="+companyLogo);
		}
	}

}
