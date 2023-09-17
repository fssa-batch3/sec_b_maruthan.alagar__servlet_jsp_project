// main table
main_table = document.createElement("table");
main_table.setAttribute("class", "table");
main_table.setAttribute("id", "table");

// table row
table_row = document.createElement("tr");
table_row.setAttribute("class", "tb1");
main_table.append(table_row);

// table coloumn_1
table_coloumn = document.createElement("th");
table_coloumn.innerText = " S.No";
table_row.append(table_coloumn);

// table coloumn_2
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Item Name";
table_row.append(table_coloumn);

// table coloumn_3
table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "Product ID";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "Quantity";
table_row.append(table_coloumn);

table_coloumn = document.createElement("th");
table_coloumn.setAttribute("class", "forres");
table_coloumn.innerText = "MRP";
table_row.append(table_coloumn);

// table coloumn_5
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Price";
table_row.append(table_coloumn);

// table coloumn_6
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Tax";
table_row.append(table_coloumn);

// table coloumn_7
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Discount";
table_row.append(table_coloumn);

// table coloumn_8
table_coloumn = document.createElement("th");
table_coloumn.innerText = "Amount";
table_row.append(table_coloumn);



document.querySelector("main").append(main_table);

const dateInput = document.getElementById("date-input");

const systemDate = new Date();

const year = systemDate.getFullYear();
const month = (systemDate.getMonth() + 1).toString().padStart(2, "0");
const day = systemDate.getDate().toString().padStart(2, "0");
const dateString = `${year}-${month}-${day}`;

dateInput.value = dateString;


let currentTime = new Date().toLocaleTimeString("en-IN", { timeZone: "Asia/Kolkata" });


let total_1 = 0;
let total_2 = 0;
let total_3 = 0;
let total_4 = 0;
let total_5 = 0;
let total_6 = 0;

if ((total_2 = " ")) {
  document.getElementById("total_quantity").value = "0";
  document.getElementById("total_mrp").value = "0/-";
  document.getElementById("total_tax").value = "0/-";
  document.getElementById("total_price").value = "0/-";
  document.getElementById("total_amount").value = "0/-";
  document.getElementById("total_discount").value = "0/-";
  document.getElementById("sub_total").value = "0/-";
  document.getElementById("total").value = "0/-";
}


// document.getElementById("cus_form").addEventListener("submit", () => {
//   newDetail();
// });

const uuid = uuidv4();
let product_records;

document.getElementById("cus_form").addEventListener("submit", function newDetail(e) {
  e.preventDefault();
  const orders = JSON.parse(localStorage.getItem("orders")) || [];
  const order_products =
    JSON.parse(localStorage.getItem("order_products")) || [];

  const product_name = document.getElementById("product_name").value;
  const product_id = document.getElementById("product_id").value;

  const _quantity = document.getElementById("quantity");
  const quantity = parseInt(_quantity.value);

  const _price = document.getElementById("price");
  const price = parseInt(_price.value);

  const _tax = document.getElementById("tax");
  const tax = parseInt(_tax.value);

  const _discount = document.getElementById("discount");
  const discount = parseInt(_discount.value);

  const mrp = document.getElementById("mrp").value;
  const customer_id = document.getElementById("customer_id").value;

  let amount = 0;

 

  const exist = orders.length && orders.some((data) => data.order_id == uuid);

  if (!exist) {
    orders.push({
      customer_id,
      order_id: uuid,
    });
    localStorage.setItem("orders", JSON.stringify(orders));

  }

  amount = (price - discount + tax) * quantity;

  const exists =
    order_products.length &&
    order_products.some(
      (data) => data.order_id == uuid && data.product_id == product_id
    );


  
  
    let a = true;
  if (!exists) {
    order_products.push({
      product_name,
      order_id: uuid,
      quantity,
      product_id,
      price,
      mrp,
      tax,
      discount,
      amount,
    });
    localStorage.setItem("order_products", JSON.stringify(order_products));
  } else {
    alert("Product already added");
    a = false;
  }

  const findData = order_products.filter((data) => data.order_id == uuid);

  if (a !== false) {
    for (let i = 0; i < findData.length; i++) {
      if (i === findData.length - 1) {
        // table row
        table_row_1 = document.createElement("tr");
        table_row_1.setAttribute("class", "tb1");

        main_table.append(table_row_1);

        table_coloumn_1 = document.createElement("td");
        table_coloumn_1.innerText = `${i + 1}.`;
        table_row_1.append(table_coloumn_1);

        table_coloumn_2 = document.createElement("td");
        table_coloumn_2.innerText = findData[i].product_name;
        table_row_1.append(table_coloumn_2);

        table_coloumn_3 = document.createElement("td");
        table_coloumn_3.innerText = findData[i].product_id;
        table_row_1.append(table_coloumn_3);

        table_coloumn_4 = document.createElement("td");
        table_coloumn_4.innerText = findData[i].quantity;
        table_row_1.append(table_coloumn_4);

        table_coloumn_8 = document.createElement("td");
        table_coloumn_8.innerText = findData[i].mrp;
        table_row_1.append(table_coloumn_8);

        table_coloumn_5 = document.createElement("td");
        table_coloumn_5.innerText = findData[i].price;
        table_row_1.append(table_coloumn_5);

        table_coloumn_6 = document.createElement("td");
        table_coloumn_6.innerText = findData[i].tax;
        table_row_1.append(table_coloumn_6);

        table_coloumn_7 = document.createElement("td");
        table_coloumn_7.innerText = findData[i].discount;
        table_row_1.append(table_coloumn_7);

        table_coloumn_8 = document.createElement("td");
        table_coloumn_8.innerText = findData[i].amount + "/-";
        table_row_1.append(table_coloumn_8);

        _price.value = _price.defaultValue;
        _discount.value = _discount.defaultValue;
        _quantity.value = _quantity.defaultValue;
        _tax.value = _tax.defaultValue;


        document.getElementById("product_id").value = "";
        document.getElementById("product_name").value = "";
        document.getElementById("mrp").value = "";

        findTotal();
      }
    }
  }
});

