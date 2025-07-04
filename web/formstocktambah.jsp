<%-- 
    Document   : formstocktambah
    Created on : 19 Jun 2025, 14.37.06
    Author     : sutantodwiputra
--%>

<%@page import="tokoatk.Stock"%>
<%
    Stock stock = new Stock();
    if(request.getParameter("id") == null) {
        // Buat transaksi stok baru
        String username = request.getParameter("username");
        if (username == null) {
            username = session.getAttribute("fullname") != null ? 
                      session.getAttribute("fullname").toString() : "guest";
        }
        stock.tambah(username);
    } else {
        // Load transaksi existing
        stock.baca(request.getParameter("id"));
    }

    request.setAttribute("stock", stock);
    RequestDispatcher dispatcher = request.getRequestDispatcher("formstocktambah.view.jsp");
    dispatcher.forward(request, response);
%>



