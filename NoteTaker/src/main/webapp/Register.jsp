<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page errorPage = "errorpage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register page</title>
</head>
<body>
	<%@include file="Index_Navbar.jsp"%>
	<div class="jumbotron bg-success"
		style="height: 38rem; clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);">
		<div class="container" style="width: 25rem;">
			<div class="card">
				<div class="card-header">
					<h2>Register Here!</h2>
				</div>
				<div class="card-body">
					<form id="form">
						<div class="form-group">
							<label for="exampleInputEmail1">User Name</label> <input
								type="text" required class="form-control"
								aria-describedby="emailHelp" placeholder="Enter Your Name" name="username">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Email</label> <input
								type="email" required class="form-control" name="email" 
								placeholder="Enter Your Email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" required class="form-control" name="password" 
								placeholder="Enter Your Password">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Select Gender</label>
							  Male <input type="radio" required name="gender" value="Male">
							Female <input type="radio" required name="gender" value="Female"> 
						</div>
					   <div class="container text-center">
						<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</form>
					<div class="container text-center" id="spinner" style="display:none;">
					<span class="fa fa-asterisk fa-spin fa-4x"></span>
					<h1>Please Wait...</h1>
					</div>
	                 
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function(){
	$('#form').on('submit',function(event){
		event.preventDefault();
		var f=$(this).serialize();
		$('#spinner').show('slow');
		$('#form').hide('slow');
		$.ajax({
			url:"UserRegistration",
			data:f,
			type:'POST',
			success:function(data,textStatus,jqXHR){
				if(data.trim()=="success"){
					$('#spinner').hide('slow');
					$('#form').show('slow');
					console.log(data);
					swal("Good Job!","You Have Successfully Register","success")
					.then((value) => {
					  window.location="Login.jsp";
					});
					
					
				}
				else{
					$('#spinner').hide('slow');
					$('#form').show('slow');
					swal("Good Job!","Opps something went wrong!","error")
					.then((value) => {
					  window.location="Register.jsp";
					});
				}
				
			},
			error:function(jqXHR,textStatus,errorThrown){	
			
			}
		})
		
	});
});

</script>
</body>
</html>