

const customerDetails = JSON.parse(localStorage.getItem("customerDetails"));
const orders = JSON.parse(localStorage.getItem("orders"));
const order_bill = JSON.parse(localStorage.getItem("order_bill"));
const order_products = JSON.parse(localStorage.getItem("order_products"));


const params = new URLSearchParams(window.location.search);
const myParamValue = params.get("order_id");

const param = new URLSearchParams(window.location.search);
const ParamValue = params.get("customer_id");

// function findDetail(e) {
//   return e.order_id === myParamValue;
// }


// function findCustomer(e) {
//     return e.customer_id === ParamValue;
//   }


var customer_records = customerDetails.find(e => e.customer_id === ParamValue);
var bill_records = order_bill.find(e => e.order_id === myParamValue);
// var product_records = order_products.filter(e => e.order_id === myParamValue );
const product_records = order_products.filter((data) => data.order_id == myParamValue);


console.log(customer_records)

document.getElementById("customer_name").value = customer_records.customer_name
document.getElementById("customer_phone").value = customer_records.customer_phone









// main table
main_table = document.createElement("table");
main_table.setAttribute("class", "table");

// table row
table_row = document.createElement("tr");
table_row.setAttribute("class", "tb1");
// label_name.innerText = register_shop[i]["name"];
main_table.append(table_row);

// table coloumn_1
table_coloumn = document.createElement("th");
table_coloumn.innerText = "S.No ";
table_row.append(table_coloumn);
// table coloumn_2

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Item Name";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Quantity";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Price (Rs)";
table_row.append(table_coloumn);


table_coloumn = document.createElement("th");
table_coloumn.innerText = "Tax (Rs)";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.innerText = "Discount (Rs)";
table_row.append(table_coloumn);
// table coloumn_4


table_coloumn = document.createElement("th");
table_coloumn.innerText = "Total Amount (Rs)";
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
    table_coloumn_1.innerText = `${i + 1}.`;
    table_row_1.append(table_coloumn_1);
    // table coloumn_3
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].product_name;
    table_row_1.append(table_coloumn_1);

    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].quantity;
    table_row_1.append(table_coloumn_1);


    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].price + "/-";
    table_row_1.append(table_coloumn_1);

    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].tax + "/-";
    table_row_1.append(table_coloumn_1);

    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].discount + "/-";
    table_row_1.append(table_coloumn_1);



    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = product_records[i].amount + "/-";
    table_row_1.append(table_coloumn_1);








    //     // table coloumn_1
}
document.querySelector("main").append(main_table);
//table_row_final
// get the table element by ID
const table = document.getElementsByTagName("table");

// create the first row
const row1 = document.createElement("tr");

// create the first cell of the first row
const cell1_1 = document.createElement("td");
row1.appendChild(cell1_1); // append the cell to the row

// create the second cell of the first row
const cell1_2 = document.createElement("td");
row1.appendChild(cell1_2); // append the cell to the row

const cell1_3 = document.createElement("td");
row1.appendChild(cell1_3); // append the cell to the row

const cell1_4 = document.createElement("td");
row1.appendChild(cell1_4); // append the cell to the row

const cell1_5 = document.createElement("td");
row1.appendChild(cell1_5); // append the cell to the row

// create the third cell of the first row
const cell1_6 = document.createElement("td");
cell1_6.innerHTML = "<strong>Tax(Rs)</strong>";
row1.appendChild(cell1_6); // append the cell to the row

// create the fourth cell of the first row
const cell1_7 = document.createElement("td");
cell1_7.innerHTML = bill_records.total_tax + "/-";
cell1_7.style.fontWeight = "bold";
row1.appendChild(cell1_7); // append the cell to the row

// create the second row
const row2 = document.createElement("tr");

// create the first cell of the second row
const cell2_1 = document.createElement("td");
row2.appendChild(cell2_1); // append the cell to the row

// create the second cell of the second row
const cell2_2 = document.createElement("td");
row2.appendChild(cell2_2); // append the cell to the row

const cell2_3 = document.createElement("td");
row2.appendChild(cell2_3); // append the cell to the row

const cell2_4 = document.createElement("td");
row2.appendChild(cell2_4); // append the cell to the row


const cell2_5 = document.createElement("td");
row2.appendChild(cell2_5); // append the cell to the row

// create the third cell of the second row
const cell2_6 = document.createElement("td");
cell2_6.innerHTML = "<strong>Discount(Rs)</strong>";
row2.appendChild(cell2_6); // append the cell to the row

// create the fourth cell of the second row
const cell2_7 = document.createElement("td");
cell2_7.innerHTML = bill_records.total_discount + "/-";
cell2_7.style.fontWeight = "bold";
row2.appendChild(cell2_7); // append the cell to the row

// create the third row
const row3 = document.createElement("tr");

// create the first cell of the third row
const cell3_1 = document.createElement("td");
row3.appendChild(cell3_1); // append the cell to the row

// create the second cell of the third row
const cell3_2 = document.createElement("td");
row3.appendChild(cell3_2); // append the cell to the row

const cell3_3 = document.createElement("td");
row3.appendChild(cell3_3); // append the cell to the row

const cell3_4 = document.createElement("td");
row3.appendChild(cell3_4); // append the cell to the row

const cell3_5 = document.createElement("td");
row3.appendChild(cell3_5); // append the cell to the row


// create the third cell of the third row
const cell3_6 = document.createElement("td");
cell3_6.innerHTML = "<strong>Total</strong>";
row3.appendChild(cell3_6); // append the cell to the row

// create the fourth cell of the third row
const cell3_7 = document.createElement("td");
cell3_7.innerHTML = bill_records.total_amount + "/-";
cell3_7.style.fontWeight = "bold";
row3.appendChild(cell3_7); // append the cell to the row

// append the three rows to the table
main_table.appendChild(row1);
main_table.appendChild(row2);
main_table.appendChild(row3);




