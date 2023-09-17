
var text = document.getElementById("inner_text");
var req = document.getElementById("req");
document.getElementById("product_name").addEventListener("input", function(){
		req.style.display="block";
		text.innerText="Use Letters to Add Product Name. Don't use Numbers or any special Characters";
		text.style.display="block";

});

document.getElementById("special_name").addEventListener("input", function(){
	req.style.display="block";
		text.innerText="Use Letters to Add Special Name. Don't use Numbers or any special Characters. Use - if there is no Special name";
		text.style.display="block";

});

document.getElementById("quantity").addEventListener("input", function(){
	req.style.display="block";
		text.innerText="Use only Numbers . Enter quantity between 1 to 26000 ";
		text.style.display="block";

});
document.getElementById("mrp").addEventListener("input", function(){
	req.style.display="block";
		text.innerText="Use only Numbers . Enter MRP between 1 to 50000 ";
		text.style.display="block";

});
document.getElementById("tax").addEventListener("input", function(){
	req.style.display="block";
		text.innerText="Use only Numbers . Enter Tax between 0 to 99 ";
		text.style.display="block";

});
document.getElementById("discount").addEventListener("input", function(){
	req.style.display="block";
		text.innerText="Use only Numbers . Enter Discount between 0 to 99 ";
		text.style.display="block";

});

document.getElementById("tax").addEventListener("input", checkTax);
document.getElementById("discount").addEventListener("input", checkDis);
document.getElementById("quantity").addEventListener("input", checkQuan);
document.getElementById("mrp").addEventListener("input", checkMrp);

function checkDis() {
  if (discount.value > 99) {
    alert("Discount should be between 0 % - 99 %");
    document.getElementById("discount").value = "";
  }
  else if (discount.value < 0){
    alert("Discount should not be negative");
    document.getElementById("discount").value = "";
  }
}

function checkTax() {
  if (tax.value > 99) {
    alert("Tax should be between 0 % - 99 %");
    document.getElementById("tax").value = "";
  }
  else if (tax.value < 0){
    alert("Tax should not be negative");
    document.getElementById("tax").value = "";
  }
}

function checkQuan() {
  if (quantity.value>26000) {
    alert("Quantity should be between 0 - 26000");
    document.getElementById("quantity").value = "";
  }
  else if (quantity.value < 0){
    alert("Quantity should not be negative");
    document.getElementById("quantity").value = "";
  }
}

function checkMrp() {
  if (mrp.value > 50000) {
    alert("MRP should be between 1 - 50000");
    document.getElementById("mrp").value = "";
  }
  else if (mrp.value < 0){
    alert("MRP should not be negative");
    document.getElementById("mrp").value = "";
  }
}



