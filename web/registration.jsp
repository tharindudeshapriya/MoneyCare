<%-- 
    Document   : registration
    Created on : Jul 30, 2023, 4:34:57 AM
    Author     : HP
--%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page import="classes.MD5"%>
<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String conpassword = request.getParameter("conpassword");
    String role = "customer";
    if (password.equals(conpassword)) {
        String hashPassword = MD5.getMd5(password);
        User user = new User(firstname, lastname, username, hashPassword, role);
        if (user.register(DbConnector.getConnection())) {
            response.sendRedirect("sign_up.jsp?status=1");
        } else {
            response.sendRedirect("sign_up.jsp?status=0");
        }
    } else {
        response.sendRedirect("sign_up.jsp?status=2");
    }
%>