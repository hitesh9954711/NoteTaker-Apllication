package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.entities.Notes;
import com.entities.Register;
import com.helper.Factory;
import com.helper.message;

/**
 * Servlet implementation class addNotes
 */
@WebServlet("/AddNotes")
public class addNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public addNotes() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Session session=Factory.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			String titles = request.getParameter("title");
			String title =titles.toUpperCase();
			
			String content = request.getParameter("content");
			HttpSession httpSession = request.getSession();
			Register user = (Register) httpSession.getAttribute("user");
		    
			Notes note=new Notes();
			note.setTitle(title);
			note.setContent(content);
			note.setDate(new Date());
			note.setUser(user);
			session.save(note);
			response.sendRedirect("View.jsp");
		
		}

		catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("AddNotes.jsp");

		}
		tx.commit();
		session.close();
	}

}
