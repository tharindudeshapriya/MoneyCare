<%-- 
    Document   : index
    Created on : Aug 3, 2023, 12:35:01 PM
    Author     : Tharindu Deshapriya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title> Money Care WebSite</title>


        <!-- font awsome cdn link-->


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- custom  awsome cdn link-->
        <link rel="stylesheet" href="assets/css/style_home.css">
        <link rel="stylesheet" href="assets/css/backtotop.css">


    </head>

    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <script src="assets/script/backtotop.js"></script>
        <!--header section start-->
        <header class="header">
            <input type="checkbox" name="" id="toggler">
            <label for="toggler" class="fas fa-bars"></label>

            <a href="index.jsp" class="logo">Money Care<span>.</span></a>

            <nav class="navbar">
                <a href="#Home">Home</a>
                <a href="#About">About us</a>
                <a href="#Reviews">Reviews</a>
                <a href="#contact">Contact Us</a>
            </nav>

            <div id="btn1">
                <a href="login.jsp">
                    <button type="button" class="btn btn-primary">Login</button>
                </a>
                <a href="sign_up.jsp">
                    <button type="button" class="btn btn-primary">Sign Up</button>
                </a>
            </div>
        </header>
        <div style="margin-bottom: 100px;">
            <!--header section end-->
            <!--home section starts-->

            <section class="Home" id="Home">

                <div class="content">
                    <h3><b>Welcome To Money Care</b></h3>
                    <span>Expense Tracker Web Application</span>
                    <p>Money Care is not just another expense tracker.<br>It's a complete financial management solution. <br>It
                        empowers you to take charge of your money, make well-informed decisions, and achieve your financial
                        aspirations.</p>
                    <a href="#" class="btn">More Deatils</a>
                </div>
            </section>


            <section class="About" id="About">
                <h1 class="heading"><span>About </span>Us</h1>

                <div class="row">
                    <div class="video-container">
                        <img src="assets/video/about us.gif" loop autoplay muted></video>
                        <h3>Finacial Solution</h3>
                    </div>
                    <div class="content">
                        <h3>Finacial Solution</h3>
                        <p>Our mission is simple to be your trusted companion on the journey to financial well-being. We aim to
                            educate, inform, and guide you through various financial challenges and opportunities, empowering
                            you to take control of your financial future.</p>
                        <p>At Money Care, we offer a diverse range of articles, guides, and tools that cover a wide spectrum of
                            financial topics. Whether you're looking to learn about budgeting, investing, managing debt, or
                            understanding the nuances of the stock market, we've got you covered.
                            Our team works tirelessly to curate up-to-date and accurate content, ensuring that you always have
                            access to the latest financial trends and insights.Choosing Money Care means choosing a reliable and
                            unbiased source for financial information.</p>
                    </div>
                </div>
            </section>


            <section class="Reviews" id="Reviews">
                <h1 class="heading">Customer's <span>Reviews</span></h1>
                <div class="box-container">
                    <div class="box">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p>
                            "Money Care has been an absolute game-changer for me.
                            As someone who was always intimidated by finance-related topics, their articles and guides made
                            everything so easy to understand.
                            I've learned how to budget effectively, invest wisely, and even started planning for retirement.
                            The best part is that it's all unbiased and tailored to my needs. Highly recommended!"
                        </p>
                        <div class="user">
                            <img src="assets/img/Johni.jpg" alt="">
                            <div class="user-info">
                                <h3>Johni Deo.</h3>
                                <span>Happy Customer</span>
                            </div>
                        </div>
                        <span class="fas fa-quote-right"></span>
                    </div>

                    <div class="box">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p>
                            "I stumbled upon Money Care while searching for debt management advice. Their team provided me with
                            a clear strategy to tackle my debts, and I'm now on the path to becoming debt-free.
                            The only reason I'm giving 4 stars instead of 5 is that I wish they had more interactive tools on
                            the website, but their content is top-notch!"
                        </p>
                        <div class="user">
                            <img src="assets/img/Mical.jpg" alt="">
                            <div class="user-info">
                                <h3>Michal Deyo.</h3>
                                <span>Happy Customer</span>
                            </div>
                        </div>
                        <span class="fas fa-quote-right"></span>
                    </div>

                    <div class="box">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p>
                            "As a small business owner, I've found Money Care's business financial consultation service to be
                            invaluable. They've helped me optimize my finances, manage cash flow, and plan for future growth.
                            Their expertise has been a significant factor in the success of my business.
                            I'm grateful for their support!"
                        </p>
                        <div class="user">
                            <img src="assets/img/Nickel.jpg" alt="">
                            <div class="user-info">
                                <h3>Robert H.</h3>
                                <span>Happy Customer</span>
                            </div>
                        </div>
                        <span class="fas fa-quote-right"></span>
                    </div>


            </section>


            <section class="contact" id="contact">
                <h1 class="heading"><span>Contact  </span>Us</h1>
                <div class="row">
                    <form action="">
                        <input type="text" placeholder="Name" class="box">
                        <input type="email" placeholder="Email" class="box">
                        <input type="number" placeholder="Contact Number" class="box">
                        <textarea name="" class="box" placeholder="message" id="" cols="30" rows="10"></textarea>
                        <input type="submit" value="send message" class="btn">
                    </form>
                    <div class="image">
                        <img src="assets/img/contact us2.jpg">
                    </div>

                </div>

            </section>
        </div>


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
