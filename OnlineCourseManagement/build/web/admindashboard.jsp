<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.course.util.DBConnection" %>

<%
    // 🔒 Cache Disable
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // 🔐 Session Check
    HttpSession session1 = request.getSession(false);
    if (session1 == null || !"admin".equals(session1.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalCourses = 0;
    int totalStudents = 0;
    int totalEnrollments = 0;

    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();

        // Total Courses
        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM courses");
        if (rs1.next()) {
            totalCourses = rs1.getInt(1);
        }
        rs1.close();

        // Total Students
        ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM users WHERE role='student'");
        if (rs2.next()) {
            totalStudents = rs2.getInt(1);
        }
        rs2.close();

        // Total Enrollments
        ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM enrollments");
        if (rs3.next()) {
            totalEnrollments = rs3.getInt(1);
        }
        rs3.close();

        st.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Course Management</title>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background: #f4f7fc;
            color: #1e293b;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: linear-gradient(180deg, #1e293b 0%, #0f172a 100%);
            padding: 2rem 1.5rem;
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
        }

        .sidebar-header {
            margin-bottom: 2.5rem;
            text-align: center;
        }

        .sidebar-header h2 {
            color: #fff;
            font-weight: 600;
            font-size: 1.8rem;
            letter-spacing: 0.5px;
        }

        .sidebar-header span {
            color: #3b82f6;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            flex: 1;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.875rem 1.2rem;
            color: #94a3b8;
            text-decoration: none;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .nav-link i {
            width: 24px;
            font-size: 1.2rem;
        }

        .nav-link:hover {
            background: rgba(59, 130, 246, 0.1);
            color: #fff;
            transform: translateX(5px);
        }

        .nav-link.active {
            background: #3b82f6;
            color: #fff;
            box-shadow: 0 8px 16px rgba(59, 130, 246, 0.3);
        }

        .logout {
            margin-top: auto;
            background: rgba(239, 68, 68, 0.1);
            color: #f87171;
        }

        .logout:hover {
            background: #ef4444 !important;
            color: #fff !important;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
            background: #f4f7fc;
        }

        /* Top Bar */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
            background: #fff;
            padding: 1rem 2rem;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .page-title {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .page-title h1 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1e293b;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-badge {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            background: #f8fafc;
            padding: 0.5rem 1.2rem;
            border-radius: 40px;
            border: 1px solid #e2e8f0;
        }

        .user-badge i {
            color: #3b82f6;
            font-size: 1.2rem;
        }

        .user-badge span {
            font-weight: 600;
            color: #1e293b;
        }

        .role-tag {
            background: #3b82f6;
            color: #fff !important;
            padding: 0.25rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background: #fff;
            padding: 2rem;
            border-radius: 24px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .stat-info h3 {
            color: #64748b;
            font-size: 1rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            color: #1e293b;
            line-height: 1;
        }

        .stat-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stat-icon i {
            font-size: 2rem;
            color: #fff;
        }

        .stat-card:nth-child(1) .stat-icon {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
        }

        .stat-card:nth-child(2) .stat-icon {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
        }

        .stat-card:nth-child(3) .stat-icon {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
        }

        /* Recent Activity Section */
        .recent-section {
            background: #fff;
            border-radius: 24px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .section-header h2 {
            font-size: 1.4rem;
            font-weight: 600;
            color: #1e293b;
        }

        .view-all {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .activity-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .activity-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: #f8fafc;
            border-radius: 16px;
            transition: background 0.3s ease;
        }

        .activity-item:hover {
            background: #f1f5f9;
        }

        .activity-icon {
            width: 45px;
            height: 45px;
            background: #e0f2fe;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #0284c7;
        }

        .activity-details {
            flex: 1;
        }

        .activity-title {
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.25rem;
        }

        .activity-time {
            font-size: 0.85rem;
            color: #64748b;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 2rem;
        }

        .action-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            padding: 1rem;
            background: #f8fafc;
            border: 2px solid transparent;
            border-radius: 16px;
            color: #1e293b;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            border-color: #3b82f6;
            background: #fff;
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(59, 130, 246, 0.1);
        }

        .action-btn i {
            color: #3b82f6;
            font-size: 1.2rem;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 80px;
                padding: 2rem 0.5rem;
            }
            
            .sidebar-header h2 span,
            .nav-link span {
                display: none;
            }
            
            .main-content {
                margin-left: 80px;
            }
            
            .nav-link {
                justify-content: center;
                padding: 0.875rem;
            }
            
            .nav-link i {
                margin: 0;
            }
        }
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>Course<span>Hub</span></h2>
        </div>
        
        <div class="nav-links">
            <a href="admindashboard.jsp" class="nav-link active">
                <i class="fas fa-dashboard"></i>
                <span>Dashboard</span>
            </a>
            <a href="admincourses.jsp" class="nav-link">
                <i class="fas fa-book-open"></i>
                <span>Manage Courses</span>
            </a>
            <a href="viewenrollment.jsp" class="nav-link">
                <i class="fas fa-users"></i>
                <span>Enrollments</span>
            </a>
        
            
            
            
            <a href="logout" class="nav-link logout">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="page-title">
                <i class="fas fa-dashboard" style="color: #3b82f6; font-size: 1.8rem;"></i>
                <h1>Dashboard Overview</h1>
            </div>
            
            <div class="user-info">
                <div class="user-badge">
                    <i class="fas fa-user-circle"></i>
                    <span><%= session1.getAttribute("user") %></span>
                </div>
                <span class="role-tag">Administrator</span>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Total Courses</h3>
                    <div class="stat-number"><%= totalCourses %></div>
                </div>
               
            </div>

            <div class="stat-card">
                <div class="stat-info">
                    <h3>Total Students</h3>
                    <div class="stat-number"><%= totalStudents %></div>
                </div>
                
            </div>

            <div class="stat-card">
                <div class="stat-info">
                    <h3>Active Enrollments</h3>
                    <div class="stat-number"><%= totalEnrollments %></div>
                </div>
               
            </div>
        </div>

        <!-- Recent Activity Section -->
       
            
          
            
            
                
            </div>
        </div>
    </div>
</body>
</html>