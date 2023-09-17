var text = document.getElementById("inner_text");
var req = document.getElementById("req");
document.getElementById("customer_name").addEventListener("input", function(){
		req.style.display="block";
		text.innerText="Use Letters to Add Customer Name. Don't use Numbers or any special Characters";
		text.style.display="block";

});
document.getElementById("customer_phone").addEventListener("input", function(){
		req.style.display="block";
		text.innerText="Use Numbers begin with 6,7,8,9 and must Enter 10 Characters";
		text.style.display="block";

});
document.getElementById("customer_email").addEventListener("input", function(){
		req.style.display="block";
		text.innerText="An email address should be in the format example@domain.com";
		text.style.display="block";

});
document.getElementById("customer_address").addEventListener("input", function(){
		req.style.display="none";
		text.style.display="none";

});
document.getElementById("customer_phone").addEventListener("input", checkPhone);
function checkPhone() {
var phone=document.getElementById("customer_phone").value;
  if (phone.length > 10) {
    alert("Enter Valid Phone Number");
   var num =  phone.slice(0, 10);
    document.getElementById("customer_phone").value = num;
  }
 
}