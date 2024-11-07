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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Money Care WebSite Sign Up</title>
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
                <table class="custom-table">
            <tr>
                <td><a href="dashboard.jsp">Dashboard</a></td>
                <td><a href="myAccount.jsp">My Account</a></td>
                <td><a href="Expense/expenses.jsp">Expenses</a></td>
                <td><a href="Income/incomes.jsp">Incomes</a></td>
                <td><a href="Expense/expenseCategory.jsp">Expense Categories</a></td>
                <td><a href="Income/incomeCategory.jsp">Income Categories</a></td>
            </tr>
        </table>
            </nav>
            <a href="../sign_out.jsp">
                <button type="button" class="btn btn-primary" style="padding-left: ">Sign Out</button>
            </a>
        </header>

        <section style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper">
                <h1>Welcome <% out.println(user.getFirstName()); %> <% out.println(user.getLastName()); %></h1>
                <form action="dashboard.jsp" method="POST" id="filterForm">
                    <div class="input-box">From:
                        <input type="date" placeholder="Date" name="startDate" value="<%= java.time.LocalDate.now()%>">
                    </div>
                    <div class="input-box">To:
                        <input type="date" placeholder="Date" name="finishDate" value="<%= java.time.LocalDate.now()%>">
                    </div>
                    <button type="submit" class="btn" name="daterange">Press Me To Get Details</button>
                </form>
            </div>
        </section>

        <%
            if (request.getParameter("daterange") != null) {
        %>
        <section style="display: flex; justify-content: center; align-items: center;">
            <div class="wrapper">
                <%
                    Date startdate = null;
                    Date finishDate = null;

                    String startdateStr = request.getParameter("startDate");
                    String finishDateStr = request.getParameter("finishDate");
                    double total_expense = 0;
                    try {
                        if (startdateStr != null && !startdateStr.isEmpty()) {
                            startdate = Date.valueOf(startdateStr);
                            finishDate = Date.valueOf(finishDateStr);
                            List<Expense> expensesToDate = DbExpense.getExpensesByUserAndDate(DbConnector.getConnection(), user.getId(), startdate, finishDate);
                            for (Expense expdateitem : expensesToDate) {
                                total_expense += expdateitem.getAmount();
                            }
                        }
                    } catch (IllegalArgumentException e) {
                
                    }
                %>
                <p style="text-align: center; font-size: 24px;">Show to Details from <%=startdateStr%> to <%=finishDateStr%></p>
            </div>
        </section>
        <%
            double total_income = 0;
            try {
                if (startdateStr != null && !startdateStr.isEmpty()) {
                    startdate = Date.valueOf(startdateStr);
                    finishDate = Date.valueOf(finishDateStr);
                    List<Income> incomesToDate = DbIncome.getIncomesByUserAndDate(DbConnector.getConnection(), user.getId(), startdate, finishDate);
                    for (Income expdateitem : incomesToDate) {
                        total_income += expdateitem.getAmount();
                    }
                }
            } catch (IllegalArgumentException e) {
                
            }
        %>

        <section>
            <div class="wrapper">
                <h1>Total Expense: <%= total_expense%></h1>
            </div>
        </section>

        <section>
            <div class="wrapper">
                <h1>Total Income: <%= total_income%></h1>
            </div>
        </section>

        <section>
            <div class="wrapper">
                <h1>Balance:
                    <%
                        double balance = total_income - total_expense;
                        if (balance <= 0) {
                            out.println("<a style=\"color: red\">" + balance + "</a>");
                        } else {
                            out.println("<a style=\"color: green\">" + balance + "</a>");
                        }
                    %>
                </h1>
            </div>
        </section>
        <%
            }
        %>
        <footer class="footer">
            <div class="boxcontainer">
                <div class="socialicon">
                    <a href=""><i class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
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