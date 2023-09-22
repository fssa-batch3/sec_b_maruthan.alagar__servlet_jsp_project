<%@page import="in.fssa.mambilling.model.Shop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/viewprofile.css">
<meta charset="ISO-8859-1">
<title>Shop Profile</title>
</head>
<body>
<%
	String message = (String) request.getAttribute("errorMessage");
	%>

	<%
	if (message != null) {
	%>

	<script> alert("<%=message%>");</script>
	<%
	}
	%>
	<%
	Shop shop = (Shop) request.getAttribute("shopDetail");
	%>

	<header>
		<div id="nav_div">
			<a href="<%=request.getContextPath()%>/getrecentbills"> <img
				class="logo" src="https://iili.io/J9AdFF1.png" alt="logo"
				width="110px">
			</a> <a href="<%=request.getContextPath()%>/login.jsp"><button
					class="button_2_1" type="button">Log Out</button></a>

		</div>

	</header>
	<main>



		<h2>Profile</h2>
		<div class="one">
			<form id="profile_form" action="update" method="POST">

				<div class="part">

					<div class="content">
						<label class="forms">Shop Name</label> <input class="lists"
							id="shop_name" name="shop_name" value="<%=shop.getShopName()%>"
							type="text" pattern="^[a-zA-Z\s]+$" required >

					</div>

					<div class="content">
						<label class="forms">License Number</label> <input class="lists"
							id="license_number" value="<%=shop.getLicenseNumber()%>"
							name="license_number" type="text" pattern="[A-Z0-9]+"
							maxlength="14"
							title="Don't Use space and any Special Characters.Use A_Z and 1-9 and Must Be 14 Characters"
							required readonly>
					</div>
					<div class="content">
						<label class="forms">Phone Number</label> <input class="lists"
							id="phone_number" value="<%=shop.getPhoneNumber()%>" type="tel"
							name="phone_number" pattern="^[6789]\d{9,9}$" maxlength="10"
							title="Use Numbers begin with 6,7,8,9 and must Enter 10 Characters"
							required>
					</div>

					<div class="content">
						<label class="forms">E-Mail Address</label> <input class="lists"
							id="user_email" value="<%=shop.getEmail()%>" type="email"
							name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
							title="Please enter correct Email" readonly>
					</div>

				</div>
				<div class="part1">
					<div class="content">
						<label class="forms">GSTIN Number</label> <input class="lists"
							id="gstn_number" value="<%=shop.getGSTNNumber()%>" type="text"
							name="gstn_number" placeholder="Enter GSTN Number" maxlength="15"
							pattern="\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}"
							title="Don't Use space and any Special Characters.Use A-Z and 1-9 and Must Be 15 Characters"
							required readonly>

					</div>
					<div class="content">
						<label class="forms">Address</label> <input class="lists"
							id="address" value="<%=shop.getAddress()%>" type="text"
							name="address" placeholder="Enter Shop Address" maxlength="250"
							required>

					</div>
					<div class="content">
						<label class="forms">Owner name</label> <input class="lists"
							id="owner_name" value="<%=shop.getOwnerName()%>" type="text"
							name="owner_name" placeholder="Enter Owner name" required>

					</div>
					<div class="content">
						<label class="forms">Print Name</label> <input class="lists"
							id="nameforprint" value="<%=shop.getPrintName()%>" type="text"
							name="print_name" placeholder="Enter Print Name" required>

					</div>

				</div>
				<div class="content1">
					<a href="<%=request.getContextPath()%>/getrecentbills"><button
							class="button_1" type="button">
							<span>&#x1F870;</span> Back
						</button></a>

					<button class="button" id="save" type="submit">
						Save<span>&#x1F872;</span>
					</button>

				</div>

			</form>
		</div>

	</main>
	<script src="<%=request.getContextPath()%>/assets/js/profile/viewprofile.js"></script>
</body>

	
</html>