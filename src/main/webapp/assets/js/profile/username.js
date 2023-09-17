const user_email = document.getElementById("user_email");
const new_pw = document.getElementById("new_password");
const pw = document.getElementById("password");

const userRecords = JSON.parse(localStorage.getItem("userRecords"));
const unique = localStorage.getItem("unique");
console.log(unique);

document.getElementById("user_form").addEventListener("submit",function userName(event) {
  event.preventDefault();


  console.log("rajini")
  if (pw.value !== new_pw.value) {
    alert("Passwords do not match");
    return;
  }
  if (unique !== user_email.value) {
    alert("Please Enter correct Email Address");
    return;
  }
  if (user_email.value === 0) {
    alert("Please fill Email Address");
    return;
  }
  if (new_pw.value.length == 0) {
    alert("Please create new password");
    return;
  }
  if (pw.value.length == 0) {
    alert("Please re-enter password");
    return;
  }
  if (pw.value.length < 8) {
    alert("Password Length Max of 8 Characters");
    return;
  }
  if (!pw.value.match(/\d/)) {
    alert("Please add 1 number");
    return;
  }
  if (!pw.value.match(/[A-Z]/)) {
    alert("Please add 1 uppercase letter");
    return;
  }
  if (!pw.value.match(/[a-z]/)) {
    alert("Please add 1 lowercase letter");
    return;
  }

  function findemail(e) {
    return e.user_email == unique;
  }
  const users_records = userRecords.find(findemail);

  // const users_records = userRecords.find(userRecords => unique === user_email.value)

  users_records.user_email = user_email.value;
  users_records.new_pw = new_pw.value;
  users_records.pw = pw.value;

  localStorage.setItem("userRecords", JSON.stringify(userRecords));
  alert("Your Username is successfully Created ");
  window.location.href = "./login.html";
 

});



document.getElementById("new_password").addEventListener("input", showRulez);

function showRulez() {
  document.getElementById("rulez").removeAttribute("style");
}
