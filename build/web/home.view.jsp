<%-- 
    Document   : home.view
    Created on : 14 Jun 2025, 02.50.54
    Author     : sutantodwiputra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tokoatk.DashboardData" %>
<%
    int totalBarang = DashboardData.getTotalBarang();
    int totalTransaksi = DashboardData.getTotalTransaksi();
    int totalPendapatan = DashboardData.getTotalPendapatan();
    int totalUser = DashboardData.getTotalUser();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css"/>
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
                <a href="#" class="menu-item active">
                    <i class="fas fa-th-large"></i>
                    Dashboard
                </a>
                <a href="userlist.jsp" class="menu-item">
                    <i class="fas fa-users"></i>
                    Users
<!--                    <span class="menu-badge">23</span>-->
                </a>
                <a href="baranglist.jsp" class="menu-item">
                    <i class="fas fa-box"></i>
                    Barang
                </a>
                <a href="saleslist.jsp" class="menu-item">
                    <i class="fas fa-receipt"></i>
                    Sales
                </a>
                <a href="stocklist.jsp" class="menu-item">
                    <i class="fas fa-cubes"></i>
                    Stock
                </a>
            </div>
            
            <div class="menu-section">
                <div class="menu-label">General</div>
                <a href="#" class="menu-item">
                    <i class="fas fa-cog"></i>
                    Settings
                </a>
                <a href="#" class="menu-item">
                    <i class="fas fa-question-circle"></i>
                    Help
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
                    <h1>Dashboard</h1>
                    <p>Plan, prioritize, and accomplish your tasks with ease.</p>
                </div>
                <div class="header-actions">
                    <button class="btn btn-secondary">Import Data</button>
                      <a href="formsalestambah.jsp" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Transaksi Baru
                        </a>
                </div>
            </div>

            <div class="stats-grid">
                <div class="stat-card primary">
                    <div class="stat-card-header">
                        <h3>Total Barang</h3>
                        <div class="stat-arrow">
                            <i class="fas fa-arrow-up"></i>
                        </div>
                    </div>
                    <div class="stat-value"><%= totalBarang %></div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        Increased from last month
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <h3>Total Transaksi</h3>
                        <div class="stat-arrow">
                            <i class="fas fa-arrow-up"></i>
                        </div>
                    </div>
                    <div class="stat-value"><%= totalTransaksi %></div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        Increased from last month
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <h3>Total Pendapatan</h3>
                        <div class="stat-arrow">
                            <i class="fas fa-arrow-up"></i>
                        </div>
                    </div>
                    <div class="stat-value"><%= String.format("%,d", totalPendapatan) %></div>
                    <div class="stat-change">
                        <i class="fas fa-arrow-up"></i>
                        Increased from last month
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-card-header">
                        <h3>Total User</h3>
                        <div class="stat-arrow">
                            <i class="fas fa-arrow-up"></i>
                        </div>
                    </div>
                    <div class="stat-value"><%= totalUser %></div>
                    <div class="stat-change">On Discuss</div>
                </div>
            </div>


        </div>
    </div>
</body>
</html>