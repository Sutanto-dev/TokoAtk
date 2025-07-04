<%-- 
    Document   : stocktambah
    Created on : 19 Jun 2025, 14.38.00
    Author     : sutantodwiputra
--%>

<%@ page import="tokoatk.Sales" %>
<%@ page import="java.util.ArrayList" %>
<%
    String username = request.getParameter("username");
    String barangId = request.getParameter("barangId");
    int qty = Integer.parseInt(request.getParameter("qty"));
    int harga = Integer.parseInt(request.getParameter("harga"));

    Sales sales = new Sales();
    if (sales.tambah(username)) {
        if (sales.addDetail(barangId, qty, harga)) {
            response.sendRedirect("stocklist.jsp");
        } else {
            out.println("Gagal tambah detail transaksi.");
        }
    } else {
        out.println("Gagal tambah transaksi.");
    }
%>

