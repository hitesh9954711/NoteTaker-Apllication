<%@page import="com.helper.message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<body>
	<%@include file="Index_Navbar.jsp"%>
	<div class="jumbotron bg-success"
		style="height: 38rem; clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);">
		<div class="container" style="width: 25rem;">
			<div class="card">
				<div class="card-header">
					<h2>Login Here!</h2>
				</div>
				<% message msg=(message) session.getAttribute("msg"); 
			if(msg!=null){
			%>
			<div class="alert <%=msg.getCssClass() %>" role="alert">
				<%=msg.getContent() %></div>
				<%
			}
			session.removeAttribute("msg");
			
			%>
				<div class="card-body">
					<form action="UserLogin" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email"
								placeholder="Enter email"> <small id="emailHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="password"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="form-group">
						<a href="ResetPassword"  data-toggle="modal" data-target="#exampleModal">Forgot Password ?</a>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-success">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Reset Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="ResetPassword" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email"
								placeholder="Enter email"> <small id="emailHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="password"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">Reset Password</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>