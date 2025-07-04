<%-- 
    Document   : stocklist
    Created on : 19 Jun 2025, 14.36.16
    Author     : sutantodwiputra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tokoatk.Stock"%>
<%
    ArrayList<Stock> list = Stock.getList();
    request.setAttribute("list", list);
    RequestDispatcher dispatcher = request.getRequestDispatcher("stocklist.view.jsp");
    dispatcher.forward(request, response);
%>

