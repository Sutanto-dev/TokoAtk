<%-- 
    Document   : userlist
    Created on : 14 Jun 2025, 02.51.25
    Author     : sutantodwiputra
--%>

<%@page import="tokoatk.User"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<User> list = User.getList();
    
    request.setAttribute("list", list);
    
    RequestDispatcher dispacher = request.getRequestDispatcher("userlist.view.jsp");
    dispacher.forward(request, response);
%>