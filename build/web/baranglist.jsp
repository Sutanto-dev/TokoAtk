<%-- 
    Document   : baranglist
    Created on : 19 Jun 2025, 13.52.54
    Author     : sutantodwiputra
--%>

<%@ page import="tokoatk.Barang" %>
<%@ page import="java.util.ArrayList" %>
<%
    Barang barang = new Barang();
    ArrayList<Barang> list = barang.getList();
    request.setAttribute("list", list);
    request.getRequestDispatcher("baranglist.view.jsp").forward(request, response);
%>
