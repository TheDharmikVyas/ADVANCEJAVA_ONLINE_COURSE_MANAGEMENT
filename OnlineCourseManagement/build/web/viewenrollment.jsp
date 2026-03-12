<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.course.util.DBConnection" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || !"admin".equals(session1.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Enrollments</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 25px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
        }

        .header h2 {
            color: #333;
            font-size: 24px;
        }

        .back-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #45a049;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-box {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 20px;
            text-align: center;
        }

        .stat-box h3 {
            color: #6c757d;
            font-size: 14px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .stat-box p {
            color: #28a745;
            font-size: 28px;
            font-weight: bold;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        th {
            background-color: #343a40;
            color: white;
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #dee2e6;
            color: #333;
            font-size: 14px;
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .empty-message {
            text-align: center;
            padding: 40px !important;
            color: #6c757d;
            font-style: italic;
        }

        @media (max-width: 768px) {
            .stats-container {
                grid-template-columns: 1fr;
            }
            
            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>📋 Enrollment List</h2>
            <a href="admindashboard.jsp" class="back-btn">← Back to Dashboard</a>
        </div>

        <!-- Stats Cards -->
        <%
            int totalEnrollments = 0;
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT COUNT(*) as total FROM enrollments");
                if(rs.next()) {
                    totalEnrollments = rs.getInt("total");
                }
                rs.close();
                st.close();
                con.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        %> 
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Student Username</th>
                        <th>Course Name</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        boolean hasData = false;
                        int count = 1;

                        try {
                            Connection con = DBConnection.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM enrollments ORDER BY id");

                            while(rs.next()){
                                hasData = true;
                    %>
                    <tr>
                        <td><strong><%= count++ %></strong></td>
                        <td><%= rs.getString("student_username") %></td>
                        <td><%= rs.getString("course_name") %></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            st.close();
                            con.close();
                        } catch(Exception e){
                            e.printStackTrace();
                        }

                        if(!hasData){
                    %>
                    <tr>
                        <td colspan="3" class="empty-message">No enrollments found in the system</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>