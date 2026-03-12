<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.course.util.DBConnection" %>
<%
    // Cache disable
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Admin session check
    HttpSession session1 = request.getSession(false);
    if (session1 == null || !"admin".equals(session1.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Manage Courses</title>

<style>

*{
    box-sizing:border-box;
    margin:0;
    padding:0;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    padding:40px;
    background:linear-gradient(145deg,#0a1929,#1a2f45);
    color:white;
}

/* Header */

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.header h2{
    font-size:26px;
}

/* Buttons */

.top-buttons{
    display:flex;
    gap:15px;
}

.add-btn,.back-btn{
    padding:10px 22px;
    border-radius:25px;
    text-decoration:none;
    font-weight:600;
    transition:0.3s;
}

.add-btn{
    background:#00c2cb;
    color:#002b30;
}

.back-btn{
    background:rgba(255,255,255,0.15);
    color:white;
}

.add-btn:hover,.back-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 20px rgba(0,0,0,0.4);
}

/* Table container */

.table-container{
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(10px);
    border-radius:20px;
    padding:25px;
    box-shadow:0 20px 40px rgba(0,0,0,0.4);
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    padding:15px;
    text-align:center;
    background:rgba(255,255,255,0.1);
}

td{
    padding:15px;
    text-align:center;
}

tr{
    border-bottom:1px solid rgba(255,255,255,0.1);
}

tr:hover{
    background:rgba(255,255,255,0.05);
}

/* Buttons */

.btn{
    padding:6px 15px;
    border:none;
    border-radius:20px;
    cursor:pointer;
    font-weight:bold;
    margin:3px;
    transition:0.3s;
}

.edit{
    background:#00c2cb;
    color:#002b30;
}

.delete{
    background:#ff4d4d;
    color:white;
}

.btn:hover{
    transform:scale(1.05);
}

/* Empty message */

.empty{
    padding:20px;
    text-align:center;
    opacity:0.7;
}

</style>
</head>

<body>

<div class="header">

<h2>Manage Courses (Admin)</h2>

<div class="top-buttons">
<a href="addcourses.jsp" class="add-btn">+ Add Course</a>
<a href="admindashboard.jsp" class="back-btn">← Dashboard</a>
</div>

</div>


<div class="table-container">

<table>

<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Actions</th>
</tr>

<%

boolean hasData = false;

try{

Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM courses ORDER BY id DESC");

while(rs.next()){
hasData = true;

%>

<tr>

<td><%= rs.getInt("id") %></td>

<td><strong><%= rs.getString("title") %></strong></td>

<td>
<%= rs.getString("description") != null ? rs.getString("description") : "No description" %>
</td>

<td>

<form action="editcourses.jsp" method="get" style="display:inline;">
<input type="hidden" name="id" value="<%= rs.getInt("id") %>">
<input type="submit" value="Edit" class="btn edit">
</form>

<form action="delete" method="post" style="display:inline;"
onsubmit="return confirm('Are you sure you want to delete this course?');">
<input type="hidden" name="id" value="<%= rs.getInt("id") %>">
<input type="submit" value="Delete" class="btn delete">
</form>

</td>

</tr>

<%

}

rs.close();
st.close();
con.close();

}catch(Exception e){
e.printStackTrace();
}

if(!hasData){

%>

<tr>
<td colspan="4" class="empty">No courses available.</td>
</tr>

<%

}

%>

</table>

</div>

</body>
</html>