package com;

import com.course.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");   // ✅ NEW

        try {
            Connection con = DBConnection.getConnection();

            if (con == null) {
                request.setAttribute("errorMsg", "Database Connection Failed!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // ✅ UPDATED QUERY (Added role condition)
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=? AND role=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);   // ✅ NEW

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                session.setAttribute("role", role);  // ✅ NEW

                // ✅ Redirect based on role
                if ("admin".equals(role)) {
                    response.sendRedirect("admindashboard.jsp");
                } else if ("student".equals(role)) {
                    response.sendRedirect("dashboard.jsp");
                }

            } else {

                request.setAttribute("errorMsg", "Invalid Username or Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMsg", "Something went wrong!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}