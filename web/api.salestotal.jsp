<%-- 
    Document   : api.salestotal
    Created on : 21 Jun 2025, 22.38.45
    Author     : sutantodwiputra
--%>

<%@ page import="java.sql.*" %>
<%@ page import="tokoatk.DbConnection" %>
<%@ page contentType="application/json" pageEncoding="UTF-8" %>

<%
    String salesId = request.getParameter("id_sales");
    int total = 0;

    try (Connection conn = DbConnection.connect();
         PreparedStatement ps = conn.prepareStatement("SELECT qty, harga FROM salesd WHERE salesId = ?")) {

        ps.setString(1, salesId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int qty = rs.getInt("qty");
            int harga = rs.getInt("harga");
            total += qty * harga;
        }

        out.print("{\"total\": " + total + "}");

    } catch (Exception e) {
        e.printStackTrace();
        out.print("{\"error\": \"Terjadi kesalahan\"}");
    }
%>
