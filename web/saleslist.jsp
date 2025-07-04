<%-- 
    Document   : saleslist
    Created on : 19 Jun 2025, 14.13.59
    Author     : sutantodwiputra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tokoatk.Sales"%>
<%@page import="tokoatk.SalesDetail"%>

<%
    ArrayList<Sales> list = Sales.getList();
    ArrayList<SalesDetail> allDetails = SalesDetail.getAll();

    request.setAttribute("list", list);
    request.setAttribute("allDetails", allDetails);

    RequestDispatcher dispacher = request.getRequestDispatcher("saleslist.view.jsp");
    dispacher.forward(request, response);
%>