<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.course.util.DBConnection" %>
<%
    // Session check
    String username = (String) session.getAttribute("user");
    if(username == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Available Courses</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    padding:50px;
    background:linear-gradient(135deg,#667eea,#764ba2);
    color:#2d3748;
}

/* Header */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:50px;
}

.header h2{
    font-size:34px;
    color:#000000;
    font-weight:700;
    background:none;
    -webkit-text-fill-color:#000000;
    text-shadow:2px 2px 4px rgba(255,255,255,0.3);
}

.back-btn{
    padding:10px 25px;
    border-radius:12px;
    background:white;
    color:#667eea;
    font-weight:600;
    text-decoration:none;
    transition:0.3s;
    box-shadow:0 4px 6px rgba(0,0,0,0.1);
}

.back-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 8px 15px rgba(0,0,0,0.2);
    background:#f7fafc;
}

/* Grid */
.course-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:30px;
}

/* Card */
.course-card{
    background:white;
    border-radius:16px;
    padding:30px;
    transition:0.3s;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    position:relative;
    overflow:hidden;
}

.course-card:hover{
    transform:translateY(-5px);
    box-shadow:0 20px 35px rgba(0,0,0,0.15);
}

.course-card h3{
    font-size:20px;
    margin-bottom:15px;
    color:#1a202c;
    font-weight:600;
}

.course-card p{
    font-size:14px;
    color:#718096;
    margin-bottom:25px;
    min-height:40px;
    line-height:1.5;
}

/* Button */
.enroll-btn{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#667eea;
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    box-shadow:0 4px 6px rgba(102,126,234,0.2);
}

.enroll-btn:hover{
    background:#5a67d8;
    transform:translateY(-2px);
    box-shadow:0 8px 15px rgba(102,126,234,0.3);
}

.enrolled{
    width:100%;
    padding:12px;
    border-radius:10px;
    background:#f0f4f8;
    color:#4a5568;
    text-align:center;
    font-weight:600;
    border:1px solid #e2e8f0;
}
</style>
</head>

<body>

<div class="header">
    <h2>Explore Courses 🚀</h2>
    <a href="dashboard.jsp" class="back-btn">← Dashboard</a>
</div>

<div class="course-grid">

<%
    Connection con = null;
    PreparedStatement checkPs = null;
    ResultSet rs = null;

    try{
        con = DBConnection.getConnection();
        Statement st = con.createStatement();
        rs = st.executeQuery("SELECT * FROM courses");

        while(rs.next()){

            int courseId = rs.getInt("id");
            String title = rs.getString("title");
            String description = rs.getString("description");

            // Check enrollment
            checkPs = con.prepareStatement(
                "SELECT * FROM enrollments WHERE student_username=? AND course_id=?"
            );
            checkPs.setString(1, username);
            checkPs.setInt(2, courseId);

            ResultSet checkRs = checkPs.executeQuery();
            boolean enrolled = checkRs.next();
            checkRs.close();
%>

    <div class="course-card">
        <h3><%= title %></h3>
        <p><%= description %></p>

        <% if(enrolled){ %>
            <div class="enrolled">✓ Enrolled</div>
        <% } else { %>
            <form action="Enroll" method="post">
                <input type="hidden" name="courseId" value="<%= courseId %>">
                <input type="hidden" name="courseName" value="<%= title %>">
                <button class="enroll-btn">Enroll Now</button>
            </form>
        <% } %>

    </div>

<%
        }

        rs.close();
        checkPs.close();
        con.close();

    } catch(Exception e){
        e.printStackTrace();
    }
%>

</div>

</body>
</html>