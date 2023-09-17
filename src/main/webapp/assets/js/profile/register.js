// const { doc } = require("prettier");

const shop_name = document.getElementById("shop_name");
const licence_number = document.getElementById("licence_number");
const phone_number = document.getElementById("phone_number");
const user_email = document.getElementById("email");
// eslint-disable-next-line no-undef
const uuid = uuidv4();

const userRecords = JSON.parse(localStorage.getItem("userRecords")) || [];

document.getElementById("signup_form").addEventListener("submit", function registerForm(e) {
  // registerForm();
  e.preventDefault();

  console.log("Entering registerForm method");


  if (userRecords.some((record) => record.user_email === user_email.value)) {
    alert("Email already exists Please try another one! ");
  } else if (
    userRecords.some((record) => record.phone_number === phone_number.value)
  ) {
    alert("phone Number is already exists Please try another one!");
  } else if (
    userRecords.some((record) => record.licence_number === licence_number.value)
  ) {
    alert("licence Number is already exists Please try another one!");
  } else {
    const newUser = {
      shop_name: shop_name.value,
      licence_number: licence_number.value,
      phone_number: phone_number.value,
      user_email: user_email.value,
      unique: uuid,
    };

    userRecords.push(newUser);
    localStorage.setItem("userRecords", JSON.stringify(userRecords));
    localStorage.setItem("unique", user_email.value);
     alert("Your details successfully registered");
    window.location.href = "./pages/login/username.html";

  }
});
document.getElementById("log-in").addEventListener("click", function () {
  login();
});

// function registerForm(event) {
//   event.preventDefault();

//   console.log("Entering registerForm method");


//   if (userRecords.some((record) => record.user_email === user_email.value)) {
//     alert("Email already exists Please try another one! ");
//   } else if (
//     userRecords.some((record) => record.phone_number === phone_number.value)
//   ) {
//     alert("phone Number is already exists Please try another one!");
//   } else if (
//     userRecords.some((record) => record.licence_number === licence_number.value)
//   ) {
//     alert("licence Number is already exists Please try another one!");
//   } else {
//     const newUser = {
//       shop_name: shop_name.value,
//       licence_number: licence_number.value,
//       phone_number: phone_number.value,
//       user_email: user_email.value,
//       unique: uuid,
//     };

//     userRecords.push(newUser);
//     localStorage.setItem("userRecords", JSON.stringify(userRecords));
//     localStorage.setItem("unique", user_email.value);
//     window.location.href = "./pages/login/username.html";
//     alert("Your details successfully registered");

//   }

// }

function login() {
  window.location.href = "./pages/login/login.html";
}
