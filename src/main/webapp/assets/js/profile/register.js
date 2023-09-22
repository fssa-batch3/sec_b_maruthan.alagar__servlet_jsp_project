
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
	// This function will display the specified tab of the form...
	var x = document.getElementsByClassName("tab");
	x[n].style.display = "block";
	//... and fix the Previous/Next buttons:
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
	// Exit the function if any field in the current tab is invalid:
	if (n == 1 && !validateForm())
		return false;
	// Hide the current tab:
	x[currentTab].style.display = "none";
	// Increase or decrease the current tab by 1:
	currentTab = currentTab + n;
	// if you have reached the end of the form...
	if (currentTab >= x.length) {
		// ... the form gets submitted:
		document.getElementById("regForm").submit();
		return false;
	}
	// Otherwise, display the correct tab:
	showTab(currentTab);
}

function validateForm() {
	// This function deals with validation of the form fields
	var x, y, i, valid = true;
	x = document.getElementsByClassName("tab");
	y = x[currentTab].getElementsByTagName("input");
	// A loop that checks every input field in the current tab:
	for (i = 0; i < y.length; i++) {
		// If a field is empty...
		if (y[i].value == "") {
			// add an "invalid" class to the field:
			y[i].className += " invalid";
			// and set the current valid status to false
			valid = false;
		}
	}
	// If the valid status is true, mark the step as finished and valid:
	if (valid) {
		document.getElementsByClassName("step")[currentTab].className += " finish";
	}
	return valid; // return the valid status
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


document.getElementById("shop_name").addEventListener("change", function() {

	const shopNameInput = document.getElementById("shop_name");
	const pattern = /^[^\s][a-zA-Z]+(\s[a-zA-Z]+)?[^\s]$/;
	const enteredValue = shopNameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("Value doesn't match the pattern. Please use a valid shop name format.");
		shopNameInput.value = "";
	}





});

document.getElementById("gstn_number").addEventListener("change", function() {

	const shopNameInput = document.getElementById("gstn_number");
	const pattern = /\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}/;
	const enteredValue = shopNameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("GSTIN Number doesn't match the pattern. Please use a valid GSTIN Number.");
		shopNameInput.value = "";
	}





});


document.getElementById("phone_number").addEventListener("change", function() {

	const shopNameInput = document.getElementById("phone_number");
	const pattern = /^[6789]\d{9,9}$/;
	const enteredValue = shopNameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("Phone Number doesn't match the pattern. Please use a valid Phone Number.");
		shopNameInput.value = "";
	}





});


document.getElementById("email").addEventListener("change", function() {

	const shopNameInput = document.getElementById("email");
	const pattern = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
	const enteredValue = shopNameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("Email doesn't match the pattern. Please use a valid Email.");
		shopNameInput.value = "";
	}





});


document.getElementById("licence_number").addEventListener("change", function() {
	const shopNameInput = document.getElementById("licence_number");
	if (shopNameInput.value.length < 14 || shopNameInput.value.length > 14) {
		alert("License Number should be 14 Characters Long");
	}

	const pattern = /[0-9]+/;
	const enteredValue = shopNameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("Value doesn't match the pattern. Please use a valid License Number format.");
		shopNameInput.value = "";
	}

});










const user_email = document.getElementById("user_email");
const new_pw = document.getElementById("first_password");
const pw = document.getElementById("password");


document.getElementById("password").addEventListener("change", function() {


	if (pw.value !== new_pw.value) {
		alert("Passwords do not match");
		document.getElementById("password").value = "";
		document.getElementById("first_password").value = "";
		return;
	}

	if (new_pw.value.length == 0) {
		alert("Please create new password");
		return;
	}
	if (pw.value.length == 0) {
		alert("Please re-enter password");
		return;
	}
	if (pw.value.length < 8) {
		alert("Password Length Max of 8 Characters");
		return;
	}
	if (!pw.value.match(/\d/)) {
		alert("Please add 1 number");
		return;
	}
	if (!pw.value.match(/[A-Z]/)) {
		alert("Please add 1 uppercase letter");
		return;
	}
	if (!pw.value.match(/[a-z]/)) {
		alert("Please add 1 lowercase letter");
		return;
	}
});
















