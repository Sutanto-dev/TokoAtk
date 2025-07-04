<%-- 
    Document   : home
    Created on : 14 Jun 2025, 02.50.31
    Author     : sutantodwiputra
--%>

<%
    String fullname = session.getAttribute("fullname").toString();
    
    request.setAttribute("fullname", fullname);
    
    RequestDispatcher dispacher = request.getRequestDispatcher("home.view.jsp");
    dispacher.forward(request, response);
%>