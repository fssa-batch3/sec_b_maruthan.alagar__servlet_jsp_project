<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Add New Customer</title>
<style>


h2 {
	color: #333;
	display: flex;
	align-items: center;
	justify-content: center;
}

form {
	max-width: 700px;
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

.content1 {
	display: flex;
	justify-content: space-between;
}

#span_save {
	font-size: 18px;
	margin-left: 10px;
}

#span_back {
	font-size: 18px;
	margin-right: 10px;
}

.button:hover {
	background-color: #0056b3;
}
</style>

</head>
<%
String message = (String) request.getAttribute("errorMessage");


%>

<%
if (message != null  ) {
%>

<script> alert("<%=message%>");</script>

<%
}
%>
<body>
	<form id="add_customer" action="create" method="post">
		<h2>Add New Customer</h2>
		<div class="content">
			<label class="forms">Customer Name</label> <input class="lists"
				type="text" name="customer_name" maxlength="50" placeholder="Enter Customer Name"
				required>
		</div>
		<div class="content">
			<label class="forms">Phone Number</label> <input class="lists"
				type="number" name="phone_number"min="6000000001" max="9999999999"  placeholder="Enter Mobile Number"
				 required>
		</div>

		<div class="content">
			<label class="forms">E-Mail Address (optional)</label> <input
				class="lists" type="text" name="email" maxlength="150"
				placeholder="Enter Customer E-Mail">
		</div>
		<div class="content">
			<label class="forms">Customer Address(optional)</label> <input
				class="lists" type="text" name="address"
				placeholder="Enter Customer Adress" maxlength="250">
		</div>
		<div class="content1">
			<a href="../users"><button class="button" id="submit"
					type="button">
					<span id="span_back">&#x2190</span>Back
				</button></a>
			<button class="button" id="submit" type="submit">
				Save<span id="span_save">&#8594;</span>
			</button>

		</div>
	</form>
</body>
</html>