document.getElementById("email").addEventListener("change", function() {

	const shopNameInput = document.getElementById("email");
	const pattern = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
	const enteredValue = shopNameInput.value;
	if (enteredValue.trim() == "" || enteredValue == null) {
		alert("Email cannot be Empty.");
		document.getElementById("email").value = "";
		return;
	}
	if (!pattern.test(enteredValue)) {
		alert("Email doesn't match the pattern. Please use a valid Email.");
		shopNameInput.value = "";
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
		document.getElementById("first_password").value = "";
		return;
	}
	if (!new_pw.value.match(/[A-Z]/)) {
		alert("Please add 1 uppercase letter in the Password");
		document.getElementById("first_password").value = "";
		return;
	}
	if (!new_pw.value.match(/[a-z]/)) {
		alert("Please add 1 lowercase letter in the Password");
		document.getElementById("first_password").value = "";
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



document.getElementById("first_password").addEventListener("input", showRulez);

function showRulez() {
	document.getElementById("rulez").removeAttribute("style");
}
