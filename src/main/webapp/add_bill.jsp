<%@page import="in.fssa.mambilling.model.BillItems"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

#cus_form, #payment {
	background-color: #fff;
	padding: 20px;
	margin: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.lists {
	margin: 5px 0;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 88%;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

#top {
	display: flex;
	justify-content: space-between;
}

h2, h1 {
	margin: 0;
}

#btn {
	background-color: #28a745;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 30%;
	width: 49%;
	font-size: 20px;
}

#btn:hover {
	background-color: #218838;
}

#customer {
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-left: -12%;
	margin-right: 1%;
}

#customer input {
	width: 181%;
}

#payment {
	display: flex;
	justify-content: space-around;
}

#payment input {
	margin: 5px 0;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 88%;
}

#left {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

#big {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

#buttonDiv {
	width: 20%;
}

#mainTable {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

#mainTable th, #mainTable td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
	background-color: #f8f8f8; /* Light gray background color for cells */
}

#mainTable th {
	background-color: #e0e0e0;
	/* Lighter gray background color for headers */
	font-weight: bold;
}

#mainTable tr:nth-child(even) {
	background-color: #f0f0f0; /* Even row background color */
}

#mainTable td input {
	border: none;
	text-align: center;
	width: 100%;
	padding: 0;
	background-color: transparent;
	outline: none;
	font-size: 14px;
}
</style>

</head>
<body>





	<form id="cus_form">
		<div class="namebar">
			<div id="customer">
				<div>
					<label>Customer Name:</label> <input class="lists" type="text"
						id="customer_name" placeholder="Enter Customer Name">
				</div>
				<div>
					<label>ID Number:</label> <input class="lists" type="number"
						id="customer_id" placeholder="Enter ID Number" required>
				</div>
				<div>
					<label>Phone Number:</label> <input class="lists" type="tel"
						id="customer_phone" placeholder="Enter Mobile Number">
				</div>


			</div>

			<div id="top">
				<div>
					<label>Product Name:</label> <input class="lists" id="product_name"
						type="text" placeholder="Product Name">
				</div>

				<div>
					<label>Product ID</label> <input class="lists" id="product_id"
						type="number" placeholder="Enter Product ID" required>
				</div>

				<div>
					<label>Quantity:</label> <input class="lists" id="quantity"
						type="number" placeholder="Choose Number" required>
				</div>

				<div>
					<label>MRP:</label> <input class="lists" id="mrp" type="number"
						placeholder="Choose Number">
				</div>

				<div>
					<label>Price:</label> <input class="lists" id="price" type="number"
						placeholder="Enter price">
				</div>
				<div>
					<label>Tax(Rs):</label> <input class="lists" id="tax" type="number"
						placeholder="Enter Tax">
				</div>
				<div>
					<label>Discount(Rs):</label> <input class="lists" id="discount"
						type="number" placeholder="Enter Discount">
				</div>

				<div>
					<a><button>ADD</button></a>
				</div>

			</div>
		</div>
	</form>
	<main>
		<table id="mainTable">
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Product ID</th>
					<th>Quantity</th>
					<th>MRP</th>
					<th>Price</th>
					<th>Tax (Rs)</th>
					<th>Discount (Rs)</th>
				</tr>
			</thead>
			<tbody>
				<!-- Table rows will be added dynamically here -->
			</tbody>
		</table>
	</main>
	<section>
		<form id="payment" action="create" method="post">
			<div id="left">
				<div id="pay">
					<label>Amount :</label> <input type="text" id="total_amount">
				</div>
				<div id="pay">
					<label>Total Quantity:</label> <input type="number"
						id="total_quantity">
				</div>
				<div id="pay">
					<label>Total Price :</label> <input type="text" id="total_price"
						readonly>
				</div>
			</div>
			<div>
				<div id="pay">
					<label>Total MRP :</label> <input type="text" id="total_mrp"
						readonly>
				</div>
				<div id="pay">
					<label>Total Tax :</label> <input type="text" id="total_tax"
						readonly>
				</div>
				<div id="pay">
					<label>Total Discount :</label> <input type="text"
						id="total_discount" readonly>
				</div>
			</div>
			<div id="big">
				<h2>Sub Total :</h2>
				<input type="text" id="sub_total" readonly>
				<h1>Total :</h1>
				<input type="text" id="total" readonly>
			</div>
			<input type="hidden" name="customer_id" id="customer_id_input">
			<input type="hidden" name="product_ids_and_quantities"
				id="product_ids_and_quantities_input">



			<div id="buttonDiv">
				<button class="btn" id="btn" type="submit">Save Bill</button>
				<!-- <button class="btn" id="btn" type="submit">Print Bill</button> -->
			</div>
		</form>
	</section>









	<script>
		const addButton = document.querySelector("#cus_form button");
		const mainTable = document.querySelector("#mainTable tbody");
		const productNameInput = document.querySelector("#product_name");
		const productIDInput = document.querySelector("#product_id");
		const quantityInput = document.querySelector("#quantity");
		const mrpInput = document.querySelector("#mrp");
		const priceInput = document.querySelector("#price");
		const taxInput = document.querySelector("#tax");
		const discountInput = document.querySelector("#discount");
		const idInput = document.querySelector("#customer_id");

		addButton
				.addEventListener(
						"click",
						function() {

							const productName = productNameInput.value
									|| "Name goes Here";
							const productID = productIDInput.value;
							const quantity = quantityInput.value;
							const mrp = mrpInput.value || 0;
							const price = priceInput.value || 0;
							const tax = taxInput.value || 0;
							const discount = discountInput.value || 0;

							if (productID != 0) {
								// Create a new table row and add it to the table
								const newRow = mainTable.insertRow(-1);
								const cell1 = newRow.insertCell(0);
								const cell2 = newRow.insertCell(1);
								const cell3 = newRow.insertCell(2);
								const cell4 = newRow.insertCell(3);
								const cell5 = newRow.insertCell(4);
								const cell6 = newRow.insertCell(5);
								const cell7 = newRow.insertCell(6);

								cell1.innerHTML = productName;
								cell2.innerHTML = productID;
								cell3.innerHTML = quantity;
								cell4.innerHTML = mrp;
								cell5.innerHTML = price;
								cell6.innerHTML = tax;
								cell7.innerHTML = discount;

								// Clear input fields after adding to the table
								productNameInput.value = "";
								productIDInput.value = "";
								quantityInput.value = "";
								mrpInput.value = "";
								priceInput.value = "";
								taxInput.value = "";
								discountInput.value = "";

								calculateTotals();
							} else {
								alert("Product ID Cannot be Empty");

							}
							const productDataList = [];

							const rows = mainTable.rows;
							for (let i = 0; i < rows.length; i++) {
								const productID = rows[i].cells[1].innerHTML;
								const quantity = rows[i].cells[2].innerHTML;

								// Create an object for each row and push it into the productDataList
								const productData = {
									productId : productID,
									quantity : quantity
								};

								productDataList.push(productData);
							}

							// Update hidden input field with the data
							document
									.getElementById("product_ids_and_quantities_input").value = JSON
									.stringify(productDataList);
							// Update customer ID
							document.getElementById("customer_id_input").value = idInput.value;

							calculateTotals();

						});

		function calculateTotals() {
			// Calculate totals based on the table data
			const rows = mainTable.rows;
			let totalQuantity = 0;
			let totalMRP = 0;
			let totalPrice = 0;
			let totalTax = 0;
			let totalDiscount = 0;

			for (let i = 0; i < rows.length; i++) {
				const row = rows[i];
				const quantity = parseInt(row.cells[2].innerHTML);
				const mrp = parseFloat(row.cells[3].innerHTML);
				const price = parseFloat(row.cells[4].innerHTML);
				const tax = parseFloat(row.cells[5].innerHTML);
				const discount = parseFloat(row.cells[6].innerHTML);

				totalQuantity += quantity;
				totalMRP += quantity * mrp;
				totalPrice += quantity * price;
				totalTax += tax;
				totalDiscount += discount;
			}

			// Update the total fields
			document.getElementById("total_quantity").value = totalQuantity;
			document.getElementById("total_mrp").value = totalMRP.toFixed(2);
			document.getElementById("total_price").value = totalPrice
					.toFixed(2);
			document.getElementById("total_tax").value = totalTax.toFixed(2);
			document.getElementById("total_discount").value = totalDiscount
					.toFixed(2);

			const subTotal = totalPrice + totalTax - totalDiscount;
			document.getElementById("sub_total").value = subTotal.toFixed(2);
			document.getElementById("total").value = subTotal.toFixed(2);
			document.getElementById("total_amount").value = subTotal.toFixed(2);
		}
	</script>
</body>
</html>
