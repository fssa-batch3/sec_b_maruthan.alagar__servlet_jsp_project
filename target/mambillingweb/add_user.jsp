<%@page import="in.fssa.mambilling.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/item/additem.css">
<meta charset="ISO-8859-1">
<title>Add New Customer</title>


</head>
<%
String where = (String) request.getAttribute("where");
String message = (String) request.getAttribute("errorMessage");
User newUser = (User) request.getAttribute("userDetails");
%>


<%
if (message != null) {
%>

<script> alert("<%=message%>");</script>

<%
}
%>


<body>
	<form id="additem_form" action="create" method="post">
		<h2>Add New Customer</h2>
		<div class="content">
			<label class="forms">Customer Name<span id="imp"> *</span></label> <input
				class="lists" type="text" name="customer_name" maxlength="50"
				pattern="^[a-zA-Z-\s]+$" id="customer_name" value="<%=(newUser != null) ?newUser.getName() : ""%>"
				title="Use Letters to Add Customer Name.Don't use Numbers or any special Characters"
				placeholder="Enter Customer Name" required autofocus>
			<div id="errorContainer"></div>
			<p id="req"></p>
		</div>
		<div class="content">
			<label class="forms">Phone Number<span id="imp"> *</span></label> <input
				class="lists" type="number" id="customer_phone" name="phone_number"
				placeholder="Enter Mobile Number" pattern="^[6789]\d{9,9}$"
				min="6000000001" max="9999999999" maxLength="10" value="<%=(newUser != null) ?newUser.getPhoneNumber() : ""%>"
				title="Use Numbers begin with 6,7,8,9 and must Enter 10 Characters"
				required>
			<div id="errorContainer_1"></div>
			<p id="req_1"></p>
		</div>

		<div class="content">
			<label class="forms">E-Mail Address (optional)</label> <input
				class="lists" type="text" id="customer_email" name="email"
				pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
				title="Please enter correct Email" maxlength="150" value="<%=(newUser != null) ?newUser.getEmail() : ""%>"
				placeholder="Enter Customer E-Mail">
			<div id="errorContainer_2"></div>
			<p id="req_2"></p>
		</div>
		<div class="content">
			<label class="forms">Customer Address(optional)</label> <input
				class="lists" type="text" id="customer_address" name="address"
				placeholder="Enter Customer Address" pattern="^[A-Za-z0-9\\s.,-]+$" value="<%=(newUser != null) ?newUser.getAddress() : ""%>"
				maxlength="250">

		</div>
		<input type="hidden" name="where" value="<%=where%>" />
		<div class="content1">

			<%
			if (where.equals("list")) {
			%>
			<a href="../users"><button class="button" id="submit"
					type="button">
					<span id="span_back">&#x2190</span>Back
				</button></a>
			<%
			} else {
			%>
			<a href="../bills/new"><button class="button" id="submit"
					type="button">
					<span id="span_back">&#x2190</span>Back
				</button></a>

			<%
			}
			%>
			<button class="button" id="submit" type="submit">
				Save<span id="span_save">&#8594;</span>
			</button>

		</div>
	</form>
	<script
		src="<%=request.getContextPath()%>/assets/js/customer/addcustomer.js"></script>
</body>
</html>