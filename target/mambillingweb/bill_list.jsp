<%@page import="java.util.Collections"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.Bill"%>
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
<title>Bill List</title>

</head>
<body>
	<%
	List<Bill> bill_list = new ArrayList<Bill>();
	%>
	<%
	bill_list = (List<Bill>) request.getAttribute("billList");
	Collections.reverse(bill_list);
	%>

	<div class="top_nav">
		<h1>Bill List</h1>
		<div id="right_buttons">
		<a class="top" href="bills/new"><button class="top" id="additem_button">
			 &#x002B;Add New Bill 
		</button></a>
		<div class="div_search">
			<input class="searchbox" type="text" id="searchInput"
				placeholder="Enter Item Name Or ID" autofocus>
			<button class="srch" id="searchButton">
				<span> <i id="icon" class="fa fa-search"></i>
				</span>
			</button>
		</div>
		</div>
	</div>

	<table id="tableBody">
		<tr>
			<th>Bill No</th>
			<th>Date & Time</th>
			<th>View</th>

		</tr>
		<%
		for (Bill bill : bill_list) {
		%>
		<tr>
			<td><%=bill.getBillId()%></td>

			<%
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy   hh:mm:ss  a");
			String formattedDateTime =  bill.getTimeStamp().format(formatter);

			%>

			<!-- Display date and time separately in HTML -->
			<td style="width:40em;"><%=formattedDateTime%></td>


			<td><a class="arrow"
				href="bill/detail?BillId=<%=bill.getBillId()%>&UserId=<%=bill.getUserId()%>&time=<%=bill.getTimeStamp()%>">
					&#8594; </a></td>
			<%-- 	<td><a href="u/edit?UserId=<%=bill.getBillId()%>">
					<button class="update" type="submit">Update</button>
			</a></td> --%>

		</tr>
		<%
		}
		%>
	</table>
	<div id="results">
<img src="https://iili.io/JHkViml.png" alt="JHkViml.png" id="not_found_img" />
<h1 id="h3_tag">Bill Detail Not Found</h1>
</div>
	<script src="<%=request.getContextPath()%>/assets/js/item/item.js"></script>
</body>

</html>