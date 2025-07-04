<%-- 
    Document   : stockdetail
    Created on : 26 Jun 2025, 08.32.13
    Author     : sutantodwiputra
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tokoatk.Stock"%>
<%@page import="tokoatk.StockDetail"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String stockId = request.getParameter("id");
    Stock stock = new Stock();
    stock.baca(stockId);

    ArrayList<StockDetail> details = stock.getDetail();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Detail Stock - <%= stockId %></title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Manrope', sans-serif;
            background-color: #fff;
            color: #000;
            margin: 20px;
        }
        .container {
            max-width: 700px;
            margin: auto;
            padding: 25px 30px;
            border: 1px solid #000;
            border-radius: 10px;
        }
        h2 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 25px;
        }
        p {
            font-weight: 500;
            margin: 6px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border: 1px solid #000;
        }
        thead tr {
            background-color: #000;
            color: #fff;
        }
        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
            font-weight: 500;
        }
        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tfoot td {
            font-weight: 700;
            background-color: #000;
            color: #fff;
        }
        .btn-back {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            border: 2px solid #000;
            color: #000;
            text-decoration: none;
            font-weight: 700;
            border-radius: 8px;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-back:hover {
            background-color: #000;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Struk Transaksi Stock</h2>
        <p><strong>ID Transaksi:</strong> <%= stock.getId() %></p>
        <p><strong>Username:</strong> <%= stock.getUsername() %></p>
        <p><strong>Waktu:</strong> <%= (stock.getWaktu() != null) ? stock.getWaktu().toString() : "-" %></p>

        <table>
            <thead>
                <tr>
                    <th>ID Detail</th>
                    <th>Barang ID</th>
                    <th>Nama Barang</th>
                    <th>Qty</th>
                    <th>Harga</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int grandTotal = 0;
                    for (StockDetail d : details) {
                        int total = d.getQty() * d.getHarga();
                        grandTotal += total;
                %>
                <tr>
                    <td><%= d.getId() %></td>
                    <td><%= d.getBarangId() %></td>
                    <td><%= d.getBarangNama() %></td>
                    <td><%= d.getQty() %></td>
                    <td>Rp <%= String.format("%,d", d.getHarga()) %></td>
                    <td>Rp <%= String.format("%,d", total) %></td>
                </tr>
                <% } %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" style="text-align: right;">Grand Total</td>
                    <td>Rp <%= String.format("%,d", grandTotal) %></td>
                </tr>
            </tfoot>
        </table>

        <a href="stocklist.jsp" class="btn-back">Kembali ke Daftar Stock</a>
    </div>
</body>
</html>

