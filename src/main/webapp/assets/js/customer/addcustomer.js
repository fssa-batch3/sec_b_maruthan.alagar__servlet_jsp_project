var text = document.getElementById("inner_text");
var req = document.getElementById("req");



document.getElementById("customer_phone").addEventListener("change", checkPhone);

function checkPhone() {
    const inputField = document.getElementById("customer_phone");
    const errorContainer = document.getElementById("errorContainer_1");
    const req = document.getElementById("req_1");
    let phone = inputField.value;

    if (phone.length !== 10 || phone < 6000000001 || phone > 9999999999) {
        alert("Enter Valid Phone Number");
        let num = phone.slice(0, 10);
        req.innerHTML = "Use numbers beginning with 6, 7, 8, 9 and must enter 10 characters";
        inputField.classList.add("error");
        inputField.focus();
        document.getElementById("customer_phone").value = num;
    } else {
        // Clear error message and remove "error" class
        errorContainer.innerHTML = "";
        req.innerText = "";
        inputField.classList.remove("error");
    }
}



document.getElementById("customer_name").addEventListener("change", function() {

	const inputField = document.getElementById("customer_name");

	const inputValue = inputField.value;

	const pattern = /^[a-zA-Z ]+$/;

	if (!pattern.test(inputValue)) {
		const errorContainer = document.getElementById("errorContainer");
		const req = document.getElementById("req");
		errorContainer.innerHTML = "Customer Name not match the required pattern.";
		req.innerHTML = "Use Letters to Add Customer Name. Don't use Numbers or any special Characters.";
		inputField.classList.add("error");
		inputField.focus();
		inputField.value = "";

	} else {
		const errorContainer = document.getElementById("errorContainer");
		const req = document.getElementById("req");
		errorContainer.innerHTML = "";
		req.innerText = "";
		inputField.classList.remove("error");
	}
});
const emailField = document.getElementById("customer_email");
const email_value = emailField.value;

emailField.addEventListener("change", function () {
    const inputField = emailField;
    const inputValue = inputField.value;
    const pattern = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;

    if (inputValue !== "-" && inputValue !== "") {
        if (!pattern.test(inputValue)) {
            const errorContainer = document.getElementById("errorContainer_2");
            const req = document.getElementById("req_2");
            errorContainer.innerHTML = "Customer Email does not match the required pattern.";
            req.innerHTML = "Please Enter Correct Email Address. If there is no email, leave it empty";
            inputField.classList.add("error");
            inputField.focus();
            inputField.value = email_value;
        } else {
            const errorContainer = document.getElementById("errorContainer_2");
            errorContainer.innerHTML = ""; // Clear error message
            const req = document.getElementById("req_2");
            req.innerText = "";
            inputField.classList.remove("error"); // Remove "error" class
        }
    }
});

