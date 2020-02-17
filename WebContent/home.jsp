<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="net.codejava.User"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin CPanel - Bookshop</title>
</head>
<body>
	<div style="text-align: center">
<%
	HttpSession s = request.getSession();
	User user = null;

	user = (User)s.getAttribute("user");

%>
		<h1>Welcome to Bookshop Website Admin Panel</h1>
		<%
			if(user!=null){
				%>
				<b>${user.fullname} (${user.email})</b>
				<br><br>
				<a href="logout">Logout</a>
				<% 
			}else{
				%>
				<br><br>
				<a href="login.jsp">Login</a>
				<a href="register.jsp">Register</a>
				<%
			}
		%>
		
	</div>
</body>
</html>