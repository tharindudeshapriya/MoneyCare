<%-- 
    Document   : sign_up
    Created on : Aug 3, 2023, 12:36:30 PM
    Author     : Tharindu Deshapriya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String message = "";
    if (request.getParameter("status") != null) {
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == 1) {
            message = "<h5 class='text-success' style=\"text-align: center;color:green ;font-size: 16px;\">You have successfully registered with Moneycare.</h5>";
        } else if (status == 2) {
            message = "<h5 class='text-success'style=\"text-align: center;color:green ;font-size: 16px;\">password did not match.</h5>";
        } else {
            message = "<h5 class='text-danger' style=\"text-align: center;color:green ;font-size: 16px;\">An error occurred. Please register again.</h5>";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title> Money Care WebSite Sign Up</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="assets/css/header_footer.css">
        <link rel="stylesheet" href="assets/css/style_sign_up.css">
    </head>

    <body>

        <header>

            <input type="checkbox" name="" id="toggler">
            <label for="toggler" class="fas fa-bars"></label>

            <a href="index.jsp" class="logo">Money Care<span>.</span></a>

            <!--            <nav class="navbar">
                            <a href="index.jsp">Home</a>
                            <a href="#about us ">About us </a>
                            <a href="#reviews">Reviews</a>
                            <a href="#contact">Contact Us</a>
            
                        </nav>-->
            <a href="login.jsp">
                <button type="button" class="btn btn-primary" >Login</button>
            </a>
        </header>


        <section class="signup" id="signup" style="display: flex; justify-content: center; align-items: center;">
    <div class="wrapper">
        <form action="registration.jsp" method="POST" id="signup-form" >
            <h1>Sign Up</h1>
            <%=message%>
            <div class="input-box">
                <input type="text" placeholder="First Name" name="firstname" required style="text-transform: none;">
                <i class="bx bxs-user"></i>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Last Name" name="lastname" style="text-transform: none;">
                <i class="bx bxs-user"></i>
            </div>
            <div class="input-box">
                <input type="email" placeholder="Email" name="username" style="text-transform: none;">
                <i class="bx bxs-envelope"></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" name="password" minlength="8" required>
                <i class="bx bxs-lock-alt"></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Confirm Password" name="conpassword" minlength="8" required>
                <i class="bx bxs-lock-alt"></i>
            </div>
            <div class="remember-forget">
                <p sty>Already have an account?<a href="login.jsp.jsp"> Log In</a></p>
            </div>
            <button type="submit" class="btn">Sign Up</button>
        </form>
    </div>
</section>


        <footer class="footer" >
            <div class="boxcontainer">
                <div class="socialicon">
                    <a href=""><i class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
                    <a href=""><i class="fa-brands fa-google-plus"></i></a>
                    <a href=""><i class="fa-brands fa-youtube"></i></a>
                </div>
                <div class="footernav">
                    <ul>
                        <li><a href="">Home</a></li>
                        <li><a href="">About Us</a></li>
                        <li><a href="">Reviews</a></li>
                        <li><a href="">Contact Us</a></li>
                    </ul>
                </div>
            </div>
            <div class="footerBottom">
                <p> Copyright &copy;2023</p>
            </div>
        </footer>
    </body>
</html>