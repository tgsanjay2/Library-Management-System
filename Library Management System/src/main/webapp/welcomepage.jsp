<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/welcomepage.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    <title>Home-page</title>
</head>
<body>
    <section id="welcome" class="hero">
        <div class="login">
          <div class="login-contents">
            <a class="btn1" href="./register.jsp">Signup</a>
            <a class="btn" href="./login.jsp">Login</a>
          </div>
        </div>
        <div class="container">
          <h1>Welcome to Our Library</h1>
          <p>Your gateway to a world of knowledge and information. Explore our extensive collection of books, journals, and digital resources.</p>
        </div>
      </section>
      <section id="quotes" class="quotes-carousel">
        <div class="container">
            <div class="carousel">
                <div><p>"The only thing that you absolutely have to know is the location of the library."</p><p class="author">- Albert Einstein</p></div>
                <div><p>"Libraries open up windows to the world and inspire us to explore and achieve, and contribute to improving our quality of life."</p><p class="author">- Sidney Sheldon</p></div>
                <div><p>"Libraries were full of ideas – perhaps the most dangerous and powerful of all weapons."</p> <p class="author">- Sarah J. Maas</p></div>
                <div><p>"I ransack public libraries, and find them full of sunk treasure."</p> <p class="author">- Virginia Woolf</p></div>
                <div><p>"I have always imagined that paradise will be a kind of library." </p> <p class="author">- Jorge Luis Borges</p></div>
            </div>
        </div>
    </section>
    
      <section id="features" class="features">
        <div class="container">
          <h2>Features</h2>
          <div class="feature-cards">
            <div class="card">
              <h3>Search & Browse</h3>
              <p>Quickly find books, journals, and other resources using our advanced search and filtering options.</p>
            </div>
            <div class="card">
              <h3>User Accounts</h3>
              <p>Create an account to manage your loans, reservations, and personal reading lists.</p>
            </div>
            <div class="card">
              <h3>Online Reservations</h3>
              <p>Reserve books and other materials online and pick them up at your convenience.</p>
            </div>
            <div class="card">
              <h3>Notifications</h3>
              <p>Get notifications about due dates, new arrivals, and library events.</p>
            </div>
          </div>
        </div>
      </section>
      <footer id="footer" class="footer">
        <div class="container">
          <div class="footer-content">
            <div class="footer-section connect">
              <h3>Connect with Us</h3>
              <ul>
              <li><a href="">LinkedIn</a></li>
              <li><a href="">FaceBook</a></li>
              <li><a href="">Twitter</a></li>
              </ul>
            </div>
            <div class="footer-section links">
              <h3>Quick Links</h3>
              <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">My Account</a></li>
                <li><a href="#">Login/Signup</a></li>
              </ul>
            </div>
            <div class="footer-section contact">
              <h3>Contact Us</h3>
              <p>Email: support@librarysystem.com</p>
              <p>Phone: +123-456-7890</p>
            </div>
          </div>
        </div>
        <div class="footer-bottom">
          <p>&copy; 2024 Library Management System. All rights reserved.</p>
        </div>
      </footer>
            
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script>
  $(document).ready(function(){
      $('.carousel').slick({
          autoplay: true,
          autoplaySpeed: 5000,
          dots: true,
          infinite: true,
          speed: 500,
          slidesToShow: 1,
          slidesToScroll: 1,
          adaptiveHeight: true
      });
  });
  </script>
  
</html>
