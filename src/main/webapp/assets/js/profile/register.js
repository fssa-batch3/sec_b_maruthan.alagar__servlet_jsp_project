
var currentTab = 0;
showTab(currentTab);

function showTab(n) {
	// This function will display the specified tab of the form...

	var x = document.getElementsByClassName("tab");
	x[n].style.display = "block";
	if (n == 0) {
		document.getElementById("prevBtn").style.display = "none";
	} else {
		document.getElementById("1").style.display = "none";
		document.getElementById("span_div").style.marginLeft = "33%";
		document.getElementById("prevBtn").style.display = "inline";
	}
	if (n == (x.length - 1)) {
		document.getElementById("1").style.display = "none";
		document.getElementById("2").style.display = "none";
		document.getElementById("nextBtn").innerHTML = "Submit";
	} else {
		document.getElementById("nextBtn").innerHTML = "Next";
	}
	fixStepIndicator(n)
}

function nextPrev(n) {
	// This function will figure out which tab to display

	var x = document.getElementsByClassName("tab");

	if (n == 1 && !validateForm())
		return false;

	x[currentTab].style.display = "none";

	currentTab = currentTab + n;

	if (currentTab >= x.length) {

		document.getElementById("regForm").submit();
		return false;
	}

	showTab(currentTab);
}

function validateForm() {
	// This function deals with validation of the form fields
	var x, y, i, valid = true;
	x = document.getElementsByClassName("tab");
	y = x[currentTab].getElementsByTagName("input");

	for (i = 0; i < y.length; i++) {

		if (y[i].value == "") {
			alert("Please Fill All The Required Fields.")
			y[i].className += " invalid";
			valid = false;
			break;
		}
	}
	// If the valid status is true, mark the step as finished and valid:
	if (valid) {
		document.getElementsByClassName("step")[currentTab].className += " finish";
	}
	return valid;
}

function fixStepIndicator(n) {
	var i, x = document.getElementsByClassName("step");
	for (i = 0; i < x.length; i++) {
		x[i].className = x[i].className.replace(" active", "");
	}
	x[n].className += " active";
}

document.getElementById("first_password").addEventListener("input", showRulez);

function showRulez() {
	document.getElementById("rulez").removeAttribute("style");
}



// Shop Name
document.getElementById("shop_name").addEventListener("change", function() {

	const nameInput = document.getElementById("shop_name");
	const pattern = /^[a-zA-Z\s]+$/;
	const enteredValue = nameInput.value;


	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Shop Name cannot be Empty.");
		document.getElementById("shop_name").value = "";
		return;
	}

	if (!pattern.test(enteredValue)) {
		alert("Shop Name doesn't match the pattern. Please use a valid shop name.");
		nameInput.value = "";
	}

});

// License Number
document.getElementById("license_number").addEventListener("change", function() {
	const nameInput = document.getElementById("license_number");
	if (nameInput.value.length < 14 || nameInput.value.length > 14) {
		alert("License Number should be 14 Characters Long");
		nameInput.value = "";
		return;
	}

	const pattern = /[0-9]+/;
	const enteredValue = nameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("License Number doesn't match the pattern. Please use a valid License Number format.");
		nameInput.value = "";
	}

});

// Email
document.getElementById("email").addEventListener("change", function() {

	const nameInput = document.getElementById("email");
	const pattern = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
	const enteredValue = nameInput.value;
	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Email cannot be Empty.");
		document.getElementById("email").value = "";
		return;
	}
	if (!pattern.test(enteredValue)) {
		alert("Email doesn't match the pattern. Please use a valid Email.");
		nameInput.value = "";
	}

});
// Phone Number
document.getElementById("phone_number").addEventListener("change", function() {

	const nameInput = document.getElementById("phone_number");
	const pattern = /^[6789]\d{9,9}$/;
	const enteredValue = nameInput.value;
	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Phone Number cannot be Empty.");
		document.getElementById("phone_number").value = "";
		return;
	}
	if (!pattern.test(enteredValue)) {
		alert("Phone Number doesn't match the pattern. Please use a valid Phone Number.");
		nameInput.value = "";
	}

});
// Owner Name
document.getElementById("owner_name").addEventListener("change", function() {

	const NameInput = document.getElementById("owner_name");
	const pattern = /^[a-zA-Z\s]+$/;
	const enteredValue = NameInput.value;
	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Owner Name cannot be Empty.");
		document.getElementById("owner_name").value = "";
		return;
	}
	if (!pattern.test(enteredValue)) {
		alert("Owner Name doesn't match the pattern. Please use a valid owner name.");
		NameInput.value = "";
	}

});
// GSTIN Number
document.getElementById("gstn_number").addEventListener("change", function() {

	const nameInput = document.getElementById("gstn_number");
	const pattern = /\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}/;
	const enteredValue = nameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("GSTIN Number doesn't match the pattern. Please use a valid GSTIN Number.");
		nameInput.value = "";
	}

});
//Print Name
document.getElementById("nameforprint").addEventListener("change", function() {

	const NameInput = document.getElementById("nameforprint");
	const pattern = /^[a-zA-Z\s]+$/;
	const enteredValue = NameInput.value;
	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Print Name cannot be Empty.");
		document.getElementById("nameforprint").value = "";
		return;
	}

	if (!pattern.test(enteredValue)) {
		alert("Print Name doesn't match the pattern. Please use a valid nameforprint.");
		NameInput.value = "";
	}

});
//Address
document.getElementById("address").addEventListener("change", function() {

	const nameInput = document.getElementById("address");
	const pattern = /^[#.0-9a-zA-Z\s,-]+$/;
	const enteredValue = nameInput.value;
	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Address cannot be Empty.");
		document.getElementById("address").value = "";
		return;
	}
	if (!pattern.test(enteredValue)) {
		alert("Address doesn't match the pattern. Please use a valid Address.");
		nameInput.value = "";
	}


});

const user_email = document.getElementById("user_email");
const new_pw = document.getElementById("first_password");
const pw = document.getElementById("password");


document.getElementById("first_password").addEventListener("change", function() {

if(new_pw.value.trim()==""||new_pw.value.length == 0){
		alert("Please enter the password");
		document.getElementById("first_password").value = "";
		return;
		
	}
	
	if (!new_pw.value.match(/\d/)) {
		alert("Please add 1 number in the Password");
		return;
	}
	if (!new_pw.value.match(/[A-Z]/)) {
		alert("Please add 1 uppercase letter in the Password");
		return;
	}
	if (!new_pw.value.match(/[a-z]/)) {
		alert("Please add 1 lowercase letter in the Password");
		return;
	}
	if (new_pw.value.length != 8) {
		alert("Password Length Max of 8 Characters");
		document.getElementById("first_password").value="";
		return;
	}
});



document.getElementById("password").addEventListener("change", function() {

	

	if (pw.value !== new_pw.value) {
		alert("Password and Confirm Password do not match.");
		document.getElementById("password").value = "";
		document.getElementById("first_password").value = "";
		return;
	}

});
















