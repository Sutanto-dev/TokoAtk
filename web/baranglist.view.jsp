<%-- 
    Document   : baranglist.view
    Created on : 19 Jun 2025, 13.53.30
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

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
                <a href="userlist.jsp" class="menu-item">
                    <i class="fas fa-users"></i>
                    Users
<!--                    <span class="menu-badge">23</span>-->
                </a>
                <a href="baranglist.jsp" class="menu-item active">
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
                    <h1>List of Item</h1>
                    <p>Manage your inventory with ease.</p>
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
                        <a href="formtambahbarang.jsp" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Tambah Barang
                        </a>
                    </div>
                    <div class="card-content">
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>ID Barang</th>
                                    <th>Nama</th>
                                    <th>Jenis</th>
                                    <th>Harga</th>
                                    <th >Action</th>
                                </tr>
                            </thead>
                                <tbody>
                                    <c:forEach var="b" items="${list}" varStatus="status">
                                       <tr>
                                           <td>${status.index + 1}</td>
                                           <td>${b.id}</td>
                                           <td><span id="nama${b.id}">${b.nama}</span></td>
                                           <td>${b.jenis}</td>
                                           <td>${b.harga}</td>
                                           <td class="action-links">
                                               <button class="btn-edit" onclick="gantiNama('${b.id}')">Edit</button>
                                               <a href="baranghapus.jsp?id=${b.id}" onclick="return confirm('Yakin ingin menghapus?')" class="btn-delete">Delete</a>
                                           </td>
                                       </tr>
                                   </c:forEach>
                                </tbody>
                                
                                
                        </table>
                    </div>
                </div>


        </div>
    </div>
    <script>
       function gantiNama(id) {
           let namabaru = prompt("Edit nama barang?");
           if(namabaru) {
               $.post("api.baranggantinama.jsp", {id:id, namabaru:namabaru}, function(result) {
                   $('#nama'+id).html(namabaru);
               });
           }
       }

       function showStat() {
           $.post("api.barangstat.jsp", function(result) {
               let obj = JSON.parse(result);
               alert("Banyak data: " + obj.banyak + "\nRata-rata: " + obj.rata2);
           });
       }
   </script>
</body>
</html>
    