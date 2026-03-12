package com;

import com.course.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
public class add extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO courses(title, description) VALUES(?, ?)"
            );

            ps.setString(1, title);
            ps.setString(2, description);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("admincourses.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Insert Failed: " + e.getMessage());
        }
    }
}