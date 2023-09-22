
document.querySelector(".button_2_1").addEventListener("click", function () {
 alert("Are you sure Logout?");
});


document.getElementById("license_number").addEventListener("click", giveNo);
document.getElementById("user_email").addEventListener("click", giveNo);
document.getElementById("gstn_number").addEventListener("click", giveNo);


function giveNo() {
  alert("This is not Editable or Can't be Change");
}
