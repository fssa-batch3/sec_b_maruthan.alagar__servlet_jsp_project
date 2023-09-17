const stockDetails = JSON.parse(localStorage.getItem("stockDetails"));
const stock_name = localStorage.getItem("stock_name");

const url = window.location.href;
const params = new URLSearchParams(window.location.search);
const myParamValue = params.get("stock_name");

function findDetail(e) {
  return e.stock_name === myParamValue;
}
const stock_records = stockDetails.find(findDetail);

// document.getElementById("edit_form").addEventListener("submit", function () {
//   update();
document.getElementById("edit_form").addEventListener("submit", function update(e) {
  e.preventDefault();
  //
  const stock_name = document.getElementById("stock_name").value;
  const quantity = document.getElementById("quantity").value;
  const total_quantity = document.getElementById("total_quantity").value;
  const price = document.getElementById("price").value;
  const type = document.getElementById("type").value;
  const tax = document.getElementById("tax").value;
  const discount = document.getElementById("discount").value;
  const invoice_gst = document.getElementById("invoice_gst").value;
  const agency_details = document.getElementById("agency_details").value;
  const date = document.getElementById("date").value;

  // paste the updated data to the correct object

  stock_records.stock_name = stock_name;
  stock_records.quantity = quantity;
  stock_records.total_quantity = total_quantity;
  stock_records.price = price;
  stock_records.type = type;
  stock_records.tax = tax;
  stock_records.discount = discount;
  stock_records.invoice_gst = invoice_gst;
  stock_records.agency_details = agency_details;
  stock_records.date = date;

  // again paste it to the
  localStorage.setItem("stockDetails", JSON.stringify(stockDetails));
  alert("Stock Details Successfully Updated");
  window.location.href = "./stock.html";
  

  
});



document.getElementById("backbutton").addEventListener("click", function () {
  backbutton();
});



document.getElementById("tax").addEventListener("input", checkTax);
document.getElementById("discount").addEventListener("input", checkDis);
document.getElementById("quantity").addEventListener("input", checkQuan);
document.getElementById("total_quantity").addEventListener("input", checkTotal);
document.getElementById("price").addEventListener("input", checkPrice);
// document.getElementById("invoice_gst").addEventListener("input", checkId);


function backbutton() {
  confirm("Are You Sure Discard Changes!");
  window.location.href = "./stock.html";
}
document.getElementById("stock_name").value = stock_records.stock_name;
document.getElementById("quantity").value = stock_records.quantity;
document.getElementById("total_quantity").value = stock_records.total_quantity;
document.getElementById("price").value = stock_records.price;
document.getElementById("type").value = stock_records.type;
document.getElementById("tax").value = stock_records.tax;
document.getElementById("discount").value = stock_records.discount;
document.getElementById("invoice_gst").value = stock_records.invoice_gst;
document.getElementById("agency_details").value = stock_records.agency_details;
document.getElementById("brand_name").value = stock_records.brand_name;
document.getElementById("date").value = stock_records.date;

function checkDis() {
  if (discount.value.length > 2) {
    alert("Discount should be between 0 % - 99 %");
    document.getElementById("discount").value = stock_records.discount;
  }
  else if (discount.value < 0){
    alert("Value should not be negative");
    document.getElementById("discount").value = stock_records.discount;
  }
}

function checkTax() {
  if (tax.value.length > 2) {
    alert("Tax should be between 0 % - 99 %");
    document.getElementById("tax").value = stock_records.tax;
  }
  else if (tax.value < 0){
    alert("Value should not be negative");
    document.getElementById("tax").value = stock_records.tax;
  }
}

function checkQuan() {
  if (quantity.value.length > 3) {
    alert("Quantity should be between 0 - 999");
    document.getElementById("quantity").value = stock_records.quantity;
  }
  else if (quantity.value < 0){
    alert("Value should not be negative");
    document.getElementById("quantity").value = stock_records.quantity;
  }
}

function checkPrice() {
  if (price.value > 25000) {
    alert("Price should be between 0 - 25000");
    document.getElementById("price").value = stock_records.price;
  }
  else if (price.value < 0){
    alert("Value should not be negative");
    document.getElementById("price").value = stock_records.price;
  }
}

function checkTotal() {
  if (total_quantity.value > 2500) {
    alert("Total Quantity should be between 0 - 2500");
    document.getElementById("total_quantity").value = stock_records.total_quantity;
  }
  else if (total_quantity.value < 0){
    alert("Value should not be negative");
    document.getElementById("total_quantity").value = stock_records.total_quantity;
  }
}
// function checkId() {
//   if (invoice_gst.value.length !==15) {
//     alert("Invoice GSTN Number should be 15 characters long");
//     document.getElementById("invoice_gst").value = stock_records.invoice_gst;
//   }
//  else if (invoice_gst.value.length !== 15) {
//     alert("Invoice GSTN Number should be 15 characters long");
//     document.getElementById("invoice_gst").value = stock_records.invoice_gst;
//   }

// }

