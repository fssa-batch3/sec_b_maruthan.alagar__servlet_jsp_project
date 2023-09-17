const orders = JSON.parse(localStorage.getItem("orders"));
const order_bill = JSON.parse(localStorage.getItem("order_bill"));
const order_products = JSON.parse(localStorage.getItem("order_products"));
const shop_details = JSON.parse(localStorage.getItem("userRecords"));
const customer_records = JSON.parse(localStorage.getItem("customerDetails"));




const params = new URLSearchParams(window.location.search);
const myParamValue = params.get("order_id");

function findDetail(e) {
  return e.order_id === myParamValue;
}
const order_records = order_bill.find(findDetail);

function findOrder(e) {
  return e.order_id === myParamValue;
}
const orders_detail = orders.find(findOrder);

let cus_id = orders_detail.customer_id




function findCustomer(e) {
  return e.customer_id === cus_id;
}
const customer_detail = customer_records.find(findCustomer);



const product_records = order_products.filter((data) => data.order_id == myParamValue);

const shop_email = localStorage.getItem("unique");


function findemail(e) {
  return e.user_email === shop_email;
}
const shop_records = shop_details.find(findemail);


let total_tax = 0;
let total_discount = 0;
for (let i = 0; i < product_records.length; i++) {
  total_tax += product_records[i].quantity * product_records[i].tax
  total_discount += product_records[i].quantity * product_records[i].discount
}
//  product_records[i].quantity - product_records[i].tax



document.getElementById("shop_name").innerText = shop_records.shop_name
document.getElementById("phone_number").innerText = "Ph No: " + shop_records.phone_number
document.getElementById("Adress").innerText = shop_records.address
document.getElementById("cus_name").innerText = customer_detail.customer_name
document.getElementById("bill_no").innerText = order_records.bill_no
document.getElementById("date").innerText = order_records.bill_date + " " + order_records.bill_time
document.getElementById("payment").innerText = order_records.payment_method

document.getElementById("total_amount").innerText = order_records.total_amount + "/-"
document.getElementById("total_tax").innerText = "+" + " " + total_tax + "/-"
document.getElementById("gstn_no").innerText = shop_records.gstn_number
document.getElementById("trans_id").innerText = order_records.transaction_id
document.getElementById("total_discount").innerText = "-" + " " + total_discount + "/-"


// function openPrintWindow() {
  

//    closePrintWindow();
//     window.print();
    

   
  
  
// }




const productTable = document.createElement('table');
productTable.setAttribute('id', 'bill_table');

const tableHead = document.createElement('thead');

const tableHeadRow = document.createElement('tr');

const productNameHeading = document.createElement('th');
productNameHeading.textContent = 'Product Name';

const priceHeading = document.createElement('th');
priceHeading.textContent = 'Price';

const quantityHeading = document.createElement('th');
quantityHeading.textContent = 'Quantity';

const totalHeading = document.createElement('th');
totalHeading.textContent = 'Total';

const tableBody = document.createElement('tbody');

for (let i = 0; i < product_records.length; i++) {



  const productRow1 = document.createElement('tr');

  const product1Name = document.createElement('td');
  product1Name.textContent = product_records[i].product_name;

  const product1Price = document.createElement('td');
  product1Price.textContent = product_records[i].price + "/-";

  const product1Quantity = document.createElement('td');
  product1Quantity.textContent = product_records[i].quantity;

  const product1Total = document.createElement('td');
  product1Total.textContent = (product_records[i].price * product_records[i].quantity) + "/-";

  tableBody.appendChild(productRow1);
  productRow1.appendChild(product1Name);
  productRow1.appendChild(product1Price);
  productRow1.appendChild(product1Quantity);
  productRow1.appendChild(product1Total);


}


// Append the elements to their appropriate parent elements


const productDetailsDiv = document.getElementById("bill_table_div")

productDetailsDiv.appendChild(productTable);
productTable.appendChild(tableHead);
tableHead.appendChild(tableHeadRow);
tableHeadRow.appendChild(productNameHeading);
tableHeadRow.appendChild(priceHeading);
tableHeadRow.appendChild(quantityHeading);
tableHeadRow.appendChild(totalHeading);
productTable.appendChild(tableBody);




// openPrintWindow();
let divToPrint = document.getElementById("btn");
divToPrint.style.display = 'none';

window.print();

setTimeout(function() {
  divToPrint.style.display = 'block';
}, 1000); 

