package com.fssa.inifinitiWeb.servlet;



import java.io.IOException;
//import com.fssa.inifiniti.model.User;
import java.io.PrintWriter;

import com.fssa.inifiniti.model.User;
import com.fssa.inifiniti.services.UserService;
import com.fssa.inifiniti.services.exceptions.ServiceException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fssa.inifiniti.dao.*;
import com.fssa.inifiniti.dao.exceptions.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
		
	}


	
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		

		
	//	User user1 = new User("muthu","ms@gmail.com.com","Muthu@456");
	//	UserService  UserService = new UserService();
		
	//	users.add(user1);
		try {
			UserService.loginUser(email,password);
			HttpSession session = request.getSession();
			session.setAttribute("loggedInEmail", email);
			response.sendRedirect("home.jsp");	
		} catch ( ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("register.jsp?error="+error[1]);
			out.print(e.getMessage());
			
		}
//		if(email == null || "".equals(email)) {
//			out.println("Invalid Email");
//			response.sendRedirect("login.jsp?errorMessage=Invalid Email");
//		}
//		
//		else if(password == null || "".equals(password) || password.length() < 6) {
//			response.sendRedirect("login.jsp?errorMessage=Invalid Password");	
//		} else {
//			out.println("Email and password is valid");
//			HttpSession session = request.getSession();
//			session.setAttribute("loggedInEmail", email);
//			response.sendRedirect("home.jsp");	
//		}
//		try {
//			if(loginService.loginUser(email, password)) {
//				out.println("Login successful");
//				//response.sendRedirect("home.html");
//				//RequestDispatcher dispatcher = request.getRequestDispatcher("home.html");
//				//dispatcher.forward(request, response);
//			}
//		} catch (ServiceException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			out.println(e.getMessage());
//		} 
//		
		
		
		
		
	}

}