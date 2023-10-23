<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="before_login_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/login/login.css">
<title>Login Shop</title>
</head>
<header>

	<div class="header">

		<img class="logo" src="https://iili.io/J9AdFF1.png" alt="logo"
			width="110px">

		<div class="list1">
			<a href="<%=request.getContextPath()%>/shops/register">
				<button class="button1" id="head_button" type="submit">
					Register Here</button>
			</a>


		</div>

	</div>
</header>
<body>
	<%
	String message = (String) request.getAttribute("errorMessage");
	String email = (String) request.getAttribute("old_email");
	String password = (String) request.getAttribute("old_password");
	
	%>

	<%
	if (message != null) {
	%>

	<script> alert("<%=message%>");</script>

	<%
	}
	%>
	<main>
		<div class="one">
			<form id="login_form" action="login" method="POST">
				<h1 class="log">Login</h1>
				<div class="content">
					<label class="forms">Email Address<span id="imp"> *</span></label> <input class="lists"
						id="email" type="email" name="email"
						value="<%=(email != null) ?email : ""%>" 
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
						placeholder="Enter Your Email" required>

				</div>

				<div class="content">
					<label class="forms">Password<span id="imp"> *</span></label> <input class="lists"
						id="password" name="password" type="password"
						value="<%=(password != null) ? password : ""%>" 
						placeholder="Enter Password" required>
				</div>
				<div id="forgot_div">
					<a href="<%=request.getContextPath()%>/username.jsp" id="forgot">
						<ins>Forgot Password </ins>
					</a>
				</div>

				<div class="content_1">
					<button id="sub" class="button1" type="submit">
						Login <span>&#8594;</span>
					</button>

				</div>
			</form>
		</div>
	</main>
	<script src="<%=request.getContextPath()%>/assets/js/profile/login.js"></script>

</body>

</html>

