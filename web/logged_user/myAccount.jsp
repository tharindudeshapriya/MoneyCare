<%@page import="classes.MD5"%>
<%@page import="classes.Income.DbIncome"%>
<%@page import="classes.Income.Income"%>
<%@page import="java.sql.Date"%>
<%@page import="classes.Expense.ExpenseCategory"%>
<%@page import="classes.Expense.Expense"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page import="classes.Expense.DbExpense"%>
<%@page import="classes.User"%>
<%@page session="true" %>
<%
    if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");

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
        <link rel="stylesheet" href="../assets/css/header_footer.css">
        <link rel="stylesheet" href="../assets/css/style_dashboard.css">
        <link rel="stylesheet" href="../assets/css/backtotop.css">
    </head>

    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <script src="../assets/script/backtotop.js"></script>

        <header>
            <input type="checkbox" name="" id="toggler">
            <label for="toggler" class="fas fa-bars"></label>
            <a href="../index.jsp" class="logo">Money Care<span>.</span></a>
            <nav class="navbar">
                <a href="dashboard.jsp">Dashboard</a>
                <a href="myAccount.jsp">My Account</a> 
                <a href="Expense/expenses.jsp">Expenses</a>
                <a href="Income/incomes.jsp">Incomes</a> 
                <a href="Expense/expenseCategory.jsp">Expense Categories</a>
                <a href="Income/incomeCategory.jsp">Income Categories</a>
            </nav>
            <a href="../sign_out.jsp" >
                <button type="button" class="btn btn-primary" style="padding-left: "  >Sign Out</button>
            </a>
        </header>

        <section class="update-profile" id="update-profile" style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper" style="width: 420px;">
                <form action="myAccount.jsp" method="POST">
                    <button class="btn" name="updateprofile" >Update Profile</button>
                    <button class="btn" name="chgpassword" >Change password</button>
                    <button class="btn" name="deleteprofile">Delete Profile</button>
                    <button class="btn" name="getreport" >Get a report</button> 
                </form>

            </div>
        </section>


        <%            if (request.getParameter("updateprofile") != null) {
        %>   
        <section class="update-profile" id="update-profile" style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper" style="width: 420px;">
                <form action="myAccount.jsp" method="POST">
                    <h1>Update Profile</h1>
                    <br><br>
                    <div class="input-box">
                        <input type="text" placeholder="<% out.println(user.getFirstName()); %> " name="newFirstname" style="text-transform: none;">
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="text" placeholder="<% out.println(user.getLastName()); %>" name="newLastname" style="text-transform: none;">
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="email" placeholder="<% out.println(user.getUserName()); %>" name="newEmail" style="text-transform: none;">
                        <i class='bx bxs-envelope'></i>
                    </div>
                    <button type="submit" class="btn" name="uptpro">Update Profile</button>
                </form>
            </div>
        </section>


        <%
            }
        %> 
        <%
            if (request.getParameter("uptpro") != null) {

                boolean userupdate = user.updateBasicDetails(DbConnector.getConnection(), request.getParameter("newFirstname"), request.getParameter("newLastname"), request.getParameter("newEmail"), user.getId());

                if (userupdate) {
                    response.sendRedirect("myAccount.jsp");
                } else {
                    response.sendRedirect("myAccount.jsp?status=4");
                }
            }
        %>


        <%            if (request.getParameter("deleteprofile") != null) {
        %>   
        <section class="update-profile" id="update-profile" style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper" style="width: 420px;">
                <form action="myAccount.jsp" method="POST">
                    <h1>Delete Profile</h1>
                    <br><br>
                    <div class="input-box">
                        <input type="password" placeholder="Password" name="delpass" style="text-transform: none;">
                        <i class='bx bxs-lock-alt'></i>
                    </div>
                    <button type="submit" class="btn" name="deluser">Confirm</button>
                </form>
            </div>
        </section>

        <%
            }
        %> 
        <%
            if (request.getParameter("deluser") != null) {

                boolean deluser = user.deleteUserAndData(DbConnector.getConnection(), MD5.getMd5(request.getParameter("deluser")), user.getId());

                if (deluser) {
                    response.sendRedirect("../index.jsp");
                } else {
                    response.sendRedirect("myAccount.jsp?status=5");
                }
            }

        %>


        <%            if (request.getParameter("chgpassword") != null) {
        %>   

        <section class="update-profile" id="update-profile" style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper" style="width: 420px;">
                <form action="myAccount.jsp" method="POST">
                    <h1>Change password</h1>
                    <br><br>
                    <div class="input-box">
                        <input type="password" placeholder="Exsisting Password" name="Password" style="text-transform: none;"required>
                        <i class='bx bxs-lock-alt'></i>
                    </div>
                    <div class="input-box">
                        <input type="password" placeholder="New Password" name="newPassword" style="text-transform: none;"required>
                        <i class='bx bxs-lock-alt'></i>
                    </div>
                    <div class="input-box">
                        <input type="password" placeholder="Confirm New Password" name="connewPassword" style="text-transform: none;"required>
                        <i class='bx bxs-lock-alt'></i>
                    </div>
                    <button type="submit" class="btn" name="chgpass">Change Password</button>
                </form>
            </div>
        </section>

        <%
            }
        %>   
        <%
            if (request.getParameter("chgpass") != null) {
                if (request.getParameter("newPassword").equals(request.getParameter("connewPassword"))) {
                    if (MD5.getMd5(request.getParameter("Password")).equals(user.getUserPassword())) {
                        boolean chgpass = user.updatePassword(DbConnector.getConnection(), MD5.getMd5(request.getParameter("newPassword")), user.getId());
                        if (chgpass) {
                            response.sendRedirect("myAccount.jsp");
                        } else {
                            response.sendRedirect("myAccount.jsp?status=6");
                        }
                    }
                }
            }
        %> 


        <%            if (request.getParameter("getreport") != null) {
        %> 

        <section class="update-profile" id="update-profile" style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper" style="width: 420px;">
                <form action="myAccount.jsp" method="POST">
                    <h1>Report</h1>
                    <button type="submit" class="btn" name="genreport">Get a Report</button>
                </form>
            </div>
        </section>

        <%
            }
        %> 
        <%
            if (request.getParameter("genreport") != null) {

        %>



        <section  style="display: flex; justify-content: center; align-items: center;" id="allincomes" >
            <div class="wrapper">
                <h1>Report</h1>        
                <div class="table-wrapper">
                    <form action="incomes.jsp" method="POST">
                        <table class="table">
                            <thead>
                                <tr><th colspan="4">
                                        INCOMES
                                    </th>
                                </tr>
                                <tr>                                    
                                    <th>Category Name</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Description</th>
                                </tr>
                            </thead>

                            <% List<Income> incomesRows = DbIncome.getIncomesByUserId(DbConnector.getConnection(), user.getId());
                                for (Income incomerow : incomesRows) {
                                    out.println("<tr>");
                                    out.println("<td>" + incomerow.getCategoryName() + "</td>");
                                    out.println("<td>" + incomerow.getAmount() + "</td>");
                                    out.println("<td>" + incomerow.getIncomeDate() + "</td>");
                                    out.println("<td>" + incomerow.getDescription() + "</td>");
                                    out.println("</tr>");
                                }%>
                            <thead>
                                <tr><th colspan="4">
                                        EXPENSES
                                    </th>
                                </tr>
                                <tr>                                    
                                    <th>Category Name</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Description</th>
                                </tr>
                            </thead>

                            <% List<Expense> expensesRows = DbExpense.getExpensesByUserId(DbConnector.getConnection(), user.getId());
                                for (Expense expenserow : expensesRows) {
                                    out.println("<tr>");
                                    out.println("<td>" + expenserow.getCategoryName() + "</td>");
                                    out.println("<td>" + expenserow.getAmount() + "</td>");
                                    out.println("<td>" + expenserow.getExpenseDate() + "</td>");
                                    out.println("<td>" + expenserow.getDescription() + "</td>");
                                    out.println("</tr>");
                                }%>

                            
                        </table>
                    </form><br><br>
                            <div style="margin-left: 80%;">
                            <button type="submit" class="btn" style = "width: 150px;" name ="delcatrow" >Save</button>
                            </div>
                </div>
            </div>
        </section>






        <%
            }
        %> 

        <div style="padding-top: 150px;">
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
</div>
    </body>
</html>
<% } else {
        response.sendRedirect("../login.jsp");
    }
%>