function findTotal() {
 
  const total_quantity = document.getElementById("total_quantity");
  const total_mrp = document.getElementById("total_mrp");
  const total_tax = document.getElementById("total_tax");
  const total_price = document.getElementById("total_price");
  const total_amount = document.getElementById("total_amount");
  const total_discount = document.getElementById("total_discount");
  const sub_total = document.getElementById("sub_total");
  const total = document.getElementById("total");

  const table = document.getElementById("table");

  const cells_1 = table.querySelectorAll("td:nth-child(4)");
  const cells_2 = table.querySelectorAll("td:nth-child(5)");
  const cells_3 = table.querySelectorAll("td:nth-child(6)");
  const cells_4 = table.querySelectorAll("td:nth-child(7)");
  const cells_5 = table.querySelectorAll("td:nth-child(8)");
  const cells_6 = table.querySelectorAll("td:nth-child(9)");

  let sum_1 = 0;
  let sum_2 = 0;
  let sum_3 = 0;
  let sum_4 = 0;
  let sum_5 = 0;
  let sum_6 = 0;

  for (let i = 0; i < cells_1.length; i++) {
    const value_1 = parseFloat(cells_1[i].textContent);
    const value_2 = parseFloat(cells_2[i].textContent);
    const value_3 = parseFloat(cells_3[i].textContent);
    const value_4 = parseFloat(cells_4[i].textContent);
    const value_5 = parseFloat(cells_5[i].textContent);
    const value_6 = parseFloat(cells_6[i].textContent);

    sum_1 += value_1;
    sum_2 += value_2;
    sum_3 += value_3;
    sum_4 += value_4;
    sum_5 += value_5;
    sum_6 += value_6;
  }

  total_quantity.value = sum_1;
  total_mrp.value = `${sum_2}/-`;
  total_price.value = `${sum_3}/-`;
  total_tax.value = `${sum_4}/-`;
  total_discount.value = `${sum_5}/-`;
  total_amount.value = `${sum_6}/-`;
  sub_total.value = `${sum_6}/-`;
  total.value = `${sum_6}/-`;

  total_1 = sum_1;
  total_2 = sum_2;
  total_3 = sum_3;
  total_4 = sum_4;
  total_5 = sum_5;
  total_6 = sum_6;
}

const num = Math.floor(Math.random() * 100000000);
const txn_id = `T${num}`;

document.getElementById("txn_id").value = txn_id;

document.getElementById("cash").setAttribute("checked", "checked");





