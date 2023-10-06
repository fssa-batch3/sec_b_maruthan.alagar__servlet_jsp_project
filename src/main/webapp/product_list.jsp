<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/item/item.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
	List<Product> product_list = new ArrayList<Product>();
	
	%>
	<%
	product_list = (List<Product>) request.getAttribute("productList");
	Collections.reverse(product_list);
	%>

	<div class="top_nav">
		<div>

			<h1>Product List</h1>
		</div>
		<div id="right_buttons">
		<a class="top" href="product/new"><button class="top" id="additem_button">
			 &#x002B;Add New Product 
		</button></a>
		<div class="div_search">
			<input class="searchbox" type="text" id="searchInput" focus="true"
				placeholder="Enter Item Name Or ID" autofocus>
			<button class="srch" id="searchButton" >
				<span> <i id="icon" class="fa fa-search"></i>
				</span>
			</button>
			</div>
		</div>
	</div>

	<table id="tableBody">
		<tr>
		 <th>S.No</th>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Type</th>
			<th>Special Name</th>
			<th>View</th>
		</tr>
		<%
		int sNo = 1;
		for (Product product : product_list) {
		%>
		<tr>
			<td><%=sNo+"."%></td>
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




			<%-- <td><a href="products/details?productId=<%=product.getId()%>">
					<button class="view" type="submit">View</button>
			</a></td> --%>
			<td><a class="update arrow"
				href="product/edit?productId=<%=product.getId()%>"> &#8594; </a></td>
			<%-- 	<td><a href="product/delete?productId=<%=product.getId()%>">
					<button class="delete" type="submit">Delete</button>
			</a></td> --%>
		</tr>
		<%
		sNo++;
		}
		%>
	</table>
	<div id="results">
<img src="https://iili.io/JHkViml.png" alt="JHkViml.png" id="not_found_img" />
<h1 id="h3_tag">Product Not Found</h1>
</div>
	<script src="<%=request.getContextPath()%>/assets/js/item/item.js"></script>
</body>

</html>