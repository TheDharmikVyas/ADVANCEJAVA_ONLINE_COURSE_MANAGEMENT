<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 🔒 Cache disable
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String username = (String) session.getAttribute("user");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
}

body{
    height:100vh;
    background:linear-gradient(135deg,#667eea,#764ba2);
    display:flex;
    justify-content:center;
    align-items:center;
    color:#2d3748;
}

.card{
    width:460px;
    padding:50px;
    border-radius:25px;
    background:white;
    box-shadow:0 25px 50px -12px rgba(0,0,0,0.25);
    text-align:center;
    animation:fadeIn 0.7s ease-in-out;
}

.card h1{
    font-size:30px;
    margin-bottom:10px;
    color:#1a202c;
    font-weight:600;
}

.card h1 span{
    color:#667eea;
    -webkit-text-fill-color:#667eea;
    background:none;
}

.card p{
    font-size:14px;
    margin-bottom:35px;
    color:#718096;
}

/* Buttons */
.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:12px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s ease;
    text-decoration:none;
    display:block;
}

.primary{
    background:#667eea;
    color:white;
    box-shadow:0 4px 6px rgba(102,126,234,0.3);
}

.primary:hover{
    background:#5a67d8;
    transform:translateY(-2px);
    box-shadow:0 8px 15px rgba(102,126,234,0.4);
}

.logout{
    margin-top:15px;
    background:#f7fafc;
    color:#4a5568;
    text-decoration:none;
    padding:12px;
    border-radius:12px;
    display:block;
    font-weight:600;
    transition:0.3s;
    border:1px solid #e2e8f0;
}

.logout:hover{
    background:#edf2f7;
    transform:translateY(-2px);
    border-color:#cbd5e0;
}

footer{
    margin-top:30px;
    font-size:12px;
    color:#a0aec0;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}
</style>
</head>

<body>

<div class="card">
    <h1>Welcome, <span><%= username %></span></h1>
    <p>Your learning journey continues here 🚀</p>

    <a href="courses.jsp" class="btn primary">View Available Courses</a>
    <a href="logout" class="logout">Logout</a>

    <footer>
        © 2026 Online Course Management System
    </footer>
</div>

</body>
</html>