<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<style>
/* Style for the table */
table {
	width: 97%;
    border-collapse: collapse;
    margin-top: 20px;
    margin-left: 1.5%;
}


table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 10px;
	text-align: left;
}

/* Style for buttons */
.view, .update, .delete,.top {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 3px;
	margin-right: 5px;
}

.view:hover, .update:hover, .delete:hover {
	background-color: #0056b3;
}

.top_nav {
	display: flex;
	justify-content: space-around;
}

#add {
	margin-left: 51em;
	height: 50px;
	margin-top: 20px;
	font-size: 19px;
}
</style>
</head>
<body>
	<%
	List<Product> product_list = new ArrayList<Product>();
	%>
	<%
	product_list = (List<Product>) request.getAttribute("productList");
	%>

	<div class="top_nav">
		<div>

			<h1>Product List</h1>
		</div>
		<button class="top" id="add">
			<a class="top" href="product/new"> &#x002B;Add New Item </a>
		</button>
	</div>
	
	<table border="1">
		<tr>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Type</th>
			<th>Special Name</th>
		</tr>
		<%
		for (Product product : product_list) {
		%>
		<tr>
			<td><%=product.getProductName()%></td>
			<td><%=product.getQuantity()%></td>
			<td><%=product.getQuantityType()%></td>
			<%
			if (product.getSpecialName() == null) {
			%>
			<td>-</td>
			<%
			} else {
			%>
			<td><%=product.getSpecialName()%></td>
			<%
			}
			%>




			<td><a href="products/details?productId=<%=product.getId()%>">
					<button class="view" type="submit">View</button>
			</a></td>
			<td><a href="product/edit?productId=<%=product.getId()%>">
					<button class="update" type="submit">Update</button>
			</a></td>
			<td><a href="product/delete?productId=<%=product.getId()%>">
					<button class="delete" type="submit">Delete</button>
			</a></td>
		</tr>
		<%
		}
		%>
	</table>
</body>

</html>