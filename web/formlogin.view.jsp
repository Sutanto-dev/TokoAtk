<%-- 
    Document   : formlogin.view
    Created on : 14 Jun 2025, 02.49.44
    Author     : sutantodwiputra
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login - Donezo</title>
  <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600&display=swap" rel="stylesheet" />
  <style>
    * {
      margin: 0; padding: 0; box-sizing: border-box;
      font-family: 'Manrope', sans-serif;
    }
    body {
      background: #f1f5f9;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    .card {
      display: flex;
      width: 860px;
      max-width: 100%;
      background: white;
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 20px 40px rgba(0,0,0,0.1);
    }
    .image-section {
      position: relative;
      flex: 1;
      background: url('https://images.unsplash.com/photo-1568301856220-8d0dc08a6d48?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') center/cover no-repeat;
    }
    .image-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(19,69,45,0.85), rgba(34,125,83,0.7));
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 20px;
      color: white;
    }
    .image-overlay h1 {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 12px;
    }
    .image-overlay p {
      font-size: 14px;
      max-width: 260px;
      line-height: 1.5;
    }

    .login-form {
      flex: 1;
      padding: 40px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .login-form h2 {
      font-size: 30px;
      font-weight: 700;
      color: #13452d;
      margin-bottom: 10px;
    }
    .login-form p {
      color: #64748b;
      font-size: 14px;
      margin-bottom: 28px;
    }
    form {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }
    input {
      padding: 12px 14px;
      border: 1.5px solid #cbd5e1;
      border-radius: 10px;
      font-size: 15px;
    }
    input:focus {
      outline: none;
      border-color: #227d53;
      box-shadow: 0 0 6px rgba(34, 125, 83, 0.3);
    }
    button {
      padding: 12px;
      border: none;
      border-radius: 10px;
      background: linear-gradient(135deg, #13452d, #227d53);
      color: white;
      font-weight: 600;
      font-size: 15px;
      cursor: pointer;
    }
    button:hover {
      filter: brightness(1.1);
    }
    .register {
      margin-top: 18px;
      font-size: 14px;
      text-align: center;
      color: #64748b;
    }
    .register a {
      color: #13452d;
      font-weight: 600;
      text-decoration: none;
    }
    .register a:hover {
      text-decoration: underline;
    }

    @media (max-width: 768px) {
      .card {
        flex-direction: column;
      }
      .image-section {
        height: 200px;
      }
      .login-form {
        padding: 24px;
      }
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="image-section">
      <div class="image-overlay">
        <h1>Donezo</h1>
        <p>Plan, prioritize, and accomplish your tasks with ease.</p>
      </div>
    </div>
    <div class="login-form">
      <h2>Welcome Back</h2>
      <p>Please login to continue</p>
      <form action="login.jsp" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Login</button>
      </form>
      <div class="register">
        Don't have an account? <a href="register.jsp">Register</a>
      </div>
    </div>
  </div>
</body>
</html>
