<%-- 
    Document   : formusertambah.view
    Created on : 14 Jun 2025, 02.52.45
    Author     : sutantodwiputra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a href="home.view.jsp" class="menu-item">
                    <i class="fas fa-th-large"></i>
                    Dashboard
                </a>
                <a href="userlist.jsp" class="menu-item active">
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
                    <h1>Add User</h1>
                    <p>Add new users quickly and easily.</p>
                </div>
<!--                <div class="header-actions">
                    <button class="btn btn-secondary">Import Data</button>
                    <button class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Add Project
                    </button>
                </div>-->
            </div>

                <div class="card">
                <div class="card-content">
                    <form action="usertambah.jsp" method="post" style="max-width: 500px; margin: 50px auto;">
                        <div style="margin-bottom: 12px;">
                            <label for="username">Username:</label><br>
                            <input type="text" id="username" name="username" required
                                style="width: 100%; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
                        </div>
                        <div style="margin-bottom: 12px;">
                            <label for="fullname">Fullname:</label><br>
                            <input type="text" id="fullname" name="fullname" required
                                style="width: 100%; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
                        </div>
                        <div style="margin-bottom: 12px;">
                            <label for="password">Password:</label><br>
                            <input type="password" id="password" name="password" required
                                style="width: 100%; padding: 8px; border-radius: 8px; border: 1px solid #ccc;">
                        </div>
                        <div style="display: flex; gap: 12px; justify-content: flex-start; margin-top: 20px;">
                            <button type="submit" class="btn btn-primary">Tambah</button>
                            <a href="userlist.jsp" class="btn btn-secondary" style="padding: 12px 20px; display: inline-flex; align-items: center; justify-content: center; border-radius: 12px; text-decoration: none;">Batal</a>
                        </div>
                    </form>
                </div>

                </div>


        </div>
    </div>
</body>
</html>