package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.Factory;
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet{
    
	public void service(HttpServletRequest request,HttpServletResponse response)  {
		try {
		 int note_id=Integer.parseInt(request.getParameter("note_id"));
		Session session=Factory.getSessionFactory().openSession();
		Transaction tx=session.beginTransaction();
		Notes note=(Notes) session.get(Notes.class,note_id);
		session.delete(note);
		response.sendRedirect("View.jsp");
		tx.commit();
		session.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	    
}
