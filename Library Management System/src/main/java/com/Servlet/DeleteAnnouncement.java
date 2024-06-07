package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteAnnouncement")
public class DeleteAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String id = request.getParameter("message_id");        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");            
            
            String deleteMessage = "DELETE FROM announcements WHERE message_id=?";
            PreparedStatement ps = con.prepareStatement(deleteMessage);
            ps.setString(1, id);            
            
            int rowsUpdated = ps.executeUpdate();
            
            if (rowsUpdated > 0) {
                out.println("<script>document.location = './announcements.jsp';</script>");
            } else {
                out.println("<script>alert('Cannot delete');"
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