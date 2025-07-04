<%-- 
    Document   : api.baranggantinama
    Created on : 21 Jun 2025, 22.34.00
    Author     : sutantodwiputra
--%>

<%@page import="tokoatk.Barang"%>
<%
    String id = request.getParameter("id");
    String namabaru = request.getParameter("namabaru");

    Barang barang = new Barang();
    if (barang.baca(id)) {
        barang.setNama(namabaru);
        if (barang.update()) {
            out.print("ok");
        } else {
            out.print("fail");
        }
    } else {
        out.print("data not found");
    }
%>
