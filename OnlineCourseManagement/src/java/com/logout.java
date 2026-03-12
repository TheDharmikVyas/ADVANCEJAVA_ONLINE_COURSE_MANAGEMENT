package com;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession(false);
    if (session != null) {
        session.invalidate(); // 🔥 session destroy
    }

    response.sendRedirect("login.jsp");
}

}
