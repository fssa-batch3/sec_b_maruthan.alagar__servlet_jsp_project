

document.getElementById("tax").addEventListener("input", checkTax);
document.getElementById("discount").addEventListener("input", checkDis);
document.getElementById("quantity").addEventListener("input", checkQuan);
document.getElementById("mrp").addEventListener("input", checkMrp);

function checkDis() {
	if (discount.value > 99) {
		alert("Discount should be between 0 % - 99 %");
		location.reload();

	}
	else if (discount.value < 0) {
		alert("Discount should not be negative");
		location.reload();
	}
}

function checkTax() {
	if (tax.value > 99) {
		alert("Tax should be between 0 % - 99 %");
		location.reload();
	}
	else if (tax.value < 0) {
		alert("Tax should not be negative");
		location.reload();
	}
}

function checkQuan() {
	if (quantity.value > 26000) {
		alert("Quantity should be between 0 - 26000");
		location.reload();
	}
	else if (quantity.value < 0) {
		alert("Quantity should not be negative");
		location.reload();
	}
}

function checkMrp() {
	if (mrp.value > 50000) {
		alert("MRP should be between 1 - 50000");
		location.reload();
	}
	else if (mrp.value < 0) {
		alert("MRP should not be negative");
		location.reload();
	}
}
const productValue = document.getElementById("product_name").value;
const specialValue = document.getElementById("special_name").value;

document.getElementById("product_name").addEventListener("change", function() {
    const inputField = document.getElementById("product_name");
    const inputValue = inputField.value;
    const pattern = /^[a-zA-Z ]+$/;

    if (!pattern.test(inputValue)) {
        const errorContainer = document.getElementById("errorContainer");
        const req = document.getElementById("req");
        errorContainer.innerHTML = "Product Name does not match the required pattern.";
        req.innerHTML = "Use Letters to Add Product Name. Don't use Numbers or any special Characters.";
        inputField.classList.add("error");
        inputField.focus();
        inputField.value = productValue;
    } else {
        const errorContainer = document.getElementById("errorContainer");
        errorContainer.innerHTML = "";
        req.innerText = "";
        inputField.classList.remove("error");
    }
});

document.getElementById("special_name").addEventListener("change", function() {
    const inputField = document.getElementById("special_name");
    const inputValue = inputField.value;
    const pattern = /^[a-zA-Z ]+$/;

    if (!pattern.test(inputValue)) {
        const errorContainer = document.getElementById("errorContainer_1");
        const req = document.getElementById("req_1");
        errorContainer.innerHTML = "Special Name does not match the required pattern.";
        req.innerHTML = "Use Letters to Add Special Name. Don't use Numbers or any special Characters. If there is no Special Name, leave it Empty";
        inputField.classList.add("error");
        inputField.focus();
        inputField.value = specialValue;
    } else {
        const errorContainer = document.getElementById("errorContainer_1");
        errorContainer.innerHTML = "";
        req.innerText = "";
        inputField.classList.remove("error");
    }
});




