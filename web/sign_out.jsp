<%-- 
    Document   : sign_out
    Created on : Aug 6, 2023, 9:55:49 AM
    Author     : Tharindu Deshapriya
--%>

<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
