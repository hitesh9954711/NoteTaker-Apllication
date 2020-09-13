package com.servlet;

import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.Factory;

@WebServlet("/Update")
public class Update extends HttpServlet{
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) {
		try {
		int id=Integer.parseInt(request.getParameter("id"));
		String titles=request.getParameter("edit_title");
		String title =titles.toUpperCase();
		String content=request.getParameter("edit_content");
		Session session=Factory.getSessionFactory().openSession();
		Transaction tr=session.beginTransaction();
		Notes note=session.get(Notes.class, id);
		note.setTitle(title);
		note.setContent(content);
		note.setDate(new Date()); 
	    tr.commit();
	    session.close();
	    response.sendRedirect("View.jsp");
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
