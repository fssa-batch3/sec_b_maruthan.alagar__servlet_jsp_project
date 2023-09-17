const form = document.getElementById("addstock_form");
const stock_name = document.getElementById("stock_name");
const quantity = document.getElementById("quantity");
const total_quantity = document.getElementById("total_quantity");
const price = document.getElementById("price");
const tax = document.getElementById("tax");
const type = document.getElementById("type");
const discount = document.getElementById("discount");
const invoice_gst = document.getElementById("invoice_gst");
const agency_details = document.getElementById("agency_details");
const brand_name = document.getElementById("brand_name");
const date = document.getElementById("date");

const uuid = uuidv4();

const stockDetails = JSON.parse(localStorage.getItem("stockDetails")) || [];


document.getElementById("tax").addEventListener("input", checkTax);
document.getElementById("discount").addEventListener("input", checkDis);
document.getElementById("quantity").addEventListener("input", checkQuan);
document.getElementById("total_quantity").addEventListener("input", checkTotal);
document.getElementById("price").addEventListener("input", checkPrice);
// document.getElementById("invoice_gst").addEventListener("input", checkId);


form.addEventListener("submit", function (event) {
  event.preventDefault();

  if (stockDetails.some((record) => record.stock_name === stock_name.value && record.date === date.value && record.brand_name === brand_name.value)) {
    alert("Stock is already exists! ");
  } else {
    const newStock = {
      stock_name: stock_name.value,
      quantity: quantity.value,
      total_quantity: total_quantity.value,
      price: price.value,
      tax: tax.value,
      discount: discount.value,
      invoice_gst: invoice_gst.value,
      agency_details: agency_details.value,
      brand_name: brand_name.value,
      type: type.value,
      date: date.value,
      unique: uuid,
    };

    stockDetails.push(newStock);
    localStorage.setItem("stockDetails", JSON.stringify(stockDetails));
    localStorage.setItem("stock_name", stock_name.value);
    alert("Stock is Sucessfully Created");
    window.location.href = "./stock.html";
    
  }
});

function checkDis() {
  if (discount.value.length > 2) {
    alert("Discount should be between 0 % - 99 %");
    document.getElementById("discount").value = "";
  }
  else if (discount.value < 0){
    alert("Value should not be negative");
    document.getElementById("discount").value = "";
  }
}

function checkTax() {
  if (tax.value.length > 2) {
    alert("Tax should be between 0 % - 99 %");
    document.getElementById("tax").value = "";
  }
  else if (tax.value < 0){
    alert("Value should not be negative");
    document.getElementById("tax").value = "";
  }
}

function checkQuan() {
  if (quantity.value.length > 3) {
    alert("Quantity should be between 0 - 999");
    document.getElementById("quantity").value = "";
  }
  else if (quantity.value < 0){
    alert("Value should not be negative");
    document.getElementById("quantity").value = "";
  }
}

function checkPrice() {
  if (price.value > 25000) {
    alert("Price should be between 0 - 25000");
    document.getElementById("price").value = "";
  }
  else if (price.value < 0){
    alert("Value should not be negative");
    document.getElementById("price").value = "";
  }
}

function checkTotal() {
  if (total_quantity.value > 2500) {
    alert("Total Quantity should be between 0 - 2500");
    document.getElementById("total_quantity").value ="";
  }
  else if (total_quantity.value < 0){
    alert("Value should not be negative");
    document.getElementById("total_quantity").value = "";
  }
}
// function checkId() {
//   if (invoice_gst.value.length !== 15) {
//     alert("Invoice GSTN Number should be 15 characters long");
//     document.getElementById("invoice_gst").value = "";
//   }
//  else if (invoice_gst.value.length !== 15 ) {
//     alert("Agency ID should be 4 to 9 characters long");
//     document.getElementById("invoice_gst").value = "";
//   }

// }


