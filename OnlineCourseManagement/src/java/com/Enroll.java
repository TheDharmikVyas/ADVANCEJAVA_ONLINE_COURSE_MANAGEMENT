package com;

import com.course.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
public class Enroll extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user");
        String courseId = request.getParameter("courseId");
        String courseName = request.getParameter("courseName");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO enrollments(student_username, course_id, course_name) VALUES (?, ?, ?)"
            );

            ps.setString(1, username);
            ps.setInt(2, Integer.parseInt(courseId));
            ps.setString(3, courseName);

            ps.executeUpdate();

            ps.close();
            con.close();

            request.setAttribute("course", courseName);
            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Enrollment Failed: " + e.getMessage());
        }
    }
}
