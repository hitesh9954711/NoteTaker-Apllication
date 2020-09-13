<%@page import="com.entities.Register"%>
<%@page import="com.entities.Notes"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.Factory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update page</title>
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
if (user == null) {
	response.sendRedirect("Login.jsp");
} 
  int id=Integer.parseInt(request.getParameter("note_id"));
  Session s=Factory.getSessionFactory().openSession();
  Notes note=s.get(Notes.class, id);
%>
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
	</div>
	</nav>


	<div class="container">
	<div class="card mt-4">
		<div class="card-header">
			<div class="container text-center"><h1>Update Note</h1></div>
			<div class="card-body">
				<form action="Update" method="post">
				<input type="hidden" class="form-control" name="id" value="<%=note.getId() %>" >
					<div class="form-group">
						<label for="exampleInputEmail1">Edit Title</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" value="<%=note.getTitle() %>"  name="edit_title"> 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Edit Content</label>
						<textarea class="form-control" name="edit_content"  style="height:150px;"><%=note.getContent()%></textarea>
					</div>
					<div class="container text-center">
					<button type="submit" class="btn btn-success">Submit</button></div>
					</div>
					
				</form>

			</div>

		</div>

	</div>
</div>
<%s.close(); %>
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