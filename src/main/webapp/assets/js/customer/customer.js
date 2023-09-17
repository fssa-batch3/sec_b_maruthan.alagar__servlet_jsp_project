
const addItemButton1 = document.getElementById('addcustomer_button1');
const addItemButton2 = document.getElementById('addcustomer_button2');
const searchInput = document.getElementById('searchInput');
const searchButton = document.getElementById('searchButton');

searchInput.style.display = 'none';


searchButton.addEventListener('click', function() {

  if (searchInput.style.display === 'none') {
    searchInput.style.display = 'block';
    addItemButton1.style.display = 'none';
    addItemButton2.style.display = 'none';
  } else {
    searchInput.style.display = 'none';
    addItemButton1.style.display = 'block';
    addItemButton2.style.display = 'block';
    location.reload();
  }
});




const customerDetails = JSON.parse(localStorage.getItem("customerDetails"));

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
// table coloumn_2
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Phone Number";
table_row.append(table_coloumn);

// table coloumn_3
table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "Customer ID";
table_row.append(table_coloumn);

// table coloumn_5
table_coloumn = document.createElement("th");
table_coloumn.innerText = "View";
table_row.append(table_coloumn);

for (i = 0; i < customerDetails.length; i++) {
  // table row
  table_row_1 = document.createElement("tr");
  table_row_1.setAttribute("class", "tb1");
  // label_name.innerText = register_shop[i]["name"];
  main_table.append(table_row_1);

  // table coloumn_1
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.innerText = customerDetails[i].customer_name;
  table_row_1.append(table_coloumn_1);
  // table coloumn_2
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.innerText = customerDetails[i].customer_phone;
  table_row_1.append(table_coloumn_1);
  // table coloumn_3
  table_coloumn_1 = document.createElement("td");
  table_coloumn_1.setAttribute("class", "forres");
  table_coloumn_1.innerText = customerDetails[i].customer_id;
  table_row_1.append(table_coloumn_1);

  // table coloumn_4
  table_coloumn_1_arrow = document.createElement("td");

  table_row_1.append(table_coloumn_1_arrow);

  const nameValue = customerDetails[i].customer_id;
  // Set the value as a parameter in a URL
  //    const url = "http://127.0.0.1:5500/pages/stock/viewstock.html?stock_name=" + encodeURIComponent(nameValue);
  const url = `./viewcustomer.html?customer_id=${encodeURIComponent(
    nameValue
  )}`;

  // anchor
  a_tag = document.createElement("a");
  a_tag.setAttribute("class", "arrow");
  a_tag.innerText = "→";
  a_tag.setAttribute("href", url);
  table_coloumn_1_arrow.append(a_tag);
}
document.querySelector("main").append(main_table);

// checking




const search = document.getElementById('searchInput');

let tableBody = document.getElementById('tableBody');

search.addEventListener('keyup', function() {
  let searchValue = search.value.toLowerCase();
  let rows = tableBody.getElementsByTagName('tr');
  
  for (let i = 0; i < rows.length; i++) {
     cells = rows[i].getElementsByTagName('td');
    let matchFound = false;

    // Loop through all cells of the current row
    for (let j = 0; j < cells.length; j++) {
      let cellText = cells[j].textContent.toLowerCase();

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
