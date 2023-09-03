<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.Bill"%>
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
	List<Bill> bill_list = new ArrayList<Bill>();
	%>
	<%
	bill_list = (List<Bill>) request.getAttribute("billList");
	%>

	<div class="top_nav">
		<h1>Bill List</h1>
		<button class="top" id="add">
			<a class="top" href="bills/new"> &#x002B;Add New Bill </a>
		</button>
	</div>

	<table border="1">
		<tr>
			<th>Bill No</th>
			<th>Date</th>
			<th>Time</th>

		</tr>
		<%
		for (Bill bill : bill_list) {
		%>
		<tr>
			<td><%=bill.getBillId()%></td>

			<%
			String pattern = "yyyy-MM-dd HH:mm:ss";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
			String formattedDateTime = bill.getTimeStamp().format(formatter);
			String[] dateTimeParts = formattedDateTime.split(" ");
			String formattedDate = dateTimeParts[0];
			String formattedTime = dateTimeParts[1];
			%>

			<!-- Display date and time separately in HTML -->
			<td><%=formattedDate%></td>
			<td><%=formattedTime%></td>

			<td><a
				href="bill/detail?BillId=<%=bill.getBillId()%>&UserId=<%=bill.getUserId()%>&time=<%=bill.getTimeStamp()%>">
					<button class="view" type="submit">View</button>
			</a></td>
			<%-- 	<td><a href="u/edit?UserId=<%=bill.getBillId()%>">
					<button class="update" type="submit">Update</button>
			</a></td> --%>

		</tr>
		<%
		}
		%>
	</table>

</body>

</html>