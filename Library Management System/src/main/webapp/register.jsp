<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/register.css">
    <title>User Registration</title>
</head>

<body>
    <div id="middle">
        <form action="RegisterStudent" method="post">
            <h1>User Registration</h1>
            <h3>Personal Details</h3>
            <div class="Personal-Details">

                <div class="grid-item">
                    <p class="input-box">
                        <label>First Name <span style="color: red;">*</span> </label>
                        <input type="text" placeholder="First name" name="firstname" required>
                    </p>
                    <p class="input-box">
                        <label>Last Name <span style="color: red;">*</span> </label>
                        <input type="text" placeholder="Last name" name="lastname" required>
                    </p>
                    <p class="input-box">
                        <label>Roll No <span style="color: red;">*</span> </label>
                        <input type="number" placeholder="Roll no" name="rollno" required>
                    </p>
                </div>
                <div class="grid-item">
                    <p class="input-box">
                        <label>Gender <span style="color: red;">*</span> </label>
                        <div class="not-bold">
                        <input type="radio" id="male" name="gender" value="Male">
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="Female">
                        <label for="female">Female</label>
                        </div>
                        <br>
                    </p>
                    <p class="input-box">               
                        <label>Degree <span style="color: red;">*</span> </label>
                        <div class="not-bold">
                        <input type="radio" id="UG" name="degree" value="UG">
                        <label for="UG">UG</label>
                        <input type="radio" id="PG" name="degree" value="PG">
                        <label for="PG">PG</label>
                        </div>
                        <br>
                    </p>
                    <p class="input-box">
                        <label for="course">Course <span style="color: red;">*</span> </label><br><br>
                        <p>
                        <select name="course" id="course" required>
                          <option value="" selected disabled hidden>Choose here</option>
                          <option value="Biomedical Engineering">Biomedical Engineering</option>
                          <option value="Civil Engineering">Civil Engineering</option>
                          <option value="Computer Science and Engineering">Computer Science and Engineering</option>
                          <option value="Electronic and Communication Engineering">Electronics and Communication Engineering</option>
                          <option value="Electrical and  Electronics Engineering">Electrical and Electronics Engineering</option>
                          <option value="Geo Informatics">Geo Informatics</option>
                          <option value="Industrial">Industrial Engineering</option>
                          <option value="Information Technology">Information Technology</option>
                          <option value="Manufacturing Engineering">Manufacturing Engineering</option>
                          <option value="Material Science and Engineering">Material Science and Engineering</option>
                          <option value="Mechanical Engineering">Mechanical Engineering</option>
                          <option value="Mining Engineering">Mining Engineering</option>
                          <option value="Printing and Packaging Technology">Printing and Packaging Technology</option>
                        </select>
                        </p>
                    </p>
                </div>
                <p class="input-box">
                        <label>Semester <span style="color: red;">*</span> </label>
                        <input type="number" placeholder="Semester" name="semester" min="1" max="8" value="1" required>
                    </p>
                <div class="grid-item">
                    <p class="input-box">
                        <label>Email <span style="color: red;">*</span> </label>
                        <input type="email" placeholder="Email" name="email" required>
                    </p>
                    <p class="input-box">
                        <label>Phone No <span style="color: red;">*</span> </label>
                        <input type="number" placeholder="Phone number" id="phone" name="phone" required>
                        <span id="phone-error"></span>
                    </p>
                </div>
            </div>
            <h3>Set Password</h3>
            <div class="password">

                <div class="grid-item">
                    <label>Enter Password <span style="color: red;">*</span></label>
                    <input type="password" id="password" placeholder="Enter password" name="password" required>
                    <span id="password-error"></span>
                </div>
                <div class="grid-item">
                    <label>Confirm Password</label>
                    <input type="password" id="cpassword" placeholder="Confirm password" required>
                    <span id="confirm-error"></span>
                    <br>
                    <br>
                </div>
            </div>
            <div class="register">
                <p>Already have an account?<a href="./login.jsp">Login</a></p>
            </div>
            <div class="btn">
                <button type="submit">Register</button>
            </div>
		</form>   
    </div>
    <script>
    var password = document.getElementById("password");
    var confirmPassword = document.getElementById("cpassword");
    var passwordError = document.getElementById("password-error");
    var confirmError = document.getElementById("confirm-error");
    var submitButton = document.querySelector("button[type='submit']");
    var phone = document.getElementById("phone");
    var phoneError = document.getElementById("phone-error");

    // Function to display error message
    function showError(element, message) {
      element.textContent = message;
      element.style.color = "red";
    }

    // Function to clear error message
    function clearError(element) {
      element.textContent = "";
    }

    // Password validation function
    function validatePassword() {
      const minLength = 8; // Set your minimum password length here

      // Check password length
      if (password.value.length < minLength) {
        showError(passwordError, "Password must be at least " + minLength + " characters");
        submitButton.disabled = true;
        return false;
      } else {
        clearError(passwordError);
      }

      // Check password match
      if (password.value !== confirmPassword.value) {
        showError(confirmError, "Passwords do not match");
        submitButton.disabled = true;
        return false;
      } else {
        clearError(confirmError);
      }

      submitButton.disabled = false; // Enable submit button if all validations pass
      return true;
    }

    // Phone number validation function
    function validatePhone() {
        if (phone.value.length < 10) {
            showError(phoneError, "Invalid phone number");
            submitButton.disabled = true;
        } else {
            clearError(phoneError);
            submitButton.disabled = false;
        }
    }

    // Add event listeners on password and phone fields
    phone.addEventListener("keyup", validatePhone);
    password.addEventListener("keyup", validatePassword);
    confirmPassword.addEventListener("keyup", validatePassword);
</script>

</body>

</html>