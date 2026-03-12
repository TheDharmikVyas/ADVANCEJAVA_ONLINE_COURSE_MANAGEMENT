<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="year" value="2026"/>

<!DOCTYPE html>
<html>
<head>
<title>Online Course Management | Learn Smarter</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #fff0f3;  /* Light pink background */
    position: relative;
    overflow: hidden;
}

/* Subtle pattern overlay */
body::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: radial-gradient(#ffb6c1 1px, transparent 1px);
    background-size: 30px 30px;
    opacity: 0.2;
    pointer-events: none;
}

/* Decorative circles */
.circle {
    position: absolute;
    border-radius: 50%;
    background: linear-gradient(135deg, #ff69b4 0%, #ff1493 100%);
    opacity: 0.1;
    pointer-events: none;
}

.circle-1 {
    width: 300px;
    height: 300px;
    top: -150px;
    right: -150px;
}

.circle-2 {
    width: 400px;
    height: 400px;
    bottom: -200px;
    left: -200px;
    background: linear-gradient(135deg, #ffb6c1 0%, #ff69b4 100%);
}

/* Main container */
.container {
    position: relative;
    z-index: 10;
    width: 600px;
    padding: 50px 40px;
    background: white;
    border-radius: 30px;
    box-shadow: 0 20px 40px rgba(255, 105, 180, 0.15), 0 6px 12px rgba(255, 20, 147, 0.1);
    text-align: center;
    animation: slideUp 0.6s ease-out;
    border: 1px solid rgba(255, 182, 193, 0.3);
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Logo/Icon */
.logo-icon {
    font-size: 60px;
    margin-bottom: 20px;
    display: inline-block;
    filter: drop-shadow(0 4px 6px rgba(255, 105, 180, 0.2));
}

.container h1 {
    font-size: 42px;
    font-weight: 700;
    margin-bottom: 5px;
    color: #000000;
    letter-spacing: -0.5px;
    line-height: 1.2;
}

.container h1 span {
    display: block;
}

/* Tagline */
.tagline {
    font-size: 16px;
    color: #ff69b4;
    margin-bottom: 30px;
    font-weight: 400;
    background: rgba(255, 182, 193, 0.1);
    padding: 8px 20px;
    border-radius: 30px;
    display: inline-block;
}

/* Message alert */
.message-alert {
    background: #fff0f3;
    border-left: 4px solid #ff69b4;
    padding: 12px 20px;
    border-radius: 10px;
    margin-bottom: 30px;
    font-size: 15px;
    color: #ff1493;
    text-align: left;
    animation: slideIn 0.5s ease;
    box-shadow: 0 2px 4px rgba(255, 105, 180, 0.1);
}

@keyframes slideIn {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

/* Button group */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin: 35px 0;
}

.btn {
    padding: 15px 40px;
    border: none;
    border-radius: 50px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
    letter-spacing: 0.5px;
    box-shadow: 0 4px 6px rgba(255, 105, 180, 0.2);
}

.login {
    background: linear-gradient(135deg, #ff69b4 0%, #ff1493 100%);
    color: white;
}

.register {
    background: white;
    color: #ff1493;
    border: 2px solid #ff69b4;
}

.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(255, 105, 180, 0.3);
}

.login:hover {
    background: linear-gradient(135deg, #ff1493 0%, #ff69b4 100%);
}

.register:hover {
    background: #fff0f3;
    border-color: #ff1493;
    color: #ff1493;
}

.btn:active {
    transform: translateY(0);
}

/* Features section */
.features {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 30px 0;
    padding: 20px 0;
    border-top: 1px solid #ffb6c1;
    border-bottom: 1px solid #ffb6c1;
}

.feature-item {
    text-align: center;
}

.feature-icon {
    font-size: 24px;
    display: block;
    margin-bottom: 8px;
}

.feature-text {
    font-size: 13px;
    color: #ff1493;
    font-weight: 500;
}

/* Footer */
.footer {
    margin-top: 20px;
    font-size: 14px;
    color: #ff69b4;
}

.copyright {
    display: inline-block;
    padding: 8px 20px;
    background: #fff0f3;
    border-radius: 30px;
    color: #ff1493;
    font-weight: 400;
    border: 1px solid #ffb6c1;
}

/* Link styling */
a {
    color: #ff1493;
    text-decoration: none;
    transition: color 0.2s ease;
}

a:hover {
    color: #ff69b4;
    text-decoration: underline;
}

/* Responsive design */
@media (max-width: 768px) {
    .container {
        width: 90%;
        padding: 30px 20px;
        margin: 20px;
    }
    
    .container h1 {
        font-size: 32px;
    }
    
    .btn-group {
        flex-direction: column;
        gap: 15px;
    }
    
    .btn {
        width: 100%;
    }
    
    .features {
        flex-wrap: wrap;
        gap: 15px;
    }
}

/* Accent line */
.accent-line {
    width: 60px;
    height: 4px;
    background: linear-gradient(90deg, #ff69b4, #ff1493);
    margin: 10px auto 20px;
    border-radius: 2px;
}

/* Heading split styling */
.heading-split {
    display: flex;
    flex-direction: column;
    gap: 0;
}

.heading-split .line1 {
    font-size: 42px;
    font-weight: 700;
    color: #000000;
}

.heading-split .line2 {
    font-size: 42px;
    font-weight: 700;
    color: #000000;
    margin-top: -5px;
}
</style>
</head>

<body>
    <!-- Decorative circles -->
    <div class="circle circle-1"></div>
    <div class="circle circle-2"></div>

    <div class="container">
        <div class="logo-icon">📚</div>
        <h1>
            <span>Online Course</span>
            <span>Management</span>
        </h1>
        <div class="accent-line"></div>
        <div class="tagline">Empower your learning journey with smart technology</div>

        <!-- JSTL Example -->
        <c:if test="${not empty param.msg}">
            <div class="message-alert">
                ✨ <c:out value="${param.msg}"/>
            </div>
        </c:if>

        <div class="btn-group">
            <a href="login.jsp" class="btn login">🔐 Login</a>
            <a href="register.jsp" class="btn register">📝 Register</a>
        </div>

        <!-- Feature highlights -->
        <div class="features">
            <div class="feature-item">
                <span class="feature-icon">🎓</span>
                <span class="feature-text">Expert Mentors</span>
            </div>
            <div class="feature-item">
                <span class="feature-icon">⏰</span>
                <span class="feature-text">Learn Anytime</span>
            </div>
            <div class="feature-item">
                <span class="feature-icon">🏆</span>
                <span class="feature-text">Certification</span>
            </div>
        </div>

        <div class="footer">
            <span class="copyright">
                © <c:out value="${year}"/> Online Course Platform. All rights reserved.
            </span>
        </div>
    </div>
</body>
</html>