<%-- 
    Document   : formsalestambah
    Created on : 19 Jun 2025, 14.12.37
    Author     : sutantodwiputra
--%>

<%@page import="tokoatk.Sales"%>
<%
    String id;
    Sales sales = new Sales();
    if(request.getParameter("id")==null) {
        sales.tambah(session.getAttribute("fullname").toString());
    } else {
        sales.baca(request.getParameter("id"));
    }
    
    request.setAttribute("sales", sales);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("formsalestambah.view.jsp");
    dispatcher.forward(request, response);
%>