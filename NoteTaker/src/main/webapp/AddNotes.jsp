<%@page import="com.entities.Register"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
</head>
<body>
	<%
Register user=(Register)session.getAttribute("user");
if(user==null){
	response.sendRedirect("Login.jsp");
}
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
					href="updateUser.jsp"><span class="fa fa-user-circle"></span> <%= user.getUsername() %></a></li>
				<li class="nav-item active"><a class="nav-link" href="Logout"><span
						class="fa fa-external-link"></span> Logout</a></li>
	
			</ul>
		</div>
		</nav>
	<div class="container mt-3">
		<div class="card">
			<div class="card-header">
				<h1>Add Notes Here</h1>
			</div>
			<div class="card-body">

				<form action="AddNotes" method="post">
				<input type="hidden" name="email" value="<%=user.getEmail() %>">
					<div class="form-group">
						<label for="exampleInputEmail1">Enter Title</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter Title"
							name="title">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Enter Content</label>
						<textarea class="form-control" name="content"
							style="height: 150px;"></textarea>
					</div>
					<div class="container text-center">
						<button type="submit" class="btn btn-success">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>