function validateRegisterForm() { 

    let fname = document.forms["registerForm"]["fullName"].value;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  

    if (fname == "") {
      alert("Fullname must be filled out");
      event.preventDefault();
      return false;
    }

    let email = document.forms["registerForm"]["emailId"].value;    
    if (email == "") {
      alert("Email must be filled out");
      event.preventDefault();
      return false;
    }
    if (!(email.match(mailformat))) {
        alert("Email is not in correct format");
        event.preventDefault();
        return false;
    }

    let username = document.forms["registerForm"]["userName"].value;
    if (username == "") {
      alert("Username must be filled out");
      event.preventDefault();
      return false;
    }

    let password = document.forms["registerForm"]["passWord"].value;
    if (password == "") {
      alert("password must be filled out");
      event.preventDefault();
      return false;
    }

    let cpassword = document.forms["registerForm"]["confirmPassWord"].value;
    if (cpassword == "") {
      alert("Confirm password must be filled out");
      event.preventDefault();
      return false;
    }

    if (cpassword == password) {
        return true;  
    }  
    else{  
        alert("password and confirm password must be same!"); 
        event.preventDefault(); 
        return false;  
    }  
    return true;  
    
  }
