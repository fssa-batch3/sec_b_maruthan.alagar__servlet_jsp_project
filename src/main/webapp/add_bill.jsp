<%@page import="java.util.Collections"%>
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
						id="customer_name" placeholder="Enter Customer Name" readonly>
				</div>
				<div>
					<label>Customer ID Number:</label> <input class="lists" type="number"
						id="customer_id" placeholder="Enter Customer ID " required readonly>
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
						Collections.reverse(productList);

						// Loop through the productList and create an option for each product
						for (ProductDTO product : productList) {
						%>
						<option value="<%=product.getId()%>"><%=product.getProductName()%> ( <%=product.getQuantity()%>  <%=product.getQuantityType()%> )</option>
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
						type="number" placeholder="Enter Quantity" required>
				</div>

				<div>
					<label>MRP(Rs):</label> <input class="lists" id="mrp" type="number"
						placeholder="Enter MRP" disabled>
				</div>

				<div>
					<label>Tax(%):</label> <input class="lists" id="tax" type="number"
						placeholder="Enter Tax" disabled>
				</div>
				<div>
					<label>Discount(%):</label> <input class="lists" id="discount"
						type="number" placeholder="Enter Discount" disabled>
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
					<th>Tax (Rs)</th>
					<th>Discount (Rs)</th>
					<th>Total MRP (Rs)</th>
					<th>Total Price (Rs)</th> 
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
					<label>Amount :</label> <input type="text" id="total_amount" disabled>
				</div>
				<div id="pay">
					<label>Total Quantity:</label> <input type="number"
						id="total_quantity" disabled>
				</div>
				<div id="pay">
					<label>Total Price (Rs):</label> <input type="text" id="total_price"
						readonly disabled>
				</div>
			</div>
			<div>
				<div id="pay">
					<label>Total MRP (Rs):</label> <input type="text" id="total_mrp"
						readonly disabled>
				</div>
				<div id="pay">
					<label>Total Tax (Rs):</label> <input type="text" id="total_tax"
						disabled >
				</div>
				<div id="pay">
					<label>Total Discount (Rs):</label> <input type="text"
						id="total_discount" disabled>
				</div>
			</div>
			<div id="big">
				<h2>Sub Total (Rs):</h2>
				<input type="text" id="sub_total" disabled>
				<h1>Total (Rs):</h1>
				<input type="text" id="total" disabled>
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
	
	document.getElementById("btn").addEventListener("click", function (event) {
		  const mainTable = document.querySelector("#mainTable tbody");
		  const rows = mainTable.rows;
		  if (rows.length < 1) {
		    event.preventDefault(); 
		    alert("Please Add At Least One Product to Bill");
		  }
		});

	
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
							const price = totalPrice - (totalPrice * (discount / 100)).toFixed(2);
							const total_mrp = mrp * quantity;
							const tax_rs = (total_mrp * (tax / 100)).toFixed(2); // Round to 2 decimal places
							const discount_rs = (total_mrp * (discount / 100)).toFixed(2);
							
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
							}else if(quantity==0){
								alert("Product Quantity Cannot be Empty");
								document.querySelector("#quantity").value="";
								return;
							}else if(quantity<1){
								
								alert("Product Quantity Cannot be Negative");
								document.querySelector("#quantity").value="";
								return;
							}else if(quantity>50){
								alert("Product Quantity Cannot be More than 50");
								document.querySelector("#quantity").value="";
								return;
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
								const cell8 = newRow.insertCell(7);

								cell1.innerHTML = productName;
								cell2.innerHTML = productID;
								cell3.innerHTML = quantity;
								cell4.innerHTML = mrp;
								cell5.innerHTML = tax_rs +" /-";
								cell6.innerHTML = discount_rs+" /-";
								cell7.innerHTML = total_mrp+" /-";
								cell8.innerHTML = price.toFixed(2)+" /-";

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
			let totalPrice = 0.0;
			let totalTax = 0;
			let totalDiscount = 0;

			for (let i = 0; i < rows.length; i++) {
				const row = rows[i];
				const quantity = parseInt(row.cells[2].innerHTML);
				const mrp = parseFloat(row.cells[3].innerHTML);
				const tax= parseFloat(row.cells[4].innerHTML);
				const discount = parseFloat(row.cells[5].innerHTML);
				const total_mrp = parseFloat(row.cells[6].innerHTML);
				//const price = parseFloat(row.cells[7].innerHTML);

				totalQuantity += quantity;
				totalMRP += quantity * mrp;
				totalTax += tax;
				totalDiscount += discount;
				totalPrice = (totalMRP-totalDiscount)+totalTax;
			}

			// Update the total fields
			document.getElementById("total_quantity").value = totalQuantity;
			document.getElementById("total_mrp").value = totalMRP.toFixed(2)+" /-";
			document.getElementById("total_price").value = totalPrice
					.toFixed(2)+" /-";
			document.getElementById("total_tax").value = totalTax.toFixed(2)+" /-";
			document.getElementById("total_discount").value = totalDiscount
					.toFixed(2)+" /-";

			const subTotal = totalPrice;
			document.getElementById("sub_total").value = subTotal.toFixed(2)+" /-";
			document.getElementById("total").value = parseInt(subTotal)+" /-";
			document.getElementById("total_amount").value = parseInt(subTotal)+" /-";
		}
		
		
		
		
		
		
	</script>
			<div class="main">
		<a href="../bills" id="a_tag"><button id="btn_back" class="btn_back">&#x2190; Back to Bills</button></a>
	</div>
</body>
</html>
