

const customerDetails = JSON.parse(localStorage.getItem("customerDetails"));
const orders = JSON.parse(localStorage.getItem("orders"));
const order_bill = JSON.parse(localStorage.getItem("order_bill"));
const order_products = JSON.parse(localStorage.getItem("order_products"));
const shop_details = JSON.parse(localStorage.getItem("userRecords"));



const params = new URLSearchParams(window.location.search);
const myParamValue = params.get("order_id");

const param= new URLSearchParams(window.location.search);
const ParamValue = params.get("customer_id");




let customer_records = customerDetails.find(e => e.customer_id === ParamValue );
let bill_records = order_bill.find(e => e.order_id === myParamValue );

const product_records = order_products.filter((data) => data.order_id == myParamValue);


  
  function findOrder(e) {
    return e.order_id === myParamValue;
  }
  const orders_detail = orders.find(findOrder);

  
  const shop_email = localStorage.getItem("unique");
  
  
  function findemail(e) {
    return e.user_email === shop_email;
  }
  const shop_records = shop_details.find(findemail);



  let total_tax=0;
let total_discount=0;
for(let i = 0; i < product_records.length; i++){
  total_tax += product_records[i].quantity* product_records[i].tax
  total_discount+= product_records[i].quantity * product_records[i].discount
}

document.getElementById("customer_name").value = customer_records.customer_name;
document.getElementById("customer_id").value = customer_records.customer_id;
document.getElementById("amount").value = bill_records.total_amount +"/-";
document.getElementById("bill_date").value = bill_records.bill_date;
document.getElementById("shop_name").innerText = shop_records.shop_name
document.getElementById("phone_number").innerText = "Ph No: "+shop_records.phone_number
document.getElementById("Adress").innerText = shop_records.address
document.getElementById("cus_name").innerText =customer_records.customer_name
document.getElementById("bill_no").innerText =bill_records.bill_no
document.getElementById("date").innerText =bill_records.bill_date+" "+bill_records.bill_time
document.getElementById("payment").innerText =bill_records.payment_method
document.getElementById("total_amount").innerText =bill_records.total_amount+"/-"
document.getElementById("total_tax").innerText ="+"+" "+total_tax+"/-"
document.getElementById("gstn_no").innerText =shop_records.gstn_number
document.getElementById("trans_id").innerText =bill_records.transaction_id
document.getElementById("total_discount").innerText ="-"+" "+total_discount+"/-"








// main table
main_table = document.createElement("table");
main_table.setAttribute("id", "main_table");
main_table.setAttribute("class", "table");

// table row
table_row = document.createElement("tr");
table_row.setAttribute("class", "tb1");
// label_name.innerText = register_shop[i]["name"];
main_table.append(table_row);

// table coloumn_1
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Item Name ";
table_row.append(table_coloumn);
// table coloumn_2

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Quantity";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Price";
table_row.append(table_coloumn);


table_coloumn = document.createElement("th");
table_coloumn.innerText = "Tax";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Discount";
table_row.append(table_coloumn);
// table coloumn_4


table_coloumn = document.createElement("th");
table_coloumn.innerText = "Total Amount";
table_row.append(table_coloumn);

console.log(product_records)
















for (let i = 0; i < product_records.length; i++) {
    // table row
    table_row_1 = document.createElement("tr");
    table_row_1.setAttribute("class", "tb1");
    // label_name.innerText = register_shop[i]["name"];
    main_table.append(table_row_1);

    // table coloumn_1
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].product_name;
    table_row_1.append(table_coloumn_1);
    // table coloumn_3
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].quantity;
    table_row_1.append(table_coloumn_1);

    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText =product_records[i].price+"/-";
    table_row_1.append(table_coloumn_1);

    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText =product_records[i].tax+"/-";
    table_row_1.append(table_coloumn_1);

    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText =product_records[i].discount+"/-";
    table_row_1.append(table_coloumn_1);

    
    
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText =product_records[i].amount +"/-";
    table_row_1.append(table_coloumn_1);

//     // table coloumn_1
}
document.querySelector("section").prepend(main_table);







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

for(let i = 0; i <product_records.length; i++) {



const productRow1 = document.createElement('tr');

const product1Name = document.createElement('td');
product1Name.textContent = product_records[i].product_name;

const product1Price = document.createElement('td');
product1Price.textContent = product_records[i].price +"/-";

const product1Quantity = document.createElement('td');
product1Quantity.textContent = product_records[i].quantity;

const product1Total = document.createElement('td');
product1Total.textContent =(product_records[i].price*product_records[i].quantity)+"/-";
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


let moving = bill_records.order_id;


document.getElementById("button").addEventListener("click", move)
function move(event){
  event.preventDefault();
  const url = `./bill_design.html?order_id=${encodeURIComponent(
    moving
  )}`
  window.location.href = url

};





