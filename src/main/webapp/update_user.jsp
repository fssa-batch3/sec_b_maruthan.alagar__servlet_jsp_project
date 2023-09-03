<%@page import="in.fssa.mambilling.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

h2 {
	color: #333;
}

form {
	max-width: 500px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.content {
	margin-bottom: 15px;
}

.forms {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.lists {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 3px;
}

.button span {
	margin-left: 5px;
}

.button:hover {
	background-color: #0056b3;
}
</style>

</head>
<body>
	<%
	long phone_number = (Long) request.getAttribute("userPhone");
	%>
	<%
	User user = null;
	%>
	<%
	user = (User) request.getAttribute("userDetail");
	%>

	<form id="add_customer" action="update" method="post">
		<h2>Update Customer Details</h2>
		<div class="content">
			<label class="forms">Customer Name</label> <input class="lists"
				type="text" name="customer_name" value="<%=user.getName()%>"
				placeholder="Enter Customer Name" required>
		</div>
		<div class="content">
			<label class="forms">Phone Number</label> <input class="lists"
				type="tel" name="phone_number" value="<%=user.getPhoneNumber()%>"
				placeholder="Enter Mobile Number" maxlength="10" required>
		</div>

		<div class="content">
			<label class="forms">E-Mail Address (optional)</label>

			<%
			if (user.getEmail() == null) {
			%>
			<input class="lists" type="text" name="email" value="-"
				placeholder="Enter Customer E-Mail">
			<%
			} else {
			%>
			<input class="lists" type="text" name="email"
				value="<%=user.getEmail()%>" placeholder="Enter Customer E-Mail">
			<%
			}
			%>





		</div>
		<div class="content">
			<label class="forms">Customer Address(optional)</label>



			<%
			if (user.getAddress() == null) {
			%>
			<input class="lists" type="text" name="address" value="-"
				placeholder="Enter Customer Adress">
			<%
			} else {
			%>				
				<input class="lists" type="text" name="address" value="<%=user.getAddress()%>"
				placeholder="Enter Customer Adress">
			<%
			}
			%>


		</div>
		<input type="hidden" name="userPhone" value="<%=phone_number%>">
		<button class="button" type="submit">
			Update<span>&#8594;</span>
		</button>
	</form>
</body>
</html>