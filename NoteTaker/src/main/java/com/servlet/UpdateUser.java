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
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {

	  public void doPost(HttpServletRequest request,HttpServletResponse response) {
		  HttpSession s=request.getSession();
		  Session session=Factory.getSessionFactory().openSession();
		  Transaction tr=session.beginTransaction();
		  try {
		  String username=request.getParameter("username");
		  String password=request.getParameter("password");
          Register old=(Register) s.getAttribute("user");
		  Register update=(Register) session.get(Register.class,old.getEmail());
		  update.setUsername(username);
		  update.setPassword(password);
		  message msg=new message("alert-success","Username And Password Updated Successfully!!"); 
		 
		  s.setAttribute("msg",msg);
		  s.removeAttribute("user");
		  response.sendRedirect("Login.jsp");
		  }
		  catch(Exception e) {
			  message msg=new message("alert-danger","Opps Something went wrong"); 
			  s=request.getSession();
			  s.setAttribute("msg",msg);
			  s.removeAttribute("user");
			  try {
				response.sendRedirect("Login.jsp");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			  e.printStackTrace();
		  }
		  tr.commit();
		  session.close();
		  
	  }
}
