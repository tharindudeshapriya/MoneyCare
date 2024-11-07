

<%@page import="classes.MD5"%>
<%@page import="classes.DbConnector"%>
<%@page import="classes.User"%>
<%@page session="true" %>

<%
    String username = request.getParameter("username");
    String password = MD5.getMd5(request.getParameter("password"));

    User user = new User(username, password);
    if (user.authenticate(DbConnector.getConnection())) {
        if(user.getRole().equals("customer")){
        session.setAttribute("user", user);
        response.sendRedirect("logged_user/dashboard.jsp?status=1");
        }else if(user.getRole().equals("admin")){
        session.setAttribute("user", user);
        response.sendRedirect("logged_user/admindashboard.jsp?status=1");
        }
        
    } else {
        response.sendRedirect("login.jsp?status=3");
    }
%>