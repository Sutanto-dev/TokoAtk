<%-- 
    Document   : api.barangstat
    Created on : 21 Jun 2025, 22.34.25
    Author     : sutantodwiputra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tokoatk.Barang"%>
<%
    Barang b = new Barang(); // 
    ArrayList<Barang> list = b.getList(); 

    int banyak = list.size();
    int total = 0;
    double rata2 = 0.0;

    for (Barang barang : list) {
        total += barang.getHarga();
    }

    if (banyak > 0) {
        rata2 = (double) total / banyak;
    }

    out.print("{ \"banyak\": " + banyak + ", \"rata2\": " + rata2 + " }");
%>
