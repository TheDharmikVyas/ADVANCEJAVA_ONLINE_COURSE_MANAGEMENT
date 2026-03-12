package com;

import com.course.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;  
import java.io.IOException;
import java.sql.*;
public class update extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔐 Admin Security Check (optional but recommended)
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            String idParam = request.getParameter("id");

            if (idParam == null) {
                response.getWriter().println("Invalid Course ID");
                return;
            }

            int id = Integer.parseInt(idParam);
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE courses SET title=?, description=? WHERE id=?"
            );

            ps.setString(1, title);
            ps.setString(2, description);
            ps.setInt(3, id);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {
                response.sendRedirect("admincourses.jsp");
            } else {
                response.getWriter().println("No Course Updated!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Update Failed: " + e.getMessage());
        }
    }
}
