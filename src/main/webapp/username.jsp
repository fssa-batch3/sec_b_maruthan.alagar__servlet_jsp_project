<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="before_login_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/login/login.css">
<title>Change Password</title>
</head>
<header>

	<div class="header">

		<img class="logo" src="https://iili.io/J9AdFF1.png" alt="logo"
			width="110px">

		<div class="list1" style="margin-top: 2.5em;">
			<a style="color: black;2.5em;"
				href="<%=request.getContextPath()%>/login.jsp">Back to Login</a>
		</div>

	</div>
</header>
<body>

	<main>
		<div class="one">
			<form id="login_form" action="updatepassword" method="POST">
				<h1 class="log">Change Password</h1>
				<div class="content">
					<label class="forms"> Enter Your Email Address</label> <input
						class="lists" name="email" id="email" type="email"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
						placeholder=" Enter Your Email"
						value="evergreensupermarket@gmail.com" required>

				</div>

				<div class="content">
					<label class="forms"> Create New Password</label> <input
						class="lists" id="first_password" name="password" type="password"
						placeholder="Abcd@123" value="Ever@1234"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~=?\|<>/]).{8,}"
						required>
				</div>
				<div class="content">
					<label class="forms">Re-Enter Password</label> <input class="lists"
						id="password" type="password" value="Ever@1234"
						placeholder="Abcd@123" required>

				</div>
				<div id="rulez" style="display: none;" class="rules">
					<p id="con">Constraints :-</p>
					<p id="con">* Password Length Max of 8 Characters</p>
					<p id="con">* Add 1 number & 1 uppercase letter</p>
					<p id="con">* Add 1 lowercase letter & Add 1 Symbol</p>
				</div>

				<div class="content_1">
					<button class="button1" type="submit">
						Update <span>&#8594;</span>
					</button>

				</div>
			</form>
		</div>
	</main>
	<script
		src="<%=request.getContextPath()%>/assets/js/profile/username.js"></script>

</body>
</html>