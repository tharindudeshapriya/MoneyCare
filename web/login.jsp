<%-- 
    Document   : login
    Created on : Aug 3, 2023, 12:36:02 PM
    Author     : Tharindu Deshapriya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String message = "";
    if(request.getParameter("status") != null){
        int status = Integer.parseInt(request.getParameter("status"));
        if(status == 3){
        message = "<h5 class='text-danger'style=\"text-align: center;color: red;font-size: 16px;\">Your username or password is incorrect.</h5>";
        }
        
    }
    %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title> Money Care WebSite Log In</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    <link rel="stylesheet" href="assets/css/header_footer.css">
    <link rel="stylesheet" href="assets/css/style_login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <script src="../assets/script/backtotop.js"></script>
    <header>
        <input type="checkbox" name="" id="toggler">
        <label for="toggler" class="fas fa-bars"></label>
        <a href="index.jsp" class="logo">Money Care<span>.</span></a>
<!--        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="#about us ">About us </a>
            <a href="#reviews">Reviews</a>
            <a href="#contact">Contact Us</a>
        </nav>-->
        <a href="sign_up.jsp" >
            <button type="button" class="btn btn-primary" style="padding-left: "  >Sign Up</button>
        </a>
    </header>

    <section class="login" id="login" style="display: flex; justify-content: center; align-items: center; ">
        <div class="wrapper">
            <form action="login_auth.jsp" method="POST" id="login-form">
                <h1>Login</h1>
                <%=message%>
                <div class="input-box">
                    <input type="email" placeholder="Email" name="username" required style="text-transform: none;">
                    <i class="bx bxs-user"></i>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Password" name="password" required style="text-transform: none;">
                    <i class="bx bx-lock-alt"></i>
                </div>
                <button type="submit" class="btn">Login</button>
                <p class="register-link">Don't have an account? <a href="sign_up.jsp">Sign Up</a></p>
            </form>
        </div>
    </section>







    <footer class="footer">
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
