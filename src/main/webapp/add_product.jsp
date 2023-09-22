<%@page import="in.fssa.mambilling.model.Product"%>
<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/item/additem.css">
<title>Add New Product</title>

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
	<form id="additem_form" action="create" method="post">
		<h2>Add New Product</h2>
		<div class="parts">
			<div class="part1">
				<div class="content">
					<label class="forms">Product Name<span id="imp"> *</span></label> <input class="lists"
						name="product_name" type="text"  pattern="^[a-zA-Z\s]+$" maxlength="100" placeholder="Product Name"  id="product_name" title="Use Letters to Add Product Name.Don't use Numbers any special Characters"
						required autofocus>
						<div id="errorContainer">
						</div>
						<p id="req"></p>
						</div>

				<div class="content">
					<div class="label">
						<label class="forms">Quantity<span id="imp"> *</span></label> <label class="forms" 
							for="type" id="tp">Type<span id="imp"> *</span></label>
					</div>
					<div class="quan">
						<input class="lists" id="quantity" name="quantity" type="number"
							placeholder="Enter Quantity" max="26000" min="1" required>
						<div class="typeport">

							<select class="lists" name="type" id="type" required>
								<option value="">--Select--</option>
								<option value="g">g</option>
								<option value="ml">ml</option>
								<option value="nos">Nos</option>
							</select>
						</div>
					</div>
				</div>



				<div class="content">
					<div class="label">
						<label class="forms" id="mrp_label">MRP(Rs)<span id="imp"> *</span></label>

					</div>
					<div class="quan">
						<input class="lists" id="mrp" name="mrp" min="0" max="50000" type="number"
							placeholder="Enter MRP" required>

					</div>
				</div>




			</div>
			<div class="part1">

				<div class="content">
					<div class ="label">
						<label class="forms">Tax (%)<span id="imp"> *</span></label> <label class="forms" for="type"
							id="discount_label">Discount (%)<span id="imp"> *</span></label>
					</div>
					<div class="quan">
						<input max="99" class="lists" id="tax" name="tax"
							type="number" placeholder="Enter Tax" min="0" required>
						<div class="typeport">
							<input class="lists" id="discount" name="discount" type="number"
								placeholder="Enter Discount" min="0" max="99" required>
						</div>
					</div>
				</div>

				<div class="content">
					<label class="forms">Special name(optional)</label> <input
						class="lists" name="special_name" pattern="^[a-zA-Z-\s]+$" maxlength="100" type="text" id="special_name" title="Use Letters to Add Special Name. Don't use Numbers or any special Characters. Use - if there is no Special name"
						placeholder="Enter special name">
						<div id="errorContainer_1">
						</div>
						<p id="req_1"></p>
				</div>
			</div>
		</div>
		<div class="content1">
			<a href="../products"><button class="button" id="submit"
					type="button">
					<span id="span_back">&#x2190</span>Back
				</button></a>
			<button class="button" id="submit" type="submit">
				Save<span id="span_save">&#8594;</span>
			</button>

		</div>

	</form>
		<script src="<%=request.getContextPath()%>/assets/js/item/additem.js"></script>
</body>
</html>