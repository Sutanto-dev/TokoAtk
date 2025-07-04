<%-- 
    Document   : salesdetailtambah
    Created on : 19 Jun 2025, 14.14.49
    Author     : sutantodwiputra
--%>
<%@page import="tokoatk.Sales"%>
<%
    String salesId = request.getParameter("salesId").toString();
    String barangId = request.getParameter("barangId").toString();
    Integer qty = Integer.parseInt(request.getParameter("qty"));
    Integer harga = Integer.parseInt(request.getParameter("harga"));
    
    Sales sales = new Sales();
    sales.baca(salesId);
    sales.addDetail(barangId, qty, harga);
    response.sendRedirect("formsalestambah.jsp?id="+salesId);

%>