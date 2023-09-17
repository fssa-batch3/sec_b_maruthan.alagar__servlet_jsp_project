<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="in.fssa.mambilling.model.User"%>
<%@page import="in.fssa.mambilling.model.Bill"%>
<%@page import="in.fssa.mambilling.model.BillItems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/billing/bill_design.css">
<meta charset="ISO-8859-1">
<title>View Bill</title>
<style type="text/css">

</style>
</head>
<body>

	<%
	List<BillItems> billItems = (List<BillItems>) request.getAttribute("billItems");
	List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
	Bill newBill = (Bill) request.getAttribute("bill");
	User newUser = (User) request.getAttribute("user");
	
	String pattern = "yyyy-MM-dd HH:mm:ss";
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
	String formattedDateTime = newBill.getTimeStamp().format(formatter);
	String[] dateTimeParts = formattedDateTime.split(" ");
	String formattedDate = dateTimeParts[0];
	String formattedTime = dateTimeParts[1];
	
	double totalTax=0;
	double totalDiscount=0;
	double billTotal = 0;
	%>



	<div class="bill-container" id="bill_div">
		<div id="heading">
			<div id="shop">
				<h2 id="shop_name">Supermarket Bill</h2>
				<h3 id="phone_number">Evergreen Supermarket</h3>
				<h3 id="Adress">Trichy</h3>
			</div>
		</div>

		<div id="bottom_label">
			<div id="b_lab">
				<p>GSTN No :</p>
				<p>Bill No :</p>
				<p>Date & Time :</p>


			</div>
			<div id="b_con">
				<p id="gstn_no">-</p>
				<p id="bill_no"><%=newBill.getBillId()%></p>
				<p id="date"><%=formattedDate +" "+formattedTime%></p>

			</div>
		</div>

		<div id="bill_table_div">
			<h3>Product Details:</h3>
			<table id="bill_table">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (ProductDTO item : products) {

						totalTax += item.getTax();
						totalDiscount += item.getDiscount();
						
						double taxAmount = (item.getTax() / 100) * item.getMrp();

						// Calculate the discount amount
						double discountAmount = (item.getDiscount() / 100) * item.getMrp();

						// Calculate the final price after applying tax and discount
						double finalPrice = item.getMrp() + taxAmount - discountAmount;
						
						billTotal += finalPrice * item.getTotalQuantity();
					%>
					<tr>
						<td><%=item.getProductName()%></td>
						<td><%=(int)item.getMrp()%></td>
						<td><%=item.getTotalQuantity()%></td>
						<td><%=item.getMrp() * item.getTotalQuantity() %>/-</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<div id="total">
			<div id="bottom">

				<h5>Total Tax :</h5>

				<h5>Total discount :</h5>
				<hr />
				<h2>Total Amount :</h2>
				<hr />

			</div>
			<div id="bottom">

				<h5 id="total_tax"><%=(int)totalTax %> %</h5>

				<h5 id="total_discount"><%=(int)totalDiscount %> %</h5>
				<hr />
				<h2 id="total_amount"><%=(int)billTotal %> /-</h2>
				<hr />
			</div>

		</div>


		<div id="bottom_label">
			<div id="b_lab">
				<p>Customer Name :</p>
				<p>Paid By :</p>
				<p>Transaction ID :</p>


			</div>
			<div id="b_con">
				<p id="cus_name"><%=newUser.getName()%></p>
				<p id="payment">Cash</p>
				<p id="trans_id">-</p>

			</div>

		</div>
		<div id="thank">
			<p>THANK YOU !</p>

		</div>



	</div>
	<div class="main">
		<a href="../bills" id="a_tag"><button id="btn" class="btn">Back</button></a>
	</div>
</body>
</html>