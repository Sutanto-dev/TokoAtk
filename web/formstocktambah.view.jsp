<%-- 
    Document   : formstocktambah.view
    Created on : 19 Jun 2025, 14.37.28
    Author     : sutantodwiputra
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Stock Transaction</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
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

        <!-- Main Content -->
        <div class="main-content">
            <!-- Top Bar -->
            <div class="top-bar">
                <div class="search-container">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" placeholder="Search transaction">
                    <span class="search-shortcut">⌘F</span>
                </div>
                <div class="user-section">
                    <div class="user-info">
                        <div class="user-name">${fullname}</div>
                        <div class="user-email">user@email.com</div>
                    </div>
                    <div class="user-avatar">
                        ${fullname.substring(0,2).toUpperCase()}
                    </div>
                </div>
            </div>

            <!-- Header -->
            <div class="header">
                <div>
                    <h1>Add New Stock Transaction</h1>
                    <p><strong>Username:</strong> ${fullname}</p>
                </div>
            </div>

            <div class="card" style="margin-top: 2em;">
                <div class="card-content">
                    <form action="stockdetailtambah.jsp" method="post" style="max-width: 500px;">
                        <input type="hidden" name="stockId" value="${stock.getId()}">

                        <div style="margin-bottom: 12px;">
                            <label for="barangId">Barang ID:</label><br>
                            <input type="text" id="barangId" name="barangId" required
                                style="width: 100%; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
                        </div>

                        <div style="margin-bottom: 12px;">
                            <label for="qty">Quantity:</label><br>
                            <input type="number" id="qty" name="qty" min="1" required
                                style="width: 100%; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
                        </div>

                        <div style="margin-bottom: 12px;">
                            <label for="harga">Harga:</label><br>
                            <input type="number" id="harga" name="harga" min="1" required
                                style="width: 100%; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
                        </div>

                        <div style="display: flex; gap: 12px; margin-top: 20px;">
                            <button type="submit" class="btn btn-primary">Tambah Stock</button>
                            <a href="stocklist.view.jsp" class="btn btn-secondary" style="padding: 12px 20px;">Kembali</a>
                        </div>
                    </form>
                </div>
            </div>

        </div> <!-- end main-content -->
    </div> <!-- end container -->
</body>


</html>
