<%-- 
    Document   : logout
    Created on : 19 Jun 2025, 15.32.40
    Author     : sutantodwiputra
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Hapus session untuk logout
    session.invalidate();
    // Redirect ke halaman login
    response.sendRedirect("login.jsp");
%>
