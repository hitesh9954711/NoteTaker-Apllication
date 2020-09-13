package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Register;
import com.helper.Factory;
import com.helper.message;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response)  {
		Session session=Factory.getSessionFactory().openSession();
	try {
		String email=request.getParameter("email");
		String password=request.getParameter("password");

		Transaction tr=session.beginTransaction();
		Register reset=session.get(Register.class,email);
		
		reset.setPassword(password);
		tr.commit();
		message msg=new message("alert-success","Password Reset Successfully");
		HttpSession s=request.getSession();
		s.setAttribute("msg",msg);
		response.sendRedirect("Login.jsp");
		
	}
		catch(Exception e) {
			e.printStackTrace();
			message msg=new message("alert-danger","Please Enter Correct Email Id");
			HttpSession s=request.getSession();
			s.setAttribute("msg",msg);
			try {
				response.sendRedirect("Login.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	session.close();
	
	}

}
