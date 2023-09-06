<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>View Product</title>
<style>
/* Style for the container */
.container {
	width: 370px;
	height: 390px;
	border: 1px solid #ccc;
	padding: 20px;
	margin: 20px auto;
	background-color: #f5f5f5;
}
h1{
display: flex;
    justify-content: center;
}

/* Style for the product details */
.product-detail {
	margin-bottom: 10px;
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

.product-detail {
	font-size: 22px;
	margin-top: 8px;
	display: flex;
	justify-content: space-between;
}

.value {
	font-size: 22px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Product Details</h1>
		<%
		ProductDTO product = null;
		%>
		<%
		product = (ProductDTO) request.getAttribute("product");
		%>
		<div class="product-detail">
			<span class="label">Product Name :</span> <span class="value"><%=product.getProductName()%></span>
		</div>

		<div class="product-detail">
			<span class="label">Quantity :</span> <span class="value"><%=product.getQuantity()%></span>
		</div>

		<div class="product-detail">
			<span class="label">Quantity Type :</span> <span class="value"><%=product.getQuantityType()%></span>
		</div>

		<div class="product-detail">
			<span class="label">Special Name :</span>

			<%
			if (product.getSpecialName() == null) {
			%>
			<span class="value">-</span>
			<%
			} else {
			%>
			<span class="value"><%=product.getSpecialName()%></span>
			<%
			}
			%>


		</div>

		<div class="product-detail">
			<span class="label">MRP :</span> <span class="value"><%=product.getMrp()%></span>
		</div>

		<div class="product-detail">
			<span class="label">Tax :</span> <span class="value"><%=product.getTax()%></span>
		</div>

		<div class="product-detail">
			<span class="label">Discount :</span> <span class="value"><%=product.getDiscount()%></span>
		</div>
	</div>
	<div class="content1">
		<!-- Button path to navigate back to products -->
		<a href="./../products">
			<button class="button" id="submit" type="button">Back</button>
		</a>
	</div>
</body>
</html>
