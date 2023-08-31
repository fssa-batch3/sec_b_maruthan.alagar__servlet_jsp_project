<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%List<Product> product_list = new ArrayList<Product>(); %>
<% product_list = (List<Product>) request.getAttribute("productList"); %>

 <h1>Product List</h1>
    
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
			<td><%=product.getSpecialName()%></td>
			<td>
				<a href="products/details?productId=<%= product.getId()%>">
					<button class="view" type="submit">View</button>
				</a>
				
			</td>
			<%-- <td>
				<a href="user/edit?userId=<%= product.getId()%>">
					<button class="update" type="submit">Update</button>
				</a>
			</td>
			<td>
				<a href="user/delete?userId=<%= product.getId()%>">
					<button class="delete" type="submit">Delete</button>
				</a>
			</td> --%>
		</tr>
		<%
		}
		%>
    </table>

</body>

</html>