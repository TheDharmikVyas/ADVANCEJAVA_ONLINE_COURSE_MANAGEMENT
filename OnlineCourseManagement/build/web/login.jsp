<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Enterprise Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            position: relative;
            overflow: hidden;
        }

        /* Animated background elements */
        body::before {
            content: '';
            position: absolute;
            width: 2000px;
            height: 2000px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
            top: -1000px;
            right: -500px;
            transform: rotate(45deg);
            animation: float 20s infinite ease-in-out;
        }

        body::after {
            content: '';
            position: absolute;
            width: 1500px;
            height: 1500px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.08) 0%, rgba(255, 255, 255, 0.03) 100%);
            bottom: -750px;
            left: -300px;
            animation: float 15s infinite ease-in-out reverse;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(45deg); }
            33% { transform: translate(50px, 50px) rotate(45deg); }
            66% { transform: translate(-20px, 20px) rotate(45deg); }
        }

        .container {
            width: 420px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 48px 40px;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            position: relative;
            z-index: 1;
            animation: fadeIn 0.4s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Header Section */
        .header {
            margin-bottom: 32px;
        }

        h2 {
            color: #2d3748;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .divider {
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
        }

        /* Form Sections */
        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            color: #1E293B;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 6px;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            color: #64748B;
            font-size: 16px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 16px 14px 42px;
            border: 1.5px solid #E2E8F0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.2s ease;
            background: #F8FAFC;
        }

        input[type="text"]:hover,
        input[type="password"]:hover {
            border-color: #94A3B8;
            background: #ffffff;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #667eea;
            background: #ffffff;
            outline: none;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }

        /* Role Selection */
        .role-section {
            margin: 28px 0 24px;
        }

        .role-section label {
            color: #1E293B;
            font-size: 14px;
            font-weight: 500;
            display: block;
            margin-bottom: 12px;
        }

        .role-options {
            display: flex;
            gap: 24px;
        }

        .role-option {
            flex: 1;
            position: relative;
        }

        .role-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .role-option label {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px;
            background: #F8FAFC;
            border: 1.5px solid #E2E8F0;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.2s ease;
            margin: 0;
            font-weight: 500;
            color: #475569;
        }

        .role-option label i {
            font-size: 18px;
        }

        .role-option input[type="radio"]:checked + label {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-color: #667eea;
            color: white;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }

        .role-option:hover label {
            border-color: #94A3B8;
            background: #ffffff;
        }

        /* Button */
        .btn-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.5);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        /* Error Message */
        .error-message {
            background: #FEF2F2;
            border-left: 4px solid #DC2626;
            color: #991B1B;
            padding: 14px 16px;
            border-radius: 8px;
            margin: 20px 0;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Footer Links */
        .footer-links {
            margin-top: 24px;
            text-align: center;
            border-top: 1px solid #E2E8F0;
            padding-top: 24px;
        }

        .footer-links a {
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .footer-links a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .footer-links span {
            color: #94A3B8;
            margin: 0 8px;
        }

        /* Forgot password link */
        .forgot-password {
            text-align: right;
            margin-top: 8px;
        }

        .forgot-password a {
            color: #64748B;
            font-size: 13px;
            text-decoration: none;
        }

        .forgot-password a:hover {
            color: #667eea;
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 32px 24px;
                margin: 20px;
            }
            
            .role-options {
                flex-direction: column;
                gap: 12px;
            }
        }

        /* Simple icon font (using text as fallback) */
        .icon {
            font-size: 18px;
            line-height: 1;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2>Login</h2>
            <div class="divider"></div>
        </div>
        
        <form action="login" method="post">
            <!-- Username Field -->
            <div class="form-group">
                <label>Username</label>
                <div class="input-wrapper">
                    <span class="input-icon icon">👤</span>
                    <input type="text" name="username" placeholder="Enter your username" required>
                </div>
            </div>

            <!-- Password Field -->
            <div class="form-group">
                <label>Password</label>
                <div class="input-wrapper">
                    <span class="input-icon icon">🔒</span>
                    <input type="password" name="password" placeholder="Enter your password" required>
                </div>
                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>
            </div>

            <!-- Role Selection -->
            <div class="role-section">
                <label>Select Role</label>
                <div class="role-options">
                    <div class="role-option">
                        <input type="radio" name="role" value="admin" id="role-admin" required>
                        <label for="role-admin">
                            <span class="icon">👑</span>
                            Admin
                        </label>
                    </div>
                    <div class="role-option">
                        <input type="radio" name="role" value="student" id="role-student">
                        <label for="role-student">
                            <span class="icon">📚</span>
                            Student
                        </label>
                    </div>
                </div>
            </div>

            <!-- Error Message -->
            <%
                String error = (String) request.getAttribute("errorMsg");
                if (error != null) {
            %>
                <div class="error-message">
                    <span class="icon">⚠️</span>
                    <span><%= error %></span>
                </div>
            <%
                }
            %>

            <!-- Login Button -->
            <button type="submit" class="btn-login">
                <span class="icon">→</span>
                Sign In
            </button>
        </form>

        <!-- Footer Links -->
        <div class="footer-links">
            <a href="register.jsp">
                <span class="icon">📝</span>
                Create new account
            </a>
        </div>
    </div>
</body>
</html>