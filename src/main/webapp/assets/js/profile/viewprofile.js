const userRecords = JSON.parse(localStorage.getItem("userRecords"));
const unique = localStorage.getItem("unique");

function findDetail(e) {
  return e.user_email === unique;
}

const user_records = userRecords.find(findDetail);

document.querySelector(".button_2").addEventListener("click", function () {
  remove();
});

document.querySelector(".button_2_1").addEventListener("click", function () {
  logout();
});
document.getElementById("profile_form").addEventListener("submit", function () {
  update();
});

document.querySelector(".button_1").addEventListener("click", function () {
  backbutton();
});

document.getElementById("licence_number").addEventListener("click", giveNo);
document.getElementById("user_email").addEventListener("click", giveNo);
document.getElementById("nameforprint").addEventListener("click", giveAlert);
document.getElementById("file").addEventListener("click", giveAlert);

document.getElementById("shop_name").value = user_records.shop_name;
document.getElementById("licence_number").value = user_records.licence_number;
document.getElementById("user_email").value = user_records.user_email;
document.getElementById("phone_number").value = user_records.phone_number;

function update() {
 
  const shop_name = document.getElementById("shop_name").value;
  const phone_number = document.getElementById("phone_number").value;
  const gstn_number = document.getElementById("gstn_number").value;
  const address = document.getElementById("address").value;
  const nameforprint = document.getElementById("nameforprint").value;

  user_records.shop_name = shop_name;
  user_records.phone_number = phone_number;
  user_records.gstn_number = gstn_number;
  user_records.address = address;
  user_records.nameforprint = nameforprint;
  alert("Successfully Updated");
  localStorage.setItem("userRecords", JSON.stringify(userRecords));
}

if (user_records.gstn_number.value === "undefined") {
  gstn_number.setAttribute("placeholder", "Please enter GSTN Number");
}
if (user_records.address.value === "undefined") {
  gstn_number.setAttribute("placeholder", "Please enter Your address");
}
if (user_records.nameforprint.value === "undefined") {
  gstn_number.setAttribute("placeholder", "Please enter Print name");
}


document.getElementById("gstn_number").value = user_records.gstn_number;
document.getElementById("address").value = user_records.address;
document.getElementById("nameforprint").value = user_records.nameforprint;

function backbutton() {
  window.location.href = "../homepage/homepage.html";
}

function logout() {
  window.location.href = "../login/login.html";
  alert("Are you sure Logout?");
}

function remove() {
  const user_Records = JSON.parse(localStorage.getItem("userRecords"));
  const unique_1 = localStorage.getItem("unique");
  function findDetails(e) {
    return e.user_email === unique_1;
  }
  records = user_Records.find(findDetails);

  const indexOfShop = user_Records.indexOf(records);
  user_Records.splice(indexOfShop, 1);

  localStorage.setItem("userRecords", JSON.stringify(user_Records));
  window.location.href = "../../index.html";
  alert("Deleted!");

  document.getElementById("gstn_number").value = user_records.gstn_number;
  document.getElementById("address").value = user_records.address;
  document.getElementById("nameforprint").value = user_records.nameforprint;
}



function giveAlert() {
  alert("You need Premium Account To Access this Input");
}

function giveNo() {
  alert("This is not Editable or Can't be Change");
}
