<%@page import="com.entities.Value"%>
<%@page import="com.entities.Register"%>
<%@page import="com.entities.Notes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.Factory"%>
<%@page import="com.helper.Factory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<%
		Register user = (Register) session.getAttribute("user");
	    Session s = Factory.getSessionFactory().openSession();%>
	    	<nav class="navbar navbar-expand-lg navbar-dark bg-success"> <a
		class="navbar-brand" href="index.jsp"><span class="fa fa-book"></span>
		Note Taker</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">

			<li class="nav-item active"><a class="nav-link"
				href="AddNotes.jsp"><span class="fa fa-plus-square-o"></span>
					Add Notes</a></li>

			<li class="nav-item active"><a class="nav-link" href="View.jsp"><span
					class="	fa fa-caret-square-o-down"></span> View Notes</a></li>

		</ul>
		<ul class="navbar-nav ml-auto">

			<li class="nav-item active"><a class="nav-link"
				href="updateUser.jsp"><span class="fa fa-user-circle"></span> <%=user.getUsername()%></a></li>
			<li class="nav-item active"><a class="nav-link" href="Logout"><span
					class="fa fa-external-link"></span> Logout</a></li>

		</ul>
		 <form class="form-inline my-2 my-lg-0" action="Search" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Enter Your Title" name="title" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
	</div>
	</nav>
	<% 
	if (user == null) {
		response.sendRedirect("Login.jsp");
	}
	else{
		Value c= (Value) session.getAttribute("c");
		if(c==null){
	String email = user.getEmail();
	Query q = s.createQuery("from Notes where user_email= :user_email");
	q.setParameter("user_email", email);
	%>


	<div class="container text-center">
		<h1>All Notes</h1>
		<%
			List<Notes> list = q.list();
		for (Notes note : list) {
		%>

	</div>
	<div class="container mt-3" style="border: 2px solid green;">
		<div class="card" style="border: 2px solid white;">
			<img class="card-img-top mx-auto" src="images/edit.png"
				style="height: 100px; width: 100px;" alt="Card image cap">
		</div>
		<div class="card-body">
			<h3
				class="card-title text-uppercase font-weight-bold text-capitalize"><%=note.getTitle()%></h3>
			<p class="card-text text-capitalize"><%=note.getContent()%></p>
			<div class="container text-center">
				<a href="DeleteServlet?note_id=<%=note.getId()%>"
					class="btn btn-danger">Delete</a> <a
					href="Update.jsp?note_id=<%=note.getId()%>"
					class="btn btn-warning">Update</a>
			</div>
		</div>
		<div class="card-footer">
			<h5>
				Date:
				<%=note.getDate()%></h5>
		</div>
	</div>

<%
		}
		}
		else{
%>
			<div class="container text-center">
			<h1>All Notes</h1>
			<%
		    String title=c.getTitle();
			String user_email = user.getEmail();
			Query q = s.createQuery("from Notes where user_email= :user_email and  title= :title");
			q.setParameter("title", title);
			q.setParameter("user_email", user_email);
            List<Notes> list=q.list();
			for (Notes note : list) {
			%>

		</div>
		<div class="container mt-3" style="border: 2px solid green;">
			<div class="card" style="border: 2px solid white;">
				<img class="card-img-top mx-auto" src="images/edit.png"
					style="height: 100px; width: 100px;" alt="Card image cap">
			</div>
			<div class="card-body">
				<h3
					class="card-title text-uppercase font-weight-bold text-capitalize"><%=note.getTitle()%></h3>
				<p class="card-text text-capitalize"><%=note.getContent()%></p>
				<div class="container text-center">
					<a href="DeleteServlet?note_id=<%=note.getId()%>"
						class="btn btn-danger">Delete</a> <a
						href="Update.jsp?note_id=<%=note.getId()%>"
						class="btn btn-warning">Update</a>
				</div>
			</div>
			<div class="card-footer">
				<h5>
					Date:
					<%=note.getDate()%></h5>
			</div>
		</div>

		<% 			
		}}}
		session.removeAttribute("c");
	s.close();
	%>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>