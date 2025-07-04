<%-- 
    Document   : userlist.view
    Created on : 14 Jun 2025, 02.51.51
    Author     : sutantodwiputra
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1>User List</h1>
                    <p>Easily keep track of all users.</p>
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
                    <div class="card-header">
<!--                        <div class="card-title">Daftar Pengguna</div>-->
                        <a href="formusertambah.jsp" class="btn btn-primary">
                            <i class="fas fa-user-plus"></i> Tambah User
                        </a>
                    </div>
                    <div class="card-content">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Full Name</th>
                                    <th>Username</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                                <tbody>
                                    <c:forEach var="user" items="${list}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${user.fullname}</td>
                                            <td>${user.username}</td>
                                         <td class="action-links">
                                            <a href="edituser.jsp?username=${user.username}" class="btn-edit">Edit</a>
                                            <a href="deleteuser.jsp?username=${user.username}" 
                                               onclick="return confirm('Yakin ingin menghapus?')" 
                                               class="btn-delete">Delete</a>
                                        </td>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                                
                                
                        </table>
                    </div>
                </div>


        </div>
    </div>
</body>
</html>