<%-- 
    Document   : stockdetailtambah
    Created on : 21 Jun 2025, 22.21.06
    Author     : sutantodwiputra
--%>

<%@page import="tokoatk.Stock"%>
<%
    String stockId = request.getParameter("stockId").toString();
    String barangId = request.getParameter("barangId").toString();
    Integer qty = Integer.parseInt(request.getParameter("qty"));
    Integer harga = Integer.parseInt(request.getParameter("harga"));
    
    Stock stock = new Stock();
    stock.baca(stockId);
    stock.addDetail(barangId, qty, harga);
    response.sendRedirect("stocklist.view.jsp");
%>

