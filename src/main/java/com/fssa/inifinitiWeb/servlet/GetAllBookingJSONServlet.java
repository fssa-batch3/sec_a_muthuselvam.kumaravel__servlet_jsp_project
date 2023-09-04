package com.fssa.inifinitiWeb.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fssa.inifiniti.model.Booking;



/**
 * Servlet implementation class GetAllAccounts
 */
@WebServlet("/GetAllBookingJSONServlet")
public class GetAllBookingJSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Booking> booking = new ArrayList<Booking> ();
	//	Booking booking = new Booking(1,"muthu","sriyaasha@gmail.com", "Taramani",1);
		booking.add(new Booking(1,"selvam","sri@gmail.com", "Taramani",2));
		booking.add(new Booking(1,"hari","hari@gmail.com", "Taramani",3));
		JSONArray accountsJSonArray = new JSONArray(booking);
		PrintWriter out = response.getWriter();
		out.println(accountsJSonArray.toString());
		out.flush();
//		JSONObject accountJson = new JSONObject(booking);
//		PrintWriter out = response.getWriter();
//		out.println(accountJson.toString());
//		out.flush();
	}

}