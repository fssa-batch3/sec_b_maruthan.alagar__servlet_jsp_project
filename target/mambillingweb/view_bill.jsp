<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="in.fssa.mambilling.model.User"%>
<%@page import="in.fssa.mambilling.model.Bill"%>
<%@page import="in.fssa.mambilling.model.BillItems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
}

h2, h3, h4 {
	margin: 10px;
}

.bill-container {
	max-width: 298px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	background-color: white;
}

.shop-details {
	margin-bottom: 20px;
	display: flex;
	font-size: 13px;
	justify-content: space-between;
}

#bill_table {
	width: 100%;
	border-collapse: collapse;
}

#bill_table th, #bill_table td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

#bill_table th {
	background-color: #f2f2f2;
	text-align: left;
}

#shop {
	text-align: center;
}

#total {
	display: flex;
	justify-content: space-between;
}

#total h2, #total h3, #total h4, #total h5, #total h6 {
	margin: 5px;
}

#total_tax, #total_amount, #sub_total, #total_discount {
	text-align: right;
}

#shop-details p {
	display: flex;
}

#bottom_label {
	display: flex;
	justify-content: space-between;
	font-size: 14px;
}

#b_lab {
	text-align: left;
}

#b_con {
	text-align: right;
}

.main {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 35vh;
}

.btn {
	width: 270px;
	height: 60px;
	font-size: 18px;
	background: #fff;
	border: none;
	display: block;
	border-radius: 50px;
	color: #000;
	outline: none;
	font-weight: bolder;
	cursor: pointer;
	transition: all 0.4s;
}

#a_tag {
	text-decoration: none;
}

.btn:hover {
	box-shadow: #ffffff;
	background: #46b8de;
	color: #ffffff;
}

#thank {
	text-align: center;
	font-size: 17px;
	font-weight: bold;
	font-family: unset;
}
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