<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<style>


h2 {
	color: #333;
	display: flex;
	align-items: center;
	justify-content: center;
}

#updateitem_form {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.content {
	margin-bottom: 15px;
}

.label {
	display: flex;
	justify-content: space-between;
}
.label label {
	width: 50%;
}

.forms {
	font-weight: bold;
}

.lists {
width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: 8px;
}

.quan {
	display: flex;
	justify-content: space-between;
	flex-direction: row;
	flex-wrap: nowrap;
}

#quantity {
	width: 42%;
}

.typeport {
	width: 51%;
}

#type {
	width: 100%;
}
#discount {
	width: 100%;
}

.button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
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
</style>
</head>

<%
String message = (String) request.getAttribute("errorMessage");
%>

<%if (message != null) {%>

<script> alert("<%=message%>"); </script>
<%}%>
<body>

	<%
	ProductDTO product = null;
	%>
	<%
	product = (ProductDTO) request.getAttribute("productDetail");
	%>
	<%
	int productId = Integer.parseInt((String) request.getAttribute("id"));
	%>
	<form id="updateitem_form" action="update" method="post">
		<h2>Update Item</h2>
		<div class="parts">
			<div class="part1">
				<div class="content">
					<label class="forms">Product Name</label> <input class="lists"
						name="product_name" type="text" placeholder="Product Name"
						value="<%=product.getProductName()%>" required>

				</div>

				<div class="content">
					<div class="label">
						<label class="forms">Quantity:</label> <label class="forms" for="type" id="tp">Type:</label>
					</div>
					<div class="quan">
						<input class="lists" name="quantity" id="quantity"
							value="<%=product.getQuantity()%>" type="number"
							placeholder="Choose Number" required>
						<div class="typeport">


							<select class="lists" name="type" id="type" required>
								<option value="">--Select--</option>

								<option value="g"
									<%=product.getQuantityType().toString().equals("g") ? "selected" : "-"%>>g</option>
								<option value="ml"
									<%=product.getQuantityType().toString().equals("ml") ? "selected" : "-"%>>ml</option>
								<option value="nos"
									<%=product.getQuantityType().toString().equals("nos") ? "selected" : "-"%>>Nos</option>
							</select>
						</div>
					</div>
				</div>



				<div class="content">
					<div class="label">
						<label class="forms" id="mrp_label">MRP:</label>

					</div>
					<div class="quan">
						<input class="lists" value="<%=product.getMrp()%>" name="mrp"
							type="number" placeholder="Enter MRP" required>

					</div>
				</div>




			</div>
			<div class="part1">

				<div class="content">
					<div class="label">
						<label class="forms">Tax:</label> <label class="forms" for="type"
							id="discount_label">Discount:</label>
					</div>
					<div class="quan">
						<input class="lists"  id="quantity" value="<%=product.getTax()%>" name="tax"
							type="number" placeholder="Enter Tax" required>
						<div class="typeport">
							<input class="lists" id="discount" value="<%=product.getDiscount()%>"
								name="discount" type="number" placeholder="Enter Discount"
								required>
						</div>
					</div>
				</div>
				<div class="content">
					<input class="lists"
						name="product_id" type="hidden" value=<%=productId%>
						placeholder="Enter ID" readonly>
				</div>
				<div class="content">
					<label class="forms">Special name(optional)</label>

					<%
					if (product.getSpecialName() == null) {
					%>
					<input class="lists" name="special_name" value="-" type="text"
						placeholder="Enter special name">

					<%
					} else {
					%>
					<input class="lists" name="special_name"
						value="<%=product.getSpecialName()%>" type="text"
						placeholder="Enter special name">


					<%
					}
					%>

				</div>
			</div>
		</div>
		<div class="content1">
			<a href="../products"><button class="button" id="submit"
					type="button">
					<span id="span_back">&#x2190</span>Back
				</button></a>
			<button class="button" id="submit" type="submit">
				Update<span id="span_save">&#8594;</span>
			</button>

		</div>

	</form>
</body>
</html>