<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/main.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Note Taker</title>
</head>
<body>
	<%@include file="Index_Navbar.jsp"%>
	<div class="jumbotron bg-success text-white "
		style="height: 35rem; clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);">
		<h1 class="display-4">Welcome To Note Taker</h1>
		<p class="lead">You have to make your own condensed notes. You
			learn from MAKING them. A lot of thinking goes into deciding what to
			include and exclude. You develop your own system of abbreviations and
			memory methods for the information.</p>
		<hr class="my-4">

		<p class="lead">
			<a class="btn btn-outline-light my-2 my-sm-0" href="Register.jsp" role="button"><span
				class="fa fa-smile-o fa-spin"></span> Start Its Free </a> <a
				class="btn btn-outline-light my-2 my-sm-0" href="Login.jsp" role="button"><span
				class="	fa fa-user-circle"></span> Login </a>
		</p>
	</div>

</body>
</html>