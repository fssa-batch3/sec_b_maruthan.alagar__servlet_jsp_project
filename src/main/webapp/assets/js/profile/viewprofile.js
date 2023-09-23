
document.querySelector(".button_2_1").addEventListener("click", function () {
 confirm("Are you sure to Logout?");
});


document.getElementById("license_number").addEventListener("click", giveNo);
document.getElementById("user_email").addEventListener("click", giveNo);
document.getElementById("gstn_number").addEventListener("click", giveNo);


function giveNo() {
  alert("This is not Editable or Can't be Change");
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
	const pattern = /^[A-Za-z0-9\\s.,-]+$/;
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