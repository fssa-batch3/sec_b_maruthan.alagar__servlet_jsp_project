<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="before_login_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/login/style.css">
<title>Register Shop</title>
</head>
<body>
<%
String message = (String) request.getAttribute("errorMessage");


%>

<%
if (message != null  ) {
%>

<script> alert("<%=message%>");</script>

<%
}
%>

	<form id="regForm" action="create" method="POST">
		<h1 id="1">Register Shop:</h1>
		<!-- One "tab" for each step in the form: -->
		<div class="tab">
			<div class="content">
				<label class="forms">Shop Name</label> <input class="lists"
					id="shop_name" name="shop_name"  value="Evergreen Supermarket" type="text" placeholder="Enter Shop Name"
					pattern="[^\s][a-zA-Z]+(\s[a-zA-Z]+)?[^\s]"
					title="Use a-z and A-Z Create Shop Name" required>
			</div>

			<div class="content">
				<label class="forms">License Number</label> <input class="lists"
					id="licence_number" name="license_number" type="text" placeholder="Enter License Number"
					pattern="[A-Z0-9]+" maxlength="14" value="237848940989878"
					title="Don't Use space and any Characters.Use 0-9 and Must Be 14 Characters"
					required>
			</div>
			<div class="content">
				<label class="forms">Phone Number</label> <input class="lists"
					id="phone_number" name="phone_number" type="tel" pattern="^[6789]\d{9,9}$"
					maxlength="10" value="6108419159"
					title="Use Numbers begin with 6,7,8,9 and must Enter 10 Characters"
					placeholder="Enter Mobile Number" required>
			</div>

			<div class="content">
				<label class="forms">E-Mail Address </label> <input class="lists"
					id="email" name="email" type="email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
					placeholder="Enter your E-Mail" value="evergreensupermarket@gmail.com" title="Please enter correct Email"
					required>
			</div>

		</div>
		<div class="tab">
			<h1 id="2">User Name Creation:</h1>
			<div class="content">
				<label class="forms"> Enter Your Email Address</label> <input
					class="lists" id="user_email" type="email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
					placeholder=" Enter Your Email" value="evergreensupermarket@gmail.com" required>

			</div>

			<div class="content">
				<label class="forms"> Create New Password</label> <input
					class="lists" id="first_password" name="password" type="password"
					placeholder="Abcd@123" value="Ever@1234"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~=?\|<>/]).{8,}"
					required>
			</div>
			<div class="content">
				<label class="forms">Re-Enter Password</label> <input class="lists"
					id="password" type="password" value="Ever@1234" placeholder="Abcd@123" required>

			</div>
			<div id="rulez" style="display: none;" class="rules">
				<p id="con">Constraints :-</p>
				<p id="con">* Password Length Max of 8 Characters</p>
				<p id="con">* Add 1 number & 1 uppercase letter</p>
				<p id="con">* Add 1 lowercase letter & Add 1 Symbol</p>
			</div>
		</div>
		<div class="tab">
			<h1 id="3">Shop Details :</h1>
			<div class="content">
				<label class="forms">GSTIN Number</label> <input class="lists"
					id="gstn_number" type="text" name="gstn_number" placeholder="Enter GSTN Number"
					maxlength="15" value="33CCCEV7409R1Z8"
					pattern="\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}"
					title="Don't Use space and any Special Characters.Use A-Z and 1-9 and Must Be 15 Characters"
					required>

			</div>
			<div class="content">
				<label class="forms">Address</label> <input class="lists"
					id="address" type="text" value="789 Nheru St, Pudukkottai" name="address" placeholder="Enter Shop Address"
					maxlength="250" required>

			</div>
			<div class="content">
				<label class="forms">Owner name</label> <input class="lists"
					id="file" type="text" value="Rahu Raman"name="owner_name" placeholder="Enter Owner name" required>

			</div>
			<div class="content">
				<label class="forms">Print Name</label> <input class="lists"
					id="nameforprint" type="text" value="Evergreen" name="print_name" placeholder="Enter Print Name"
					required>

			</div>
		</div>
		<div>
			<div>
				<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
				<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>

			</div>
		</div>
		<!-- Circles which indicates the steps of the form: -->
		<div id="span_div"
			style="text-align: center; margin-top: 40px; margin-left: 12%;">
			<span class="step"></span> <span class="step"></span> <span
				class="step"></span>
		</div>
	</form>

	<script
		src="<%=request.getContextPath()%>/assets/js/profile/register.js"></script>


</body>
</html>
