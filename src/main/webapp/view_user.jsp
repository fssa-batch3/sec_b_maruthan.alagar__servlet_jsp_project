<%@page import="in.fssa.mambilling.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<title>View User</title>
<style>
/* Style for the container */
.container {
	width: 556px;
    height: 280px;
	border: 1px solid #ccc;
	padding: 20px;
	margin: 20px auto;
	background-color: #fff;
}

h1{
display: flex;
    justify-content: center;
}

/* Style for the user details */
.user-detail {
	font-size: 22px;
	margin-top: 8px;
	display: flex;
	justify-content: space-between;
}

.value {
	font-size: 22px;
}

/* Style for labels */
.label {
	font-weight: bold;
}

/* Style for values */
.value {
	color: #007bff; /* Blue color for values */
}

/* Style for the "Back" button */
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
	margin-left: 48%;
}

.button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h1>User Details</h1>
		<%
		User user = null;
		%>
		<%
		user = (User) request.getAttribute("user");
		%>
		<div class="user-detail">
			<span class="label">Customer Name:</span><div> <span class="value"><%=user.getName()%></span></div>
		</div>

		<div class="user-detail">
			<span class="label">Phone Number:</span> <span class="value"><%=user.getPhoneNumber()%></span>
		</div>

		
		<div class="user-detail">
			<span class="label">Address:</span>

			<%
			if (user.getAddress() == null) {
			%>
			<span class="value">-</span>
			<%
			} else {
			%>
			<span class="value"><%=user.getAddress()%></span>
			<%
			}
			%>

		</div>
		<div class="user-detail">
			<span class="label">Email:</span>

			<%
			if (user.getEmail() == null) {
			%>
			<span class="value">-</span>
			<%
			} else {
			%>
			<span class="value"><%=user.getEmail()%></span>
			<%
			}
			%>


		</div>

	</div>
	<div class="content1">
		<!-- Button path to navigate back to products -->
		<a href="./../users">
			<button class="button" id="submit" type="button">Back</button>
		</a>
	</div>
</body>
</html>
