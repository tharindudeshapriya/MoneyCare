<%@page import="java.sql.Date"%>
<%@page import="classes.Income.IncomeCategory"%>
<%@page import="classes.Income.Income"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page import="classes.Income.DbIncome"%>
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
                <td><a href="../Expense/expenses.jsp">Expenses</a></td>
                <td><a href="incomes.jsp">Incomes</a></td>
                <td><a href="../Expense/expenseCategory.jsp">Expense Categories</a></td>
                <td><a href="incomeCategory.jsp">Income Categories</a></td>
            </tr>
        </table>
            </nav>
            <a href="../../sign_out.jsp">
                <button type="button" class="btn btn-primary" style="padding-left: ">Sign Out</button>
            </a>
        </header>

        <section  style="display: flex; justify-content: center; align-items: center;" id="allincomes" >
            <div class="wrapper">
                <h1>Incomes</h1>        
                <div class="table-wrapper">
                    <form action="incomes.jsp" method="POST">
                        <table class="table">
                            <thead>
                                <tr>
                                     <th>Income ID</th>
                                    <th>Income Name</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Description</th>
                                    <th>Delete record</th>
                                </tr>
                            </thead>

                            <% List<Income> incomesRows = DbIncome.getIncomesByUserId(DbConnector.getConnection(), user.getId());
                                for (Income incomerow : incomesRows) {
                                    out.println("<tr>");
                                    out.println("<td>" + incomerow.getIncomeId() + "</td>");
                                    out.println("<td>" + incomerow.getCategoryName() + "</td>");
                                    out.println("<td>" + incomerow.getAmount() + "</td>");
                                    out.println("<td>" + incomerow.getIncomeDate() + "</td>");
                                    out.println("<td>" + incomerow.getDescription() + "</td>");
                                    out.println("<td>");
                                    out.println("<button type=\"submit\" class=\"btn\" style = \"width: 150px;\" name =\"delcatrow\" value =\"" + incomerow.getIncomeId() + "\">Delete</button>");
                                    out.println("<button type=\"submit\" class=\"btn\" style = \"width: 150px;\" name =\"updaterow\" value =\"" + incomerow.getIncomeId() + "\">update</button>");
                                    out.println("</td>");
                                    out.println("</tr>");
                                }%>

                            <%
                                if (request.getParameter("delcatrow") != null) {
                                    int incomeId = Integer.parseInt(request.getParameter("delcatrow"));

                                    boolean delExpRow = DbIncome.deleteIncome(DbConnector.getConnection(), incomeId);
                                    if (delExpRow) {
                                        response.sendRedirect("incomes.jsp");
                                    } else {
                                        response.sendRedirect("incomes.jsp?status=4");
                                    }
                                }
                            %>

                        </table>
                    </form>
                </div>
            </div>
        </section>


        <%
            if (request.getParameter("updaterow") != null) {
        %> 
        <section  style="display: flex; justify-content: center; align-items: center; " id="addincome">
            <div class="wrapper">
                <form action="incomes.jsp" method="POST">
                    <h1>Update Income <%=request.getParameter("updaterow")%></h1>
                    <div class="input-box">                                                
                        <select name="upincomecategory" class="styled-select" placeholder="upincomecategory" >

                            <% List<IncomeCategory> incomeCategoriesDropDown = DbIncome.getIncomeCategoriesByUserId(DbConnector.getConnection(), user.getId());
                                for (IncomeCategory category : incomeCategoriesDropDown) {
                                    out.println("<option value=\"" + category.getCategoryId() + "\">" + category.getCategoryName() + "</option>");
                                }%>

                        </select>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="number" placeholder="IncomeAmount" name="upincomeamount">
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
                    <button type="submit" class="btn" name="upaddExp">Update Income</button>
                </form>
                <a href="incomes.jsp" ><button class="btn" >Close</button></a>
            </div>
        </section>

        <%
            }
        %>
        <%
            if (request.getParameter("upaddExp") != null) {
                int categoryId = Integer.parseInt(request.getParameter("upincomecategory"));
                int incomeId = Integer.parseInt(request.getParameter("upexprowid"));
                String categoryName = DbIncome.getIncomeCategoryNameById(DbConnector.getConnection(), categoryId);
                double amount = Double.parseDouble(request.getParameter("upincomeamount"));
                String description = request.getParameter("upexpDescription");
                Date date = Date.valueOf(request.getParameter("udate"));

                boolean dbExup = DbIncome.updateIncome(DbConnector.getConnection(), incomeId, categoryId, categoryName, amount, description, date);

                if (dbExup) {
                    response.sendRedirect("incomes.jsp");
                } else {
                    response.sendRedirect("incomes.jsp?status=5");
                }
            }

        %>

        <section  style="display: flex; justify-content: center; align-items: center; " id="addincome">
            <div class="wrapper">
                <form action="incomes.jsp" method="POST">
                    <h1>Add Income</h1>
                    <div class="input-box">                                                
                        <select name="incomecategory" class="styled-select" placeholder="Incomecategory" >

                            <% List<IncomeCategory> incomeCategoriesDropDown = DbIncome.getIncomeCategoriesByUserId(DbConnector.getConnection(), user.getId());
                                for (IncomeCategory category : incomeCategoriesDropDown) {
                                    out.println("<option value=\"" + category.getCategoryId() + "\">" + category.getCategoryName() + "</option>");
                                }%>

                        </select>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="number" placeholder="IncomeAmount" name="incomeamount">
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="date" placeholder="Date" name="date" value="<%= java.time.LocalDate.now()%>">
                        <i class='bx bxs-calendar'></i>
                    </div>
                    <div class="input-box">
                        <textarea placeholder="Description"class="styled-des" name="expDescription"></textarea>
                        <i class='bx bxs-pencil'></i>
                    </div>
                    <button type="submit" class="btn" name="addExp">Add Income</button>
                </form>
            </div>
        </section>

        <%
            if (request.getParameter("addExp") != null) {
                int categoryId = Integer.parseInt(request.getParameter("incomecategory"));

                String categoryName = DbIncome.getIncomeCategoryNameById(DbConnector.getConnection(), categoryId);
                double amount = Double.parseDouble(request.getParameter("incomeamount"));
                String description = request.getParameter("expDescription");
                Date date = Date.valueOf(request.getParameter("date"));

                boolean dbExAdd = DbIncome.addIncome(DbConnector.getConnection(), user.getId(), categoryId, categoryName, amount, description, date);
                if (dbExAdd) {
                    response.sendRedirect("incomes.jsp");
                } else {
                    response.sendRedirect("incomes.jsp?status=6");
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