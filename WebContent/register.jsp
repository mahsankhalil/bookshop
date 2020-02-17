<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="net.codejava.User"  %>
<% 
	HttpSession s = request.getSession();
	User user = null;

	user = (User)s.getAttribute("user");
	if(user!=null){
		response.sendRedirect("home.jsp");
		return;
	}

%>
<html>
<head>
<meta charset="utf-8">
<title>Bookshop Website</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript" 
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
</head>
<body>
	<div style="text-align: center">
		<h1>Admin Login</h1>
		<form action="register" method="post" id="registerForm">
		
			<label for="name">Name:</label>
			<input name="name" required type="text" size="30" />
			<br><br>
			<label for="email">Email:</label>
			<input name="email" required type="email" size="30" />
			<br><br>
			<label for="password">Password:</label>
			<input type="password" required name="password" size="30" />
			<br><br>
			<label for="confirm_password">Confirm Password:</label>
			<input type="password" required name="confirm_password" size="30" />
			<br>${message}
			<br><br>			
			<button type="submit">Register</button>
		</form>
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		$("#registerForm").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
		
				password: "required",
			},
			
			messages: {
				email: {
					required: "Please enter email",
					email: "Please enter a valid email address"
				},
				
				password: "Please enter password"
			}
		});

	});
</script>
</html>