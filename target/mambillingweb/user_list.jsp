<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/item/item.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>User List</title>

</head>
<body>
	<%
	List<User> user_list = new ArrayList<User>();
	%>
	<%
	user_list = (List<User>) request.getAttribute("userList");
	Collections.reverse(user_list);
	%>

	<div class="top_nav">
		<h1>Customer List</h1>
		<div id="right_buttons">
			<a class="top" href="users/new?redirectedTo=list"><button class="top"
					id="additem_button">&#x002B;Add New Customer</button></a>
			<div class="div_search">
				<input class="searchbox" type="text" id="searchInput"
					placeholder="Enter Item Name Or ID" autofocus>
				<button class="srch" id="searchButton">
					<span> <i id="icon" class="fa fa-search"autofocus></i>
					</span>
				</button>
			</div>
		</div>
	</div>

	<table id="tableBody">
		<tr>
			<th>Customer Name</th>
			<th>Phone Number</th>
			<th>View</th>
		</tr>
		<%
		for (User user : user_list) {
			
			if(user.getPhoneNumber()==9000000000l){
				continue;
			}
		%>
		<tr>
			<td><%=user.getName()%></td>
			<td><%=user.getPhoneNumber()%></td>

			<td><a class="update arrow"
				href="user/edit?UserId=<%=user.getId()%>"> &#8594; </a></td>

		</tr>
		<%
		}
		%>
	</table>
	<div id="results">
<img src="https://iili.io/JHkViml.png" alt="JHkViml.png" id="not_found_img" />
<h1 id="h3_tag">Customer Not Found</h1>
</div>
	<script src="<%=request.getContextPath()%>/assets/js/item/item.js"></script>
</body>

</html>