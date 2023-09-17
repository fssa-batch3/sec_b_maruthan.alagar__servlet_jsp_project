const customerDetails = JSON.parse(localStorage.getItem("customerDetails"));
const orders = JSON.parse(localStorage.getItem("orders"));
const order_bill = JSON.parse(localStorage.getItem("order_bill"));





// main table
main_table = document.createElement("table");
main_table.setAttribute("id", "tableBody");
main_table.setAttribute("class", "table");

// table row
table_row = document.createElement("tr");
table_row.setAttribute("class", "tb1");
// label_name.innerText = register_shop[i]["name"];
main_table.append(table_row);

// table coloumn_1
table_coloumn = document.createElement("th");
table_coloumn.innerText = " Customer Name";
table_row.append(table_coloumn);


// table coloumn_3
table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "Customer ID";
table_row.append(table_coloumn);


table_coloumn = document.createElement("th");
table_coloumn.innerText = "Date";
table_row.append(table_coloumn);



table_coloumn = document.createElement("th");
table_coloumn.innerText = "Amount";
table_row.append(table_coloumn);


// table coloumn_5
table_coloumn = document.createElement("th");
table_coloumn.innerText = "View";
table_row.append(table_coloumn);



for (let i = 0; i < orders.length; i++) {
    
let cus_id = orders[i].customer_id



const customer_records = customerDetails.filter(data => data.customer_id === cus_id);
console.log(customer_records);

const cus_name =  customer_records[0].customer_name;


    // table row
    table_row_1 = document.createElement("tr");
    table_row_1.setAttribute("class", "tb1");
    // label_name.innerText = register_shop[i]["name"];
    main_table.append(table_row_1);

    // table coloumn_1
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = cus_name ;
    table_row_1.append(table_coloumn_1);
    // table coloumn_2
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = orders[i].customer_id;
    table_row_1.append(table_coloumn_1);
    // table coloumn_3
    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.setAttribute("class", "forres");
    table_coloumn_1.innerText = order_bill[i].bill_date;
    table_row_1.append(table_coloumn_1);


    table_coloumn_1 = document.createElement("td");
    table_coloumn_1.innerText = order_bill[i].total_amount + "/-";
    table_row_1.append(table_coloumn_1);

    // table coloumn_4
    table_coloumn_1_arrow = document.createElement("td");

    table_row_1.append(table_coloumn_1_arrow);

    const nameValue = orders[i].order_id;
    // Set the value as a parameter in a URL
    //    const url = "http://127.0.0.1:5500/pages/stock/viewstock.html?stock_name=" + encodeURIComponent(nameValue);
    const url = `./purchasedetails.html?order_id=${nameValue}&customer_id=${cus_id}`

    // anchor
    a_tag = document.createElement("a");
    a_tag.setAttribute("class", "arrow");
    a_tag.innerText = "→";
    a_tag.setAttribute("href", url);
    table_coloumn_1_arrow.append(a_tag);
}
document.querySelector("main").append(main_table);

// checking

// Get the search input element
var searchInput = document.getElementById('searchInput');

// Get the table body element
var tableBody = document.getElementById('tableBody');

// Add event listener to the search input
searchInput.addEventListener('keyup', function() {
  var searchValue = searchInput.value.toLowerCase();
  var rows = tableBody.getElementsByTagName('tr');
  
  // Loop through all rows of the table
  for (var i = 0; i < rows.length; i++) {
    var cells = rows[i].getElementsByTagName('td');
    var matchFound = false;

    // Loop through all cells of the current row
    for (var j = 0; j < cells.length; j++) {
      var cellText = cells[j].textContent.toLowerCase();

      // Check if the cell text starts with the search value
      if (cellText.startsWith(searchValue)) {
        matchFound = true;
        break;
      }
    }

    // Show/hide the row based on the match
    if (matchFound) {
      rows[i].style.display = '';
    } else {
      rows[i].style.display = 'none';
    }
  }
});

document.getElementById("searchButton").addEventListener("click", function() { location.reload(); });