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
		if( email.equals("admin@gmail.com") && password.equals("admin@143")) {
			response.sendRedirect("admindashboard.jsp");
		} else {
		try {
			UserService.loginUser(email,password);
			HttpSession session = request.getSession();
			session.setAttribute("loggedInEmail", email);
			response.sendRedirect("index.jsp");	
		} catch ( ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			response.sendRedirect("login.jsp?error="+error[1]);
			out.print(e.getMessage());
			
		}
		}
	}

}