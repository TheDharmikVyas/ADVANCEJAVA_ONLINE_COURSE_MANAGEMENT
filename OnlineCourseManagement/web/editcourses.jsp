<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.course.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Course</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    min-height: 100vh;
    background: linear-gradient(145deg, #0f172a 0%, #1e293b 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Inter', 'Segoe UI', sans-serif;
    padding: 20px;
}

.container {
    width: 480px;
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 32px;
    padding: 48px 40px;
    box-shadow: 0 30px 60px rgba(0, 0, 0, 0.5);
}

.container h2 {
    font-size: 32px;
    font-weight: 600;
    margin-bottom: 32px;
    background: linear-gradient(135deg, #fff 0%, #94a3b8 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    letter-spacing: -0.5px;
}

.input-group {
    margin-bottom: 24px;
    text-align: left;
}

.input-group label {
    display: block;
    font-size: 14px;
    font-weight: 500;
    color: #94a3b8;
    margin-bottom: 8px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

input, textarea {
    width: 100%;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 16px;
    color: white;
    font-size: 16px;
    font-family: inherit;
    transition: all 0.3s ease;
}

input:hover, textarea:hover {
    background: rgba(255, 255, 255, 0.05);
    border-color: rgba(255, 255, 255, 0.2);
}

input:focus, textarea:focus {
    outline: none;
    border-color: #3b82f6;
    background: rgba(59, 130, 246, 0.05);
    box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
}

textarea {
    min-height: 120px;
    resize: vertical;
    line-height: 1.5;
}

button {
    width: 100%;
    padding: 16px 24px;
    background: linear-gradient(145deg, #3b82f6, #2563eb);
    border: none;
    border-radius: 16px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 0.5px;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 16px;
    box-shadow: 0 10px 20px rgba(37, 99, 235, 0.3);
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 15px 30px rgba(37, 99, 235, 0.4);
    background: linear-gradient(145deg, #2563eb, #1d4ed8);
}

button:active {
    transform: translateY(0);
}

/* Custom placeholder styling */
input::placeholder, textarea::placeholder {
    color: rgba(255, 255, 255, 0.3);
}

/* Success message styling (if needed) */
.success-message {
    background: rgba(34, 197, 94, 0.1);
    border: 1px solid rgba(34, 197, 94, 0.2);
    border-radius: 12px;
    padding: 12px;
    margin-bottom: 20px;
    color: #4ade80;
    font-size: 14px;
}

/* Error message styling (if needed) */
.error-message {
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.2);
    border-radius: 12px;
    padding: 12px;
    margin-bottom: 20px;
    color: #f87171;
    font-size: 14px;
}
</style>
</head>

<body>

<div class="container">

<h2>✎ Edit Course</h2>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM courses WHERE id=?"
    );
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if(rs.next()){
%>

<form action="update" method="post">

    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
    
    <div class="input-group">
        <label>Course Title</label>
        <input type="text" name="title"
               value="<%= rs.getString("title") %>" 
               placeholder="Enter course title" required>
    </div>

    <div class="input-group">
        <label>Course Description</label>
        <textarea name="description" placeholder="Enter course description" required><%= rs.getString("description").trim() %></textarea>
    </div>

    <button type="submit">Update Course</button>

</form>

<% } else { %>
    <div class="error-message">
        ⚠ Course not found
    </div>
<% } %>

</div>

</body>
</html>