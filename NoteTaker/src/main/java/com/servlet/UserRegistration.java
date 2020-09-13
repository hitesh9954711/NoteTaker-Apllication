package com.servlet;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Register;
import com.helper.Factory;
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet{
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		try {
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		PrintWriter out=response.getWriter();
		Session session=Factory.getSessionFactory().openSession();
		Transaction tx=session.beginTransaction();
		Register r=new Register(username,email,password,gender);
		session.save(r);
		tx.commit();
		session.close();
		out.print("success");
		
	}
		catch(Exception e) {
			e.printStackTrace();
			
		}
	}

}
