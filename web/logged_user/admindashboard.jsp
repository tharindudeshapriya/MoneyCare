<%@page import="classes.Admin"%>
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
            <nav class="navbar" style=" display: none;" >
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

        <section  style="display: flex; justify-content: center; align-items: center;" id="allincomes" >
            <div class="wrapper">
                <h1>Users</h1>        
                <div class="table-wrapper">
                    <form action="admindashboard.jsp" method="POST">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>First name</th>
                                    <th>Last Name</th>
                                    <th>Username/Email</th>
                                    <th>Role</th>
                                    <th>Delete User</th>
                                </tr>
                            </thead>

                            <% List<User> alllusers = Admin.getAllUsers(DbConnector.getConnection());
                                for (User dbuser : alllusers) {
                                    out.println("<tr>");
                                    out.println("<td>" + dbuser.getId() + "</td>");
                                    out.println("<td>" + dbuser.getFirstName() + "</td>");
                                    out.println("<td>" + dbuser.getLastName() + "</td>");
                                    out.println("<td>" + dbuser.getUserName() + "</td>");
                                    out.println("<td>" + dbuser.getRole() + "</td>");
                                    out.println("<td>");                                   
                                    out.println("<button type=\"submit\" class=\"btn\" style = \"width: 150px;\" name =\"deluserrow\" value =\"" + dbuser.getId() + "\">Delete</button>");
                                    out.println("</td>");
                                    out.println("</tr>");
                                }%>

                            <%
                                if (request.getParameter("deluserrow") != null) {
                                    int userID = Integer.parseInt(request.getParameter("deluserrow"));

                                    boolean delExpRow = Admin.deleteUser(DbConnector.getConnection(), userID);
                                    if (delExpRow) {
                                        response.sendRedirect("admindashboard.jsp");
                                    } else {
                                        response.sendRedirect("admindashboard.jsp?status=4");
                                    }
                                }
                            %>

                        </table>
                    </form>
                </div>
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
<% } else {
        response.sendRedirect("../login.jsp");
    }
%>