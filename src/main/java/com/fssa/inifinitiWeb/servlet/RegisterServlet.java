package com.fssa.inifinitiWeb.servlet;




import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.inifiniti.model.User;
import com.fssa.inifiniti.services.UserService;
import com.fssa.inifiniti.services.exceptions.ServiceException;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user1 = new User(username,email,password);
		UserService  UserService = new UserService();
		PrintWriter out = response.getWriter();
		try {
			UserService.registerUser(user1);
			response.sendRedirect("register.jsp?successMsg=Registration success");
		} catch (ServiceException e) {
			String msg = e.getMessage();
			//String[] error = msg.split(":");
			response.sendRedirect("register.jsp?error="+msg);
			out.print(e.getMessage());
		}
		
		
//	    if(username == null || "".equals(username)) {
//			out.println("Invalid username");
//			response.sendRedirect("register.html");
//
//		} else if(email == null || "".equals(email) || !email.contains("@") ) {
//			out.println("Invalid Email");
//			response.sendRedirect("register.html");
//		}
//		
//		else if(password == null || "".equals(password) || password.length() < 6) {
//			out.println("Invalid password");
//			response.sendRedirect("register.html");
//
//		}
//		else {
//			out.println("Register Success");
//			response.sendRedirect("login.html");
//		}
	}

}
