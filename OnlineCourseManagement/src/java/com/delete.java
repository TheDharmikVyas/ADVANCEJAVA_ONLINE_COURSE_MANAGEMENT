package com;

import com.course.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
public class delete extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
        return;
}


        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM courses WHERE id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("admincourses.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Delete Failed!");
        }
    }
}
