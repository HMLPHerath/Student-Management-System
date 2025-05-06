<%-- 
    Document   : login
    Created on : May 5, 2025, 2:09:35 PM
    Author     : lahir
--%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminLTE | Log in</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --skin-blue: #3c8dbc;
            --skin-blue-dark: #367fa9;
            --google-red: #DB4437;
            --facebook-blue: #4267B2;
            --microsoft-dark: #2F2F2F;
            --microsoft-orange: #F25022;
            --microsoft-green: #7FBA00;
            --microsoft-blue: #00A4EF;
            --light-gray: #f8f9fa;
            --input-border: #ced4da;
        }
        
        body {
            background-color: var(--light-gray);
            height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .login-container {
            max-width: 500px;
            width: 100%;
            margin: 0 auto;
            padding: 20px;
        }
        
        .login-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .login-header {
            background-color: var(--skin-blue);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .login-body {
            padding: 30px;
            background-color: white;
        }
        
        .input-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 4;
            pointer-events: none;
        }
        
        .form-control {
            height: 50px;
            border-radius: 5px;
            font-size: 1rem;
            padding-left: 45px;
            border: 1px solid var(--input-border);
            background-color: transparent;
        }
        
        .form-control:focus {
            border-color: var(--skin-blue);
            box-shadow: 0 0 0 0.25rem rgba(60, 141, 188, 0.25);
        }
        
        .btn-signin {
            background-color: var(--skin-blue);
            border-color: var(--skin-blue-dark);
            color: white;
            height: 50px;
            font-size: 1.1rem;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-signin:hover {
            background-color: var(--skin-blue-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
        
        .login-footer a {
            color: var(--skin-blue);
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .login-footer a:hover {
            color: var(--skin-blue-dark);
            text-decoration: underline;
        }
        
        @media (max-width: 576px) {
            .login-container {
                padding: 15px;
            }
            
            .login-body {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="card login-card">
            <div class="login-header">
                <h3><i class="fas fa-lock me-2"></i>Account Login</h3>
            </div>
            <div class="card-body login-body">
                <form action="${pageContext.request.contextPath}/loginProcess" method="post" required>
                    <div class="input-group">
                        <span class="input-icon">
                            <i class="fas fa-envelope"></i>
                        </span>
                        <input type="email" class="rounded-2 form-control" placeholder="Email address" required>
                    </div>
                    
                    <div class="input-group">
                        <span class="input-icon">
                            <i class="fas fa-lock"></i>
                        </span>
                        <input type="password" class="rounded-2 form-control" placeholder="Password" required>
                    </div>
                    
                    <div class="d-grid mb-4">
                        <button type="submit" class="btn btn-signin">
                            <i class="fas fa-sign-in-alt me-2"></i> Sign In
                        </button>
                    </div>
                    
                    <div class="login-footer">
                        <a href="${pageContext.request.contextPath}/forgot-password"><i class="fas fa-key me-1"></i>Forgot password?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>