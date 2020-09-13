package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.Register;
import com.helper.message;
@WebServlet("/Logout")
public class Logout extends HttpServlet{
	
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException {
		HttpSession session=request.getSession();
		Register user=(Register)session.getAttribute("user");
		session.removeAttribute("user");
		message msg=new message("alert-success","You Have Successfully Logout");
		session.setAttribute("msg",msg);
		response.sendRedirect("Login.jsp");
	}

}
