<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* Style for the table */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 10px;
	text-align: left;
}

/* Style for buttons */
.view, .update, .delete, .top {
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
	List<User> user_list = new ArrayList<User>();
	%>
	<%
	user_list = (List<User>) request.getAttribute("userList");
	%>

	<div class="top_nav">
		<h1>Customer List</h1>
		<button class="top" id="add">
			<a class="top" href="users/new"> &#x002B;Add New Customer </a>
		</button>
	</div>

	<table border="1">
		<tr>
			<th>Customer Name</th>
			<th>Phone Number</th>
		</tr>
		<%
		for (User user : user_list) {
		%>
		<tr>
			<td><%=user.getName()%></td>
			<td><%=user.getPhoneNumber()%></td>

			<td><a href="products/details?productId=<%=user.getId()%>">
					<button class="view" type="submit">View</button>
			</a></td>
			<td><a href="product/edit?productId=<%=user.getId()%>">
					<button class="update" type="submit">Update</button>
			</a></td>

		</tr>
		<%
		}
		%>
	</table>

</body>

</html>