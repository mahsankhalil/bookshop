<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex, nofollow">

<title>BookShop Register Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="styles.css">



<style type="text/css">
/* Made with love by Mutiullah Samim*/
@import url('https://fonts.googleapis.com/css?family=Numans');

html, body {
	margin-top:5px;
	background-image: url('book.jpg');

	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	
	height: 100%;
	font-family: 'Numans', sans-serif;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: auto;
	margin-top: auto;
	margin-bottom: auto;
	width: 800px;
	background-color: rgba(52, 72, 94, 0.7) !important;
}

.input-group-prepend span {
	width: 50px;
	background-color: #F7DC6F;
	color: black;
	border: 0 !important;
}

.radio {
	font-size: 24px;
	font-weight: 500;
	text-transform: capitalize;
	display: inline-block;
	vertical-align: middle;
	color: #fff;
	position: relative;
	padding-left: 30px;
	cursor: pointer;
}

.radio+.radio {
	margin-left: 20px;
}

.radio input[type="radio"] {
	display: none;
}

.radio span {
	height: 20px;
	width: 20px;
	border-radius: 50%;
	border: 3px solid #F7DC6F;
	display: block;
	position: absolute;
	left: 0px;
	top: 7px;
}

.radio span:after {
	content: "";
	height: 8px;
	width: 8px;
	background: #F7DC6F;
	display: block;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%) scale(0);
	border-radius: 50%;
	transition: 200ms ease-in-out 0s;
}

.radio input[type="radio"]:checked ~ span:after {
	transform: translate(-50%, -50%) scale(1);
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.register_btn {
	color: black;
	background-color: #F7DC6F;
	width: 180px;
}

.register_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.alert = function() {
	};
	var defaultCSS = document.getElementById('bootstrap-css');
	function changeCSS(css) {
		if (css)
			$('head > link')
					.filter(':first')
					.replaceWith(
							'<link rel="stylesheet" href="'+ css +'" type="text/css" />');
		else
			$('head > link').filter(':first').replaceWith(defaultCSS);
	}
	$(document).ready(function() {
		var iframe_height = parseInt($('html').height());
		window.parent.postMessage(iframe_height, 'https://bootsnipp.com');
	});
</script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript" 
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>

</head>

<body>

	<div class="container">
		<div class="d-flex justify-content-center h-100">



			<!-- Card  -->
			<div class="card">
				<div class="card-header">
					<h2 style="margin-top: 10px; color: #F7DC6F">Register Your
						Account</h2>
				</div>
				<div class="card-body">
					<!-- Form -->
					<form action="register" method="post" id="registerForm">
						<div class="col-lg-12 col-md-12">
							<div class="row">
								<div class="form-group col-md-6">
									<div class="input-group form-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-user"
												style="font-size: 20px"></i></span>
										</div>
										<input type="text" class="form-control"
											placeholder="Name" id="name" name="name"
											size="30" >

									</div>
								</div>

								<div class="form-group col-md-6">
									<div class="input-group form-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-at"
												style="font-size: 20px"></i></span>
										</div>
										<input type="email" class="form-control"
											placeholder="bookshop@gmail.com" id="email" name="email"
											>

									</div>
								

								</div>

							</div>
						</div>





						<div class="col-lg-12 col-md-12">
							<div class="row">
							<div class="form-group col-md-6">
									<div class="input-group form-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-key"
												style="font-size: 20px"></i></span>
										</div>
										<input type="password" class="form-control"
											placeholder="password" id="password" name="password" >
									</div>

								</div>
							
								
								<div class="form-group col-md-6">
									<div class="input-group form-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-key"
												style="font-size: 20px"></i></span>
										</div>
										<input type="password" class="form-control"
											placeholder="Confirm Password" id="confirm_password" name="confirm_password" >
									</div>

								</div>

							</div>
						</div>
					<b style="color:#F7DC6F">${message}</b>
						
						<div class="form-group">
							<input type="submit" value="Register"
								class="btn float-right register_btn">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links"
						style="margin-bottom: 10px">
						Have account?<a href="login.jsp">Login</a>
					</div>

				</div>
			</div>
		</div>
	</div>
		
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
	
</body>
</html>


		