<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%
    if(session == null || !"admin".equals(session.getAttribute("role"))){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Add New Course</title>

<style>
/* Modern UI update: Glassmorphism with refined colors and smoother shapes */
body{
    height:100vh;
    background:linear-gradient(145deg,#1a2f3f,#152b3a);
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:'Inter', 'Segoe UI', system-ui, sans-serif;
    margin:0;
    padding:1rem;
}

.container{
    width:440px;
    padding:2.8rem 2.5rem;
    background:rgba(20, 40, 55, 0.65);
    backdrop-filter:blur(16px) saturate(180%);
    -webkit-backdrop-filter:blur(16px) saturate(180%);
    border-radius:36px;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 30px 50px -20px rgba(0,0,0,0.6), 0 0 0 1px rgba(255,255,255,0.02) inset;
    text-align:center;
    color:white;
    transition:transform 0.2s ease;
}

.container:hover{
    transform:scale(1.01);
}

h2{
    margin-bottom:2rem;
    font-weight:500;
    font-size:2rem;
    letter-spacing:-0.5px;
    color:#ffffff;
    text-shadow:0 2px 5px rgba(0,0,0,0.3);
}

/* elegant input style */
input, textarea{
    width:100%;
    padding:14px 20px;
    margin-bottom:22px;
    border-radius:48px;
    border:none;
    outline:none;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(4px);
    border:1px solid rgba(255,255,255,0.1);
    color:white;
    font-size:1rem;
    transition:all 0.2s ease;
    box-sizing:border-box;
    font-family:'Inter', 'Segoe UI', sans-serif;
}

input::placeholder, textarea::placeholder{
    color:rgba(220,240,255,0.6);
    font-weight:300;
    font-size:0.95rem;
}

input:hover, textarea:hover{
    background:rgba(255,255,255,0.12);
    border-color:rgba(255,255,255,0.25);
}

input:focus, textarea:focus{
    background:rgba(255,255,255,0.15);
    border-color:#64e6e6;
    box-shadow:0 0 0 3px rgba(100,230,230,0.2);
}

textarea{
    height:110px;
    border-radius:28px;
    resize:none;
    line-height:1.5;
}

/* refined button */
button{
    width:100%;
    padding:15px 20px;
    border:none;
    border-radius:48px;
    background:#2fc2c2;
    color:#0a1a1a;
    font-weight:600;
    font-size:1.1rem;
    letter-spacing:0.3px;
    cursor:pointer;
    box-shadow:0 8px 20px -8px rgba(0,200,200,0.5);
    transition:all 0.25s ease;
    border:1px solid rgba(255,255,255,0.2);
    margin-top:6px;
}

button:hover{
    background:#40dede;
    transform:translateY(-3px);
    box-shadow:0 16px 25px -10px #2fc2c2;
}

button:active{
    transform:translateY(0);
    box-shadow:0 8px 15px -8px #2fc2c2;
}

/* back link with subtle animation */
a{
    display:inline-block;
    margin-top:28px;
    color:#b0e6ff;
    text-decoration:none;
    font-weight:400;
    font-size:1rem;
    border-bottom:1px dotted rgba(176,230,255,0.4);
    padding-bottom:3px;
    transition:color 0.2s, border-color 0.2s, transform 0.2s;
}

a:hover{
    color:#ffffff;
    border-bottom:1px solid #8fd6ff;
    transform:translateY(-1px);
}

/* subtle glow for container */
.glow-effect{
    position:relative;
    z-index:1;
}

</style>
</head>

<body>

<div class="container">

<h2>✨ Add New Course</h2>

<form action="add" method="post">

    <input type="text" name="title" placeholder="Course Title" required>

    <textarea name="description" placeholder="Course Description" required></textarea>

    <button type="submit">Add Course</button>

</form>

<a href="admincourses.jsp">← Back to Courses</a>

</div>

</body>
</html>