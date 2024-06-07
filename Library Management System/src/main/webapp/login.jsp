<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="icon" href="./images/log-in-regular-24.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./styles/login.css">
</head>
<body>
    <form action="Login" method="post"> <!-- Changed method to "post" -->
        <div class="wrapper">
            <h1>Login</h1>
            <div class="inputBox">
                <input type="text" name="username" id="username" placeholder="Username" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="inputBox">
                <input type="password" name="password" id="password" placeholder="Password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="loginButton">
                <button type="submit">Login</button>
            </div>
            <div class="register">
                <p>Don't have an account?<a href="./register.jsp">Register</a></p>
            </div>
        </div>
    </form>
</body>
</html>
