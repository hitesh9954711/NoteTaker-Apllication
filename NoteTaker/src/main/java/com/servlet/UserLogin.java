package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Register;
import com.helper.Factory;
import com.helper.message;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)  {
		Session session = Factory.getSessionFactory().openSession();
		try {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Register register=session.get(Register.class,email);
		String cpassword=register.getPassword();
		if(register!=null && cpassword.equals(password)) {
			HttpSession user=request.getSession();
			user.setAttribute("user",register);
			response.sendRedirect("AddNotes.jsp");
			session.close();
		}
		else {
			HttpSession user=request.getSession();
			message msg=new message("alert-danger","Opps! You Have Entered Wrong Email And Password");
			user.setAttribute("msg",msg);
			response.sendRedirect("Login.jsp");
			session.close();
		}
		
		}
		catch(Exception e) {
			e.printStackTrace();
			HttpSession user=request.getSession();
			message msg=new message("alert-danger","Opps! You Have Entered Wrong Email And Password");
			user.setAttribute("msg",msg);
			try {
			response.sendRedirect("Login.jsp");
			}
			catch(Exception e1) {e1.printStackTrace();}
			
		}
		
		 
	}

}
