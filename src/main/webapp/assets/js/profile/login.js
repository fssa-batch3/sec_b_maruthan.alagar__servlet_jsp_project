document.getElementById("email").addEventListener("change", function() {

	const shopNameInput = document.getElementById("email");
	const pattern = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
	const enteredValue = shopNameInput.value;

	if (!pattern.test(enteredValue)) {
		alert("Email doesn't match the pattern. Please use a valid Email.");
		shopNameInput.value = "";
	}





});

const user_email = document.getElementById("email");
const pw = document.getElementById("password");


document.getElementById("password").addEventListener("change", function() {


	if (pw.value.length == 0) {
		alert("Please enter password");
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


/*document.getElementById("sub").addEventListener("click",function(){
let newWindow = window.open("getrecentbills", '_blank', "noopener,noreferrer");
window.close();
newWindow.focus();
});*/
