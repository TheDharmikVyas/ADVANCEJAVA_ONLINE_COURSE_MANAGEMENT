package com;

import com.course.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class register extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");   // ✅ NEW

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(username, password, role) VALUES (?, ?, ?)"
            );

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);   // ✅ NEW

            ps.executeUpdate();

            ps.close();
            con.close();

            // After successful registration → login page
            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Registration Failed: " + e.getMessage());
        }
    }
}
