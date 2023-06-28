$(function () {
  $('#bootstrap_modal').load("bootstrap_modal.html");
  $("#bootstrap_nav").load("bootstrap_nav.html");
});

function createAlertDiv(content, id) {
  div = document.createElement("div");
  div.innerText = content;
  div.style.color = "red";
  div.id = id;
  return div;
}

function firstNameCheck() {
  firstName = document.getElementById("fname");
  firstNameError = createAlertDiv("Please Enter First Name", "fname-error");
  firstNameErrorRef = document.getElementById(firstNameError.id);

  if (firstName.value == "") {
    if (!firstNameErrorRef) {
      firstName.parentElement.appendChild(firstNameError);
    }
    return false;
  } else if (firstNameErrorRef) {
    firstNameErrorRef.remove();
    return true;
  }
}

function lastNameCheck() {
  lastName = document.getElementById("lname");
  lastNameError = createAlertDiv("Please Enter Last Name", "lname-error");
  lastNameErrorRef = document.getElementById(lastNameError.id);

  if (lastName.value == "") {
    if (!lastNameErrorRef) {
      lastName.parentElement.appendChild(lastNameError);
    }
    return false;
  } else if (lastNameErrorRef) {
    lastNameErrorRef.remove();
    return true;
  }
}

function passwordCheck() {
  password = document.getElementById("password");
  passwordError = createAlertDiv("Please Enter Password", "password-error");
  passwordErrorRef = document.getElementById(passwordError.id);
  if (password.value == "") {
    if (!passwordErrorRef) {
      password.parentElement.appendChild(passwordError);
    }
    return false;
  } else if (passwordErrorRef) {
    passwordErrorRef.remove();
    return true;
  }
}

function cpasswordCheck() {
  password = document.getElementById("password");
  cpassword = document.getElementById("confirm password");
  cpasswordError = createAlertDiv("Please Enter Password", "cpassword-error");
  cpasswordErrorRef = document.getElementById(cpasswordError.id);
  if (password.value != cpassword.value) {
    cpassword.style.borderColor = "red";
  } else {
    cpassword.style.borderColor = "";
  }
  if (cpassword.value == "") {
    if (!cpasswordErrorRef) {
      cpassword.parentElement.appendChild(cpasswordError);
    }
    return false;
  } else if (cpasswordErrorRef) {
    cpasswordErrorRef.remove();
    return true;
  }
}

function emailCheck() {
  emailid = document.getElementById("emailid");
  email_error_content = "Please enter a valid Email ID";
  regEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/g;
  emailError = createAlertDiv("Please Enter A Valid Email ID", "email-error");
  emailErrorRef = document.getElementById(emailError.id)?.remove();
  if ((emailid.value == "" || !emailid.value.match(regEmail))) {
    if (!emailErrorRef) {
      emailid.parentElement.appendChild(emailError);
    }
    return false;
  } else if (emailErrorRef) {
    emailErrorRef.remove();
    return true;
  }
}

function phnumberCheck() {
  phnumber = document.getElementById("phnumber");
  phnumberError = createAlertDiv(
    "Please Enter a Valid Phone Number",
    "phnumber-error"
  );
  phnumberErrorRef = document.getElementById(phnumberError.id);

  if (phnumber.value == "" || phnumber.value.length != 10 || isNaN(phnumber.value)) {
    if (!phnumberErrorRef) {
      phnumber.parentElement.parentElement.appendChild(phnumberError);
      return false;
    }
    
  } else if (phnumberErrorRef) {
    phnumberErrorRef.remove();
    return true;
  }
}

function check() {
  result = false;
  result = firstNameCheck();
  result = lastNameCheck();
  result = passwordCheck();
  result = cpasswordCheck();
  result = emailCheck();
  result = phnumberCheck();
  return result;
}
