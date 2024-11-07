<%@page import="classes.Expense.ExpenseCategory"%>
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
        <title> Money Care Expense Category</title>
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
       
        <section  style="display: flex; justify-content: center; align-items: center;" id="allexpensecategory">
            <div class="wrapper">
                <div class="table-wrapper">
                    <form action="expenseCategory.jsp" method="POST">
                        <h1>Available Expense Categories</h1><br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Available Categories</th>
                                    <th>Status</th>
                                    
                                </tr>
                            </thead>                               
                                
                                <% List<ExpenseCategory> expenseCategories = DbExpense.getExpenseCategoriesByUserId(DbConnector.getConnection(),user.getId());
                                for (ExpenseCategory category : expenseCategories) {
                                    out.println("<tr>");
                                    
                                    out.println("<td>" + category.getCategoryName() + "</td>");
                                    out.println("<td>");
                                    out.println("<button type=\"submit\" class=\"btn\" style = \"width: 150px;\" name =\"delcatrow\" value =\"" + category.getCategoryId() + "\">Delete</button>");
                                    out.println("</td>");
                                    out.println("</tr>");
                                }%>
                        </table>       
                        
                    </form>
                </div>             
            </div>
        </section>
        
        <% 
            if (request.getParameter("delcatrow") != null) {

                    int categoryId = Integer.parseInt(request.getParameter("delcatrow"));

                    boolean dbDelExCat = DbExpense.deleteExpenseCategory(DbConnector.getConnection(), categoryId);

                    if (dbDelExCat) {
                        response.sendRedirect("expenseCategory.jsp");
                    } else {
                        response.sendRedirect("expenseCategory.jsp?status=4");
                    }
                }
        %>       
        
        <section  style="display: flex; justify-content: center; align-items: center;" id="allexpensecategory">
            <div class="wrapper">             
                <form action="expenseCategory.jsp" method="POST">
                    <h1>Add Expense Category</h1>
                    <div class="input-box">
                        <input type="text" placeholder="Name for the Category" name="addExCat">
                        <i class='bx bxs-user'></i>
                    </div>
                    <button type="submit" class="btn"name="addexpcat" value="Submit">Add Category</button>
                </form>
            </div>
        </section>

        <% 
            if (request.getParameter("addexpcat") != null) {
                    String categoryName = request.getParameter("addExCat");

                    boolean dbExAdd = DbExpense.addExpenseCategory(DbConnector.getConnection(), user.getId(), categoryName);

                    if (dbExAdd) {
                        response.sendRedirect("expenseCategory.jsp");
                    } else {
                        response.sendRedirect("expenseCategory.jsp?status=5");
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