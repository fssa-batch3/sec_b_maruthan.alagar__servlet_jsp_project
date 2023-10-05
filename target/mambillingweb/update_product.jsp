<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/item/additem.css">
<meta charset="ISO-8859-1">
<title>Update Product</title>

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
	ProductDTO product = null;
	%>
	<%
	product = (ProductDTO) request.getAttribute("productDetail");
	%>
	<%
	int productId = Integer.parseInt((String) request.getAttribute("id"));
	%>
	<form id="additem_form" action="update" method="post">
		<h2>Update Product Details</h2>
		<div class="parts">
			<div class="part1">
				<div class="content">
					<label class="forms">Product Name<span id="imp"> *</span></label> <input class="lists"
						name="product_name" id="product_name" type="text" minLength="5" pattern="^[a-zA-Z\s]+$"  placeholder="Product Name" maxlength="100"
						value="<%=product.getProductName()%>" required>
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
						<input class="lists" name="quantity" id="quantity"
							value="<%=product.getQuantity()%>" max="26000" min="1"
							type="number" placeholder="Choose Number" required>
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
						<label class="forms" id="mrp_label">MRP(Rs)<span id="imp"> *</span></label>

					</div>
					<div class="quan">
						<input class="lists" value="<%=(int)product.getMrp()%>" min="0"
							max="50000" id="mrp" name="mrp" type="number" placeholder="Enter MRP"
							required>

					</div>
				</div>




			</div>
			<div class="part1">

				<div class="content">
					<div class="label">
						<label class="forms">Tax (%)<span id="imp"> *</span></label> <label class="forms" for="type"
							id="discount_label">Discount (%)<span id="imp"> *</span></label>
					</div>
					<div class="quan">
						<input class="lists" id="tax" value="<%=(int)product.getTax()%>"
							name="tax" type="number" placeholder="Enter Tax" min="0" max="99"
							required>
						<div class="typeport">
							<input class="lists" id="discount"
								value="<%=(int)product.getDiscount()%>" name="discount" type="number"
								min="0" max="99" placeholder="Enter Discount" required>
						</div>
					</div>
				</div>
				<div class="content">
					<input class="lists" name="product_id" type="hidden"
						value=<%=productId%> placeholder="Enter ID" readonly>
				</div>
				<div class="content">
					<label class="forms">Special name(optional)</label>

					<%
					if (product.getSpecialName() == null) {
					%>
					<input class="lists" name="special_name" value="-" maxlength="100"
						type="text" id="special_name" pattern="^[a-zA-Z-\s]+$" placeholder="Enter special name">
						<div id="errorContainer_1">
						</div>
						<p id="req_1"></p>

					<%
					} else {
					%>
					<input class="lists" name="special_name"
						value="<%=product.getSpecialName()%>" maxlength="100" type="text"
						placeholder="Enter special name">
						<div id="errorContainer_1">
						</div>
						<p id="req_1"></p>


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
	<script src="<%=request.getContextPath()%>/assets/js/item/viewitem.js"></script>
</body>
</html>