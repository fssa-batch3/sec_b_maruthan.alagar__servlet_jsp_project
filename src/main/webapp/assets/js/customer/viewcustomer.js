const customerDetails = JSON.parse(localStorage.getItem("customerDetails"));
const customer_email = document.getElementById("customer_email").value;

const params = new URLSearchParams(window.location.search);
const myParamValue = params.get("customer_id");

function findDetail(e) {
  return e.customer_id === myParamValue;
}
const customer_records = customerDetails.find(findDetail);

const sumbit = document.getElementById("edit_customer");
sumbit.addEventListener("submit", update);

const back = document.getElementById("backbutton");
back.addEventListener("click", backbutton);
document.getElementById("customer_id").addEventListener("input", checkId);

function update(event) {
  event.preventDefault();
  const customer_name = document.getElementById("customer_name").value;
  const customer_id = document.getElementById("customer_id").value;
  const customer_email = document.getElementById("customer_email").value;
  const customer_phone = document.getElementById("customer_phone").value;
  const customer_address = document.getElementById("customer_address").value;

  // paste the updated data to the correct object

  customer_records.customer_name = customer_name;
  customer_records.customer_id = customer_id;
  customer_records.customer_email = customer_email;
  customer_records.customer_phone = customer_phone;
  customer_records.customer_address = customer_address;

  // again paste it to the
  localStorage.setItem("customerDetails", JSON.stringify(customerDetails));
  alert("Customer Details Successfully Updated");
  window.location.href = "./customer.html";

}

function backbutton() {
  alert("Are You Sure Discard Changes!");
  window.location.href = "./customer.html";
}

document.getElementById("customer_name").value = customer_records.customer_name;
document.getElementById("customer_id").value = customer_records.customer_id;
document.getElementById("customer_email").value =
  customer_records.customer_email;
document.getElementById("customer_phone").value =
  customer_records.customer_phone;
document.getElementById("customer_address").value =
  customer_records.customer_address;

  function checkId() {
    if (customer_id.value.length > 9) {
      alert("Customer ID should be 9 characters long");
      document.getElementById("customer_id").value =customer_records.customer_id;
    }
  
  
  }