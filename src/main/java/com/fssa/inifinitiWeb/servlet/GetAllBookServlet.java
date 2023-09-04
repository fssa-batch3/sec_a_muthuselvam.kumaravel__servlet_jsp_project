package com.fssa.inifinitiWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.inifiniti.model.User;

/**
 * Servlet implementation class GetAllBookServlet
 */
@WebServlet("/GetAllBookServlet")
public class GetAllBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> users = new ArrayList<User> ();
		users.add(new User("Bharath", "bharath@fssa.freshworks.com", "Password@123"));
		users.add(new User("ram", "ram@fssa.freshworks.com", "Muthu@143"));
		users.add(new User("Sridhivya", "sridhivya.freshworks.com", "Sri@pass3"));
		
		PrintWriter out = response.getWriter();
		out.println("User Lists");
		request.setAttribute("users",users);
		RequestDispatcher dispatcher = request.getRequestDispatcher("getAllUser.jsp");
        dispatcher.forward(request, response);
		}
	}