document.getElementById("payment").addEventListener("submit", function saveData(e) {
  e.preventDefault();

  const order_bills = JSON.parse(localStorage.getItem("order_bill")) || [];

  const checkBoxes = document.querySelectorAll('input[name="payment"]');
  const total_quantity = document.getElementById("total_quantity").value;

  let selectedValue = "cash";


  if (total_quantity <= 0) {
    alert("Please add atleast one product")
  } else {


    for (let i = 0; i < checkBoxes.length; i++) {
      const element = checkBoxes[i];

      if (element.checked === true) {
        selectedValue = element.value;
        break;
      }
    }

    const bill_no = order_bills.length + 1;

    const order_bill = {
      order_id: uuid,
      bill_date: dateInput.value,
      bill_time: currentTime,
      payment_method: selectedValue,
      bill_no: `B${bill_no}`,
      transaction_id: txn_id,
      total_quantity: total_1,
      total_mrp: total_2,
      total_price: total_3,
      total_tax: total_4,
      total_discount: total_5,
      total_amount: total_6,
    };

    order_bills.push(order_bill);
    localStorage.setItem("order_bill", JSON.stringify(order_bills));
    alert("Bill Successfully Saved");
    const url = `./bill_design.html?order_id=${encodeURIComponent(
      uuid
    )}`
    window.location.href = url
    // document.getElementById("cus_form").reset();
    // location.reload();
  }
});



document.getElementById("customer_phone").addEventListener("change", selectCustomer)
document.getElementById("product_id").addEventListener("change", selectProduct)
document.getElementById("quantity").addEventListener("change", getQuantity)
let findData = []

function selectCustomer() {
 

  let customer_phone = document.getElementById("customer_phone").value;
  const customerDetails = JSON.parse(localStorage.getItem("customerDetails"));

  findData = customerDetails.filter(
    (data) => data.customer_phone == customer_phone
  );

  console.log(findData);


  for (let i = 0; i < findData.length; i++) {
    customer_name = document.getElementById("customer_name").value =
      findData[i].customer_name;
    customer_phone = document.getElementById("customer_phone").value =
      findData[i].customer_phone;
    customer_id = document.getElementById("customer_id").value =
      findData[i].customer_id;
    break;
  }
}



function cus() {
 
  if (findData.length == 0) {
    const uuid = uuidv4();
    const customerDetails = JSON.parse(localStorage.getItem("customerDetails"))
    if (
      customerDetails.some(
        (record) => record.customer_phone === customer_phone.value
      )
    ) {
      alert("Customer Phone Number is already exists! ");
    }
    else if (
      customerDetails.some(
        (record) => record.customer_id === customer_id.value
      )
    ) {
      alert("Customer ID Number is already exists! ");
    } else {
      const newCustomer = {
        customer_name: customer_name.value,
        customer_phone: customer_phone.value,
        customer_id: customer_id.value,
        unique: uuid,
      };

      customerDetails.push(newCustomer);
      localStorage.setItem("customerDetails", JSON.stringify(customerDetails));

    }
  }
};




function selectProduct() {
 
  let product_id = document.getElementById("product_id").value
  const productDetails = JSON.parse(localStorage.getItem("productDetails"));




  let filterData = productDetails.filter(
    (detail) => detail.product_id === product_id
  );
  if (filterData.length > 0) {



    for (let i = 0; i < productDetails.length; i++) {
      document.getElementById("product_name").value =
        filterData[i].product_name;
      document.getElementById("product_id").value =
        filterData[i].product_id;
      document.getElementById("tax").value =
        filterData[i].tax;
      document.getElementById("mrp").value =
        filterData[i].mrp;
      document.getElementById("discount").value =
        filterData[i].discount;
      document.getElementById("price").value =
        filterData[i].price;
      break;

    }
  } else {
    alert("Product is not found! Please Add in your product List");
  }
}


function getQuantity() {
  

  const productDetails = JSON.parse(localStorage.getItem("productDetails"));
  let total_1_quantity= document.getElementById("quantity").value
  const product_id = document.getElementById("product_id").value;

  console.log(product_id)
  console.log(total_1_quantity)

   


    function findData_Quan(e) {
      return e.product_id === product_id;
    }
    const filterData = productDetails.find(findData_Quan);
 console.log(filterData)
    console.log(filterData.total_quantity)
  
if (total_1_quantity > filterData.total_quantity) {
    alert("Product is Out of Stock or Try with less than " + filterData.total_quantity )
    document.getElementById("quantity").value = "";
}else if (total_1_quantity <= filterData.total_quantity ) {
  filterData.total_quantity = (filterData.total_quantity - total_1_quantity);
  localStorage.setItem("productDetails", JSON.stringify(productDetails));
}
 
}
