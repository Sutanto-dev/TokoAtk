<%-- 
    Document   : stockdetail
    Created on : 19 Jun 2025
    Author     : sutantodwiputra
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Stock List</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo">
                <div class="logo-icon">
                    <img src="assets/logo-atk.png" alt="logo"/>
                </div>
                <div class="logo-text">Stationera</div>
            </div>
            <div class="menu-section">
                <div class="menu-label">Menu</div>
                <a href="home.view.jsp" class="menu-item">
                    <i class="fas fa-th-large"></i> Dashboard
                </a>
                <a href="userlist.jsp" class="menu-item">
                    <i class="fas fa-users"></i> Users
                </a>
                <a href="baranglist.jsp" class="menu-item">
                    <i class="fas fa-box"></i> Barang
                </a>
                <a href="saleslist.jsp" class="menu-item">
                    <i class="fas fa-receipt"></i> Sales
                </a>
                <a href="stocklist.jsp" class="menu-item active">
                    <i class="fas fa-cubes"></i> Stock
                </a>
            </div>
            <div class="menu-section">
                <div class="menu-label">General</div>
                <a href="#" class="menu-item">
                    <i class="fas fa-cog"></i> Settings
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-question-circle"></i> Help
                </a>
                <a href="logout.jsp" class="menu-item" onclick="return confirm('Yakin ingin logout?')">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>

            </div>
        </div>

        <div class="main-content">
            <div class="top-bar">
                <div class="logo" style="display: none;"></div>
                <div class="search-container">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" placeholder="Search task">
                    <span class="search-shortcut">⌘F</span>
                </div>
                <div class="user-section">
                    <div class="notification-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="notification-icon">
                        <i class="fas fa-bell"></i>
                    </div>
                    <div class="user-info">
                        <div class="user-details">
                            <div class="user-name">${fullname}</div>
                            <div class="user-email">user@email.com</div>
                        </div>
                        <div class="user-avatar">
                            ${fullname.substring(0,2).toUpperCase()}
                        </div>
                    </div>
                </div>
            </div>

            <div class="header">
                <div>
                    <h1>Stock Transactions</h1>
                    <p>Monitor all stock entries and updates with ease.</p>
                </div>
            </div>

            <div class="card" style="margin-top: 2em;">
                <div class="card-header">
                    <a href="formstocktambah.jsp" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Transaksi Baru
                    </a>
                </div>
                <div class="card-content">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Transaction</th>
                                <th>Username</th>
                                <th>Timestamp</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list}">
                                    <c:forEach var="stock" items="${list}">
                                        <tr>
                                            <td>${stock.getId()}</td>
                                            <td>${stock.getUsername()}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty stock.getWaktu()}">
                                                        ${stock.getWaktu()}
                                                    </c:when>
                                                    <c:otherwise>-</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="formstocktambah.jsp?id=${stock.getId()}" class="btn-edit">Edit</a>
                                                <a href="stockdetail.jsp?id=${stock.getId()}" class="btn btn-primary">Detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align: center;">No stock transactions found.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
