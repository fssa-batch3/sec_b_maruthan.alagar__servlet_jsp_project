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
String message = (String) request.getAttribute("errorMessage");

String where = (String) request.getAttribute("where");
//System.out.println(where+" - add user jsp"); 
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
			<label class="forms">Customer Name<span id="imp"> *</span></label> <input class="lists"
				type="text" name="customer_name" maxlength="50"  pattern="[^\s][a-zA-Z]+(\s[a-zA-Z]+)?[^\s]"
                 id="customer_name"       title="Use Letters to Add Customer Name.Don't use Numbers or any special Characters"
				placeholder="Enter Customer Name" required autofocus>
		</div>
		<div class="content">
			<label class="forms">Phone Number<span id="imp"> *</span></label> <input class="lists"
				type="number"  id="customer_phone"name="phone_number" min="6000000001" max="9999999999"
				placeholder="Enter Mobile Number"  title="Use Numbers begin with 6,7,8,9 and must Enter 10 Characters" required>
		</div>

		<div class="content">
			<label class="forms">E-Mail Address (optional)</label> <input
				class="lists" type="text" id="customer_email" name="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"  title="Please enter correct Email" maxlength="150"
				placeholder="Enter Customer E-Mail">
		</div>
		<div class="content">
			<label class="forms">Customer Address(optional)</label> <input
				class="lists" type="text" id="customer_address" name="address"
				placeholder="Enter Customer Adress" maxlength="250">
		</div>
		<input type="hidden" name="where" value="<%=where%>" />
		<div id="requirements">
		<p id="req">Requirements :</p>
		<p id="inner_text">Please enter Valid Details.</p>
		</div>
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
	<script src="<%=request.getContextPath()%>/assets/js/customer/addcustomer.js"></script>
</body>
</html>