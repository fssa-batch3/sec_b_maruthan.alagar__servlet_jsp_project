const order_bill = JSON.parse(localStorage.getItem("order_bill"));

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
table_coloumn.innerText = " Bill Number";
table_row.append(table_coloumn);

// table coloumn_2
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Date";
table_row.append(table_coloumn);

// table coloumn_3
table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "Quantity";
table_row.append(table_coloumn);

// table coloumn_3
table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "Amount";
table_row.append(table_coloumn);

// table coloumn_3
//     table_coloumn = document.createElement("th");
//      table_coloumn.setAttribute("class","forres");
//      table_coloumn.innerText = "Amount";
//    table_row.append(table_coloumn);

for (let i = 0; i < order_bill.length; i++) {
  // table row
  table_row_1 = document.createElement("tr");
  table_row_1.setAttribute("class", "tb1");
  // label_name.innerText = register_shop[i]["name"];
  main_table.append(table_row_1);

  // table coloumn_1
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.innerText = order_bill[i].bill_no;
  table_row_1.append(table_coloumn_1);
  //  //table coloumn_2
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.innerText = order_bill[i].bill_date;
  table_row_1.append(table_coloumn_1);
  // table coloumn_3
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.innerText = order_bill[i].total_quantity;
  table_row_1.append(table_coloumn_1);

  // table coloumn_3
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.innerText = `${order_bill[i].total_amount}/-`;
  table_row_1.append(table_coloumn_1);
}
document.querySelector("main").prepend(main_table);

// checking
