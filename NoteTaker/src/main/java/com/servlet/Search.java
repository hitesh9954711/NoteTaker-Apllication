package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Notes;
import com.entities.Value;
import com.helper.Factory;

@WebServlet("/Search")
public class Search extends HttpServlet{
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String titles=request.getParameter("title");
		String title =titles.toUpperCase();
		HttpSession s=request.getSession();
		Value c=new Value(true,title);
		s.setAttribute("c",c);
		response.sendRedirect("View.jsp");

		
	}

}
