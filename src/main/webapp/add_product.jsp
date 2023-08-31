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
}

h2 {
	color: #333;
}

#additem_form {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.content {
	margin-bottom: 15px;
}

.label {
	display: flex;
	justify-content: space-between;
}

.forms {
	font-weight: bold;
}

.lists {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.quan {
	display: flex;
	justify-content: space-between;
}

.typeport {
	width: 40%;
}

.button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

.button span {
	font-size: 18px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<form id="additem_form" action="create" method="post">
		<h2>Add New Item</h2>
		<div class="parts">
			<div class="part1">
				<div class="content">
					<label class="forms">Product Name</label> <input class="lists"
						name="product_name" type="text" placeholder="Product Name"
						required>

				</div>

				<div class="content">
					<div class="label">
						<label class="forms">Quantity:</label> <label for="type" id="tp">Type:</label>
					</div>
					<div class="quan">
						<input class="lists" name="quantity" type="number"
							placeholder="Choose Number" required>
						<div class="typeport">

							<select class="lists" name="type" id="type" required>
								<option value="">--Select--</option>
								<option value="g">g</option>
								<option value="ml">ml</option>
								<option value="nos">Nos</option>
							</select>
						</div>
					</div>
				</div>



				<div class="content">
					<div class="label">
						<label class="forms" id="mrp_label">MRP:</label>

					</div>
					<div class="quan">
						<input class="lists" name="mrp" type="number"
							placeholder="Enter MRP" required>

					</div>
				</div>




			</div>
			<div class="part1">

				<div class="content">
					<div class="label">
						<label class="forms">Tax:</label> <label for="type"
							id="discount_label">Discount:</label>
					</div>
					<div class="quan">
						<input class="lists" name="tax" type="number"
							placeholder="Enter Tax" required>
						<div class="typeport">
							<input class="lists" name="discount" type="number"
								placeholder="Enter Discount" required>
						</div>
					</div>
				</div>

				<div class="content">
					<label class="forms">Special name(optional)</label> <input
						class="lists" name="special_name" type="text"
						placeholder="Enter special name">
				</div>
			</div>
		</div>
		<div class="content1">
			<button class="button" id="submit" type="submit">
				Save<span>&#8594;</span>
			</button>
		</div>

	</form>
</body>
</html>