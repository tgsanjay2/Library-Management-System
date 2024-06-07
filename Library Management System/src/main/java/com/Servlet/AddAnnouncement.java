package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddAnnouncement")
public class AddAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String title = request.getParameter("message_title");
        String content = request.getParameter("message_content");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");            
            
            String addMessage = "INSERT INTO announcements(message_title, message_content) VALUES(?, ?)";
            PreparedStatement ps = con.prepareStatement(addMessage);
            ps.setString(1, title);
            ps.setString(2, content);
            
            int rowsUpdated = ps.executeUpdate();
            
            if (rowsUpdated > 0) {
                out.println("<script>alert('Posted successfully');"
                        + "document.location = './announcements.jsp';</script>");
            } else {
                con.rollback();
                out.println("<script>alert('Cannot add');"
                        + "document.location = './announcements.jsp';</script>");
            }
            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            out.println("<script>alert('" + e.getMessage() + "');"
                    + "document.location = './announcements.jsp';</script>");
        }

}
}