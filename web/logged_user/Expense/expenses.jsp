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
        <title> Money Care Expenses</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../../assets/css/header_footer.css">
        <link rel="stylesheet" href="../../assets/css/style_dashboard.css">
        <link rel="stylesheet" href="../../assets/css/backtotop.css">
    </head>

    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
        <script src="../../assets/script/backtotop.js"></script>

        <header>
            <input type="checkbox" name="" id="toggler">
            <label for="toggler" class="fas fa-bars"></label>
            <a href="../index.jsp" class="logo">Money Care<span>.</span></a>
            <nav class="navbar">
                <table class="custom-table">
            <tr>
                <td><a href="../dashboard.jsp">Dashboard</a></td>
                <td><a href="../myAccount.jsp">My Account</a></td>
                <td><a href="expenses.jsp">Expenses</a></td>
                <td><a href="../Income/incomes.jsp">Incomes</a></td>
                <td><a href="expenseCategory.jsp">Expense Categories</a></td>
                <td><a href="../Income/incomeCategory.jsp">Income Categories</a></td>
            </tr>
        </table>
            </nav>
            <a href="../../sign_out.jsp">
                <button type="button" class="btn btn-primary" style="padding-left: ">Sign Out</button>
            </a>
        </header>

        <section  style="display: flex; justify-content: center; align-items: center;" id="allexpenses" >
            <div class="wrapper">
                <h1>Expenses</h1>        
                <div class="table-wrapper">
                    <form action="expenses.jsp" method="POST">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Expense ID</th>
                                    <th>Expense Name</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Description</th>
                                    <th>Delete record</th>
                                </tr>
                            </thead>

                            <% List<Expense> expensesRows = DbExpense.getExpensesByUserId(DbConnector.getConnection(), user.getId());
                                for (Expense expenserow : expensesRows) {
                                    out.println("<tr>");
                                    out.println("<td>" + expenserow.getExpenseId()+ "</td>");
                                    out.println("<td>" + expenserow.getCategoryName() + "</td>");
                                    out.println("<td>" + expenserow.getAmount() + "</td>");
                                    out.println("<td>" + expenserow.getExpenseDate() + "</td>");
                                    out.println("<td>" + expenserow.getDescription() + "</td>");
                                    out.println("<td>");
                                    out.println("<button type=\"submit\" class=\"btn\" style = \"width: 150px;\" name =\"delcatrow\" value =\"" + expenserow.getExpenseId() + "\">Delete</button>");
                                    out.println("<button type=\"submit\" class=\"btn\" style = \"width: 150px;\" name =\"updaterow\" value =\"" + expenserow.getExpenseId() + "\">update</button>");
                                    out.println("</td>");
                                    out.println("</tr>");
                                }%>

                            <%
                                if (request.getParameter("delcatrow") != null) {
                                    int expenseId = Integer.parseInt(request.getParameter("delcatrow"));

                                    boolean delExpRow = DbExpense.deleteExpense(DbConnector.getConnection(), expenseId);
                                    if (delExpRow) {
                                        response.sendRedirect("expenses.jsp");
                                    } else {
                                        response.sendRedirect("expenses.jsp?status=4");
                                    }
                                }
                            %>


                        </table>
                    </form>
                </div>
            </div>
        </section>

        <!--Update-->

        <%
            if (request.getParameter("updaterow") != null) {
        %> 
        <section  style="display: flex; justify-content: center; align-items: center; " id="addexpense">
            <div class="wrapper">
                <form action="expenses.jsp" method="POST">
                    <h1>Update Expense <%=request.getParameter("updaterow")%></h1>
                    <div class="input-box">                                                
                        <select name="upexpensecategory" class="styled-select" placeholder="Expensecategory" >

                            <% List<ExpenseCategory> expenseCategoriesDropDown = DbExpense.getExpenseCategoriesByUserId(DbConnector.getConnection(), user.getId());
                                for (ExpenseCategory category : expenseCategoriesDropDown) {
                                    out.println("<option value=\"" + category.getCategoryId() + "\">" + category.getCategoryName() + "</option>");
                                }%>

                        </select>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="number" placeholder="ExpenseAmount" name="upexpenseamount">
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="date" placeholder="Date" name="udate" value="<%= java.time.LocalDate.now()%>">
                        <i class='bx bxs-calendar'></i>
                    </div>
                    <div class="input-box">
                        <textarea placeholder="Description"class="styled-des" name="upexpDescription"></textarea>
                        <i class='bx bxs-pencil'></i>
                    </div>
                    <input type="hidden" name="upexprowid" value="<%=request.getParameter("updaterow")%>">
                    <button type="submit" class="btn" name="upaddExp">Update Expense</button>

                </form>
                <a href="expenses.jsp" ><button class="btn" >Close</button></a>
            </div>
        </section>

        <%
            }
        %>
        <%
            if (request.getParameter("upaddExp") != null) {
                int categoryId = Integer.parseInt(request.getParameter("upexpensecategory"));
                int expenseId = Integer.parseInt(request.getParameter("upexprowid"));
                String categoryName = DbExpense.getExpenseCategoryNameById(DbConnector.getConnection(), categoryId);
                double amount = Double.parseDouble(request.getParameter("upexpenseamount"));
                String description = request.getParameter("upexpDescription");
                Date date = Date.valueOf(request.getParameter("udate"));

                boolean dbExup = DbExpense.updateExpense(DbConnector.getConnection(), expenseId, categoryId, categoryName, amount, description, date);

                if (dbExup) {
                    response.sendRedirect("expenses.jsp?");
                } else {
                    response.sendRedirect("expenses.jsp?status=5");
                }
            }

        %>

        <section  style="display: flex; justify-content: center; align-items: center; " id="addexpense">
            <div class="wrapper">
                <form action="expenses.jsp" method="POST">
                    <h1>Add Expense</h1>
                    <div class="input-box">                                                
                        <select name="expensecategory" class="styled-select"  placeholder="Expensecategory" >

                            <% List<ExpenseCategory> expenseCategoriesDropDown = DbExpense.getExpenseCategoriesByUserId(DbConnector.getConnection(), user.getId());
                                for (ExpenseCategory category : expenseCategoriesDropDown) {
                                    out.println("<option value=\"" + category.getCategoryId() + "\">" + category.getCategoryName() + "</option>");
                                }%>

                        </select>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="number" placeholder="ExpenseAmount" name="expenseamount">
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="date" placeholder="Date" name="date" value="<%= java.time.LocalDate.now()%>">
                        <i class='bx bxs-calendar'></i>
                    </div>
                    <div class="input-box">
                        <textarea placeholder="Description" class="styled-des" name="expDescription"></textarea>
                        <i class='bx bxs-pencil'></i>
                    </div>
                    <button type="submit" class="btn" name="addExp">Add Expense</button>
                </form>
            </div>
        </section>

        <%
            if (request.getParameter("addExp") != null) {
                int categoryId = Integer.parseInt(request.getParameter("expensecategory"));

                String categoryName = DbExpense.getExpenseCategoryNameById(DbConnector.getConnection(), categoryId);
                double amount = Double.parseDouble(request.getParameter("expenseamount"));
                String description = request.getParameter("expDescription");
                Date date = Date.valueOf(request.getParameter("date"));

                boolean dbExAdd = DbExpense.addExpense(DbConnector.getConnection(), user.getId(), categoryId, categoryName, amount, description, date);
                if (dbExAdd) {
                    response.sendRedirect("expenses.jsp");
                } else {
                    response.sendRedirect("expenses.jsp?status=6");
                }
            }
        %>

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