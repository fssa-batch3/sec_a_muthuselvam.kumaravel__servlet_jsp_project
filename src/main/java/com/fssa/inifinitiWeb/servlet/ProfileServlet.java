package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.inifiniti.model.User;
import com.fssa.inifiniti.services.UserService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
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
		
		String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String location = request.getParameter("location");
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        
        User user = new User();
        
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setLocation(location);
        user.setPhoneNumber(phonenumber);
        user.setEmail(email);
        
        UserService userService = new UserService();
        
        try {
			userService.updateUser(user);
			response.sendRedirect("profile.jsp?success=Successfully Updated");
		} catch (ServiceException e) {
			String msg = e.getMessage();
			System.out.println(msg);
			response.sendRedirect("profile.jsp?error="+msg);
		}
	}

}
