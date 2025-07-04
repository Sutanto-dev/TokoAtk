<%-- 
    Document   : index
    Created on : 14 Jun 2025, 02.48.39
    Author     : sutantodwiputra
--%>

<%
    if(session.getAttribute("fullname")==null) {
        response.sendRedirect("formlogin.jsp");
    } else {
        response.sendRedirect("home.jsp");
    }
%>