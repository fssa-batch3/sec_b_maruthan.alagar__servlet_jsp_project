<%@page import="in.fssa.mambilling.dto.ProductDTO"%>
<%@page import="in.fssa.mambilling.model.Product"%>
<%@page import="in.fssa.mambilling.model.BillItems"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.mambilling.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/billing/newbill.css">
<meta charset="ISO-8859-1">
<title>Add New Bill</title>

</head>
<body>


	<h1 id="h1">Add New Bill</h1>

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
				<div id="button_div">
				<div>
					<label>Phone Number:</label> <input class="lists" type="tel"
						id="customer_phone" placeholder="Enter Mobile Number"></div>
						<a href="<%=request.getContextPath() %>/users/new?redirectedTo=bill"><button type="button" id="user_add_button">+</button></a>
				</div>
				
					
				
			</div>

			<div id="top">
				<div>
					<label>Product Name:</label> <select class="lists"
						id="product_name">
						<option value="">Select Product</option>
						<%
						// Sample list of product names
						List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("products");

						// Loop through the productList and create an option for each product
						for (ProductDTO product : productList) {
						%>
						<option value="<%=product.getId()%>"><%=product.getProductName()%></option>
						<%
						}
						%>
					</select>
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
					<label>Tax(%):</label> <input class="lists" id="tax" type="number"
						placeholder="Enter Tax">
				</div>
				<div>
					<label>Discount(%):</label> <input class="lists" id="discount"
						type="number" placeholder="Enter Discount">
				</div>

				<div>
					<button id="add_button">+</button>
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
					<th>Tax (%)</th>
					<th>Discount (%)</th>
					<th>Total Price</th>
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

	
	async function getUserDetail(){ 
		  const phoneNumber = document.getElementById("customer_phone").value;
		  
		  
		  
		  
		  if(phoneNumber!="-"){
		  if(phoneNumber.length>10 | phoneNumber.length<10){
			  alert("Please Enter Valid Phone number");
			  document.getElementById("customer_phone").value = "";
			  return;
		  }
		  }
		  
		  
		  
		  const requestData = {
		    phoneNumber: phoneNumber
		  };

		  const url = "<%=request.getContextPath() %>/getuser";
		  const options = {
		    method: "POST",
		    headers: {
		      "Content-Type": "application/json" 
		    },
		    body: JSON.stringify(requestData) 
		  };

		  // Send the POST request using the fetch API and return the promise
		  const response = await fetch(url, options).catch( (err)=> console.log(err));		    
		  // console.log(userDetails);
		  const userDetail = ( await response.json() ).data;
		  
		  console.log(userDetail);
		  
		  if(userDetail!=undefined){
		  
	      document.getElementById("customer_name").value = userDetail.name;
	      document.getElementById("customer_id").value = userDetail.id;
		  }else{
			  alert("Customer Details not found. Try with Different Mobile Number");
		  }
	}
	
	
	document.getElementById("customer_phone").addEventListener("change", getUserDetail);
	
	
	
	async function getProductDetail(){
		
		var product_id = document.getElementById("product_name").value;
		
		if (product_id === null || product_id === "") {
			  product_id = document.getElementById("product_id").value;
			}
		  const requestData = {
				  product_id: product_id
		  };

		  const url = "<%= request.getContextPath()%>/getproduct";
		  const options = {
		    method: "POST",
		    headers: {
		      "Content-Type": "application/json" 
		    },
		    body: JSON.stringify(requestData) 
		  };

		  // Send the POST request using the fetch API and return the promise
		  const response = await fetch(url, options).catch( (err)=> console.log(err));		    
		  // console.log(userDetails);
		  const productDetail = ( await response.json() ).data;
		  
		  console.log(productDetail);
		  document.getElementById("product_name").value =
			  productDetail.id;
		      document.getElementById("product_id").value =
		    	  productDetail.id;
		      document.getElementById("tax").value =
		    	  productDetail.tax;
		      document.getElementById("mrp").value =
		    	  productDetail.mrp;
		      document.getElementById("discount").value =
		    	  productDetail.discount;
	}
	
	
	document.getElementById("product_name").addEventListener("change", getProductDetail);
	document.getElementById("product_id").addEventListener("change", getProductDetail);
	
	
		const addButton = document.querySelector("#add_button");
		const mainTable = document.querySelector("#mainTable tbody");
		const productNameInput = document.querySelector("#product_name");
		const productIDInput = document.querySelector("#product_id");
		const quantityInput = document.querySelector("#quantity");
		const mrpInput = document.querySelector("#mrp");
		const taxInput = document.querySelector("#tax");
		const discountInput = document.querySelector("#discount");
		const idInput = document.querySelector("#customer_id");

		addButton
				.addEventListener(
						"click",
						function() {
							
							
							
							//const selectElement = document.getElementById("mySelect");
				            const selectedIndex = productNameInput.selectedIndex;
				            const selectedOption = productNameInput.options[selectedIndex];
				            const selectedValue = selectedOption.value;
				            const selectedText = selectedOption.innerText;

							const productName = selectedText
									|| "Name goes Here";
							const productID = productIDInput.value|| 0;
							const quantity = quantityInput.value|| 0;
							const mrp = parseFloat(mrpInput.value) || 0; 
							const tax = parseFloat(taxInput.value) || 0;
							const discount = parseFloat(discountInput.value) || 0;
							const cus_id = idInput.value||0;

				
							const totalPrice = (mrp + (mrp * (tax / 100))) * quantity; 
							const price = parseInt(totalPrice - (totalPrice * (discount / 100)));
							
							const tableRows = mainTable.rows;
							let exist = -1;
							
							if(tableRows!=0){
							
							for (let i = 0; i < tableRows.length; i++) {
								const row = tableRows[i];
								
								const id = parseInt(row.cells[1].innerHTML);
								if(productID==id){
									exist=0;
									
									
								}
							}
							}
							
							
							if(cus_id<=0){
								alert("Customer ID Cannot be Empty");
								
							}else if (productID <= 0 ) {
								alert("Product ID Cannot be Empty");
							}else if(quantity<=0){
								
								alert("Product Quantity Cannot be Empty");
							}else if(exist==0){
								alert("Product Already exists in the Bill");
								
								productNameInput.value = "";
								productIDInput.value = "";
								quantityInput.value = "";
								mrpInput.value = "";
								taxInput.value = "";
								discountInput.value = "";
							} else {
								
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
								cell5.innerHTML = tax;
								cell6.innerHTML = discount;
								cell7.innerHTML = price;

								// Clear input fields after adding to the table
								productNameInput.value = "";
								productIDInput.value = "";
								quantityInput.value = "";
								mrpInput.value = "";
								taxInput.value = "";
								discountInput.value = "";

								calculateTotals();

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
				const discount = parseFloat(row.cells[4].innerHTML);
				const tax = parseFloat(row.cells[5].innerHTML);
				const price = parseFloat(row.cells[6].innerHTML);

				totalQuantity += quantity;
				totalMRP += quantity * mrp;
				totalPrice += price;
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

			const subTotal = totalPrice;
			document.getElementById("sub_total").value = subTotal.toFixed(2);
			document.getElementById("total").value = subTotal.toFixed(2);
			document.getElementById("total_amount").value = subTotal.toFixed(2);
		}
	</script>
			<div class="main">
		<a href="../bills" id="a_tag"><button id="btn_back" class="btn_back">&#x2190; Back to Bills</button></a>
	</div>
</body>
</html>
