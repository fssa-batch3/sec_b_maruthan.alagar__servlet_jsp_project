<%@page import="in.fssa.mambilling.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/item/additem.css">
<meta charset="ISO-8859-1">
<title>Update User</title>


</head>
<%
String message = (String) request.getAttribute("errorMessage");
%>

<%
if (message != null) {
%>

<script> alert("<%=message%>");</script>
<%
}
%>
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

	<form id="additem_form" action="update" method="post">
		<h2>Update Customer Details</h2>
		<div class="content">
			<label class="forms">Customer Name<span id="imp"> *</span></label> <input class="lists"
				type="text" id="customer_name" name="customer_name" value="<%=user.getName()%>" pattern="[^\s][a-zA-Z]+(\s[a-zA-Z]+)?[^\s]"
			 title="Use Letters to Add Customer Name.Don't use Numbers or any special Characters"	placeholder="Enter Customer Name" maxlength="50" required>
		</div>
		<div class="content">
			<label class="forms">Phone Number<span id="imp"> *</span></label> <input class="lists"
				type="number" name="phone_number" value="<%=user.getPhoneNumber()%>"
				placeholder="Enter Mobile Number" id="customer_phone"  title="Use Numbers begin with 6,7,8,9 and must Enter 10 Characters" min="6000000001" max="9999999999" required>
		</div>

		<div class="content">
			<label class="forms">E-Mail Address (optional)</label>

			<%
			if (user.getEmail() == null) {
			%>
			<input class="lists" type="text" name="email" value="-"
				placeholder="Enter Customer E-Mail" id="customer_email"  title="Please enter correct Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="150">
			<%
			} else {
			%>
			<input class="lists" type="text" name="email"
				value="<%=user.getEmail()%>" id="customer_email"  maxlength="150" title="Please enter correct Email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Enter Customer E-Mail">
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
				placeholder="Enter Customer Adress" id="customer_address"  maxlength="250">
			<%
			} else {
			%>
			<input class="lists" type="text" name="address"
				value="<%=user.getAddress()%>" placeholder="Enter Customer Adress" id="customer_address"  maxlength="250">
			<%
			}
			%>


		</div>
		<input type="hidden" name="userPhone" value="<%=phone_number%>">
		<div id="requirements">
		<p id="req">Requirements :</p>
		<p id="inner_text">Please enter Valid Details.</p>
		</div>
		<div class="content1">
			<a href="../users"><button class="button" id="submit"
					type="button">
					<span id="span_back">&#x2190</span>Back
				</button></a>
			<button class="button" id="submit" type="submit">
				Update<span id="span_save">&#8594;</span>
			</button>

		</div>
	</form>
	<script src="<%=request.getContextPath()%>/assets/js/customer/addcustomer.js"></script>
</body>
</html>