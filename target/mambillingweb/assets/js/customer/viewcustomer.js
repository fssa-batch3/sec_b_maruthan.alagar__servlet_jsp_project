

document.getElementById("customer_phone").addEventListener("change", checkPhone);

function checkPhone() {
	const inputField = document.getElementById("customer_phone");
	const reqElement = document.getElementById("req_1");
	let phone = inputField.value;

	if (phone.length !== 10 || phone < 6000000001 || phone > 9999999999) {
		alert("Enter Valid Phone Number");
		let num = phone.slice(0, 10);
		document.getElementById("customer_phone").value = num;
		reqElement.innerText = "Use Numbers beginning with 6, 7, 8, 9 and must enter 10 Characters";
	} else {
		const errorContainer = document.getElementById("errorContainer");
		const reqElement = document.getElementById("req_1");
		reqElement.innerText = "";
		errorContainer.innerHTML = "";
		inputField.classList.remove("error"); // Remove "error" class
	}
}
const value = document.getElementById("customer_name").value;
document.getElementById("customer_name").addEventListener("change", function() {
	const inputField = document.getElementById("customer_name");
	const inputValue = inputField.value;
	const pattern = /^[a-zA-Z ]+$/;

	if (!pattern.test(inputValue)) {
		const errorContainer = document.getElementById("errorContainer");
		const reqElement = document.getElementById("req");
		errorContainer.innerHTML = "Customer Name does not match the required pattern.";
		reqElement.innerText = "Use Letters to Add Customer Name. Don't use Numbers or any special Characters.";
		inputField.classList.add("error");
		inputField.focus();
		inputField.value = value;
	} else {
		const errorContainer = document.getElementById("errorContainer");
		const reqElement = document.getElementById("req");
		errorContainer.innerHTML = "";
		reqElement.innerText = ""; // Clear error message
		inputField.classList.remove("error"); // Remove "error" class
	}
});

const emailField = document.getElementById("customer_email");
const email_value = emailField.value;
emailField.addEventListener("change", function() {
	const inputField = emailField;
	const inputValue = inputField.value;
	const pattern = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;

	if (inputValue !== "-" && inputValue !== "") {
		if (!pattern.test(inputValue)) {
			const errorContainer = document.getElementById("errorContainer_2");
			const reqElement = document.getElementById("req_2");
			errorContainer.innerHTML = "Customer Email does not match the required pattern.";
			reqElement.innerHTML = "Please Enter Correct Email Address. If there is no email, leave it empty";
			inputField.classList.add("error");
			inputField.focus();
			inputField.value = email_value;
		} else {
			const errorContainer = document.getElementById("errorContainer_2");
			const reqElement = document.getElementById("req_2");
			errorContainer.innerHTML = "";
			reqElement.innerText = ""; // Clear error message
			inputField.classList.remove("error"); // Remove "error" class
		}
	}
});
