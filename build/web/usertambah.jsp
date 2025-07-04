<%-- 
    Document   : usertambah
    Created on : 14 Jun 2025, 02.52.11
    Author     : sutantodwiputra
--%>

<%@page import="tokoatk.User"%>
<%
    String username = request.getParameter("username").toString();
    String fullname = request.getParameter("fullname").toString();
    String password = request.getParameter("password").toString();
    
    User user = new User();
    user.username = username;
    user.fullname = fullname;
    user.tambah(password);
    
    response.sendRedirect("userlist.jsp");
%>