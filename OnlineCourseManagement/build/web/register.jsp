<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | Enterprise Portal</title>
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
            width: 440px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 48px 40px;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            position: relative;
            z-index: 1;
            animation: slideUp 0.5s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Header Section */
        .header {
            margin-bottom: 32px;
            text-align: left;
        }

        h2 {
            color: #2d3748;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #718096;
            font-size: 14px;
            font-weight: 400;
        }

        .divider {
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
            margin-top: 8px;
        }

        /* Form Sections */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            color: #4a5568;
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
            left: 16px;
            color: #a0aec0;
            font-size: 16px;
            z-index: 1;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 16px 14px 45px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: white;
            color: #2d3748;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #a0aec0;
            font-weight: 400;
        }

        input[type="text"]:hover,
        input[type="password"]:hover {
            border-color: #cbd5e0;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            outline: none;
        }

        /* Role Selection */
        .role-section {
            margin: 28px 0 24px;
            text-align: left;
        }

        .role-section label {
            color: #4a5568;
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
            padding: 14px;
            background: #f7fafc;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.2s ease;
            margin: 0;
            font-weight: 500;
            color: #4a5568;
            font-size: 15px;
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
            border-color: #667eea;
            background: #ebf4ff;
        }

        /* Button */
        .btn-register {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            margin-top: 8px;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.5);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        /* Error Message (if you want to add validation later) */
        .error-message {
            background: #fff5f5;
            border-left: 4px solid #fc8181;
            color: #c53030;
            padding: 12px 16px;
            border-radius: 10px;
            margin: 20px 0;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        /* Footer Links */
        .footer-links {
            margin-top: 24px;
            text-align: center;
            border-top: 1px solid #e2e8f0;
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
            gap: 6px;
        }

        .footer-links a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .footer-links span {
            color: #a0aec0;
            margin: 0 8px;
        }

        /* Terms text */
        .terms-text {
            margin-top: 16px;
            color: #718096;
            font-size: 12px;
            text-align: center;
        }

        .terms-text a {
            color: #667eea;
            text-decoration: none;
            font-size: 12px;
            display: inline;
            padding: 0;
            margin: 0;
        }

        .terms-text a:hover {
            text-decoration: underline;
            background: none;
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
            
            h2 {
                font-size: 24px;
            }
        }

        /* Simple icon font */
        .icon {
            font-size: 18px;
            line-height: 1;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h2>Create Account</h2>
            <div class="subtitle">Join us today</div>
            <div class="divider"></div>
        </div>
        
        <form action="register" method="post">
            <!-- Username Field -->
            <div class="form-group">
                <label>Username</label>
                <div class="input-wrapper">
                    <span class="input-icon icon">👤</span>
                    <input type="text" name="username" placeholder="Choose a username" required>
                </div>
            </div>

            <!-- Password Field -->
            <div class="form-group">
                <label>Password</label>
                <div class="input-wrapper">
                    <span class="input-icon icon">🔒</span>
                    <input type="password" name="password" placeholder="Create a password" required>
                </div>
            </div>

            <!-- Confirm Password Field (optional - you can add this) -->
            <div class="form-group">
                <label>Confirm Password</label>
                <div class="input-wrapper">
                    <span class="input-icon icon">✓</span>
                    <input type="password" name="confirmPassword" placeholder="Re-enter password">
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

            <!-- Register Button -->
            <button type="submit" class="btn-register">
                <span class="icon">📝</span>
                Create Account
            </button>

            <!-- Terms and conditions -->
            <div class="terms-text">
                By registering, you agree to our 
                <a href="#">Terms of Service</a> and 
                <a href="#">Privacy Policy</a>
            </div>
        </form>

        <!-- Footer Links -->
        <div class="footer-links">
            <a href="login.jsp">
                <span class="icon">←</span>
                Back to Login
            </a>
        </div>
    </div>
</body>
</html>