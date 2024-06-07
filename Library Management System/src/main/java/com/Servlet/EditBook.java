package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EditBook")
public class EditBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String old_isbn = request.getParameter("oldisbn");
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String edition = request.getParameter("edition");
        String genre = request.getParameter("genre");
        String no_of_copies = request.getParameter("new_no_of_copies");
        int new_no_of_copies = Integer.parseInt(request.getParameter("new_no_of_copies"));
        int old_no_of_copies = Integer.parseInt(request.getParameter("old_no_of_copies"));
        int availability = Integer.parseInt(request.getParameter("availability"));
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
            
            if (old_no_of_copies != availability && !old_isbn.equals(isbn)) {
                out.print("<script>alert('Some books are with students');"
                        + "document.location = './managebooks.jsp';</script>");
                return;
            }
            
            if ((old_no_of_copies - new_no_of_copies) > availability) {
                out.print("<script>alert('Only " + availability + " copies available');"
                        + "document.location = './editbooks.jsp?isbn=" + old_isbn + "';</script>");
                return;
            }
            
            // Start transaction
            con.setAutoCommit(false);
            
            String updateBook = "UPDATE books SET isbn=?, title=?, author=?, publisher=?, edition=?, genre=?, no_of_copies=? WHERE isbn=?";
            PreparedStatement ps = con.prepareStatement(updateBook);
            ps.setString(1, isbn);
            ps.setString(2, title);
            ps.setString(3, author);
            ps.setString(4, publisher);
            ps.setString(5, edition);
            ps.setString(6, genre);
            ps.setString(7, no_of_copies);
            ps.setString(8, old_isbn);
            
            int rowsUpdated = ps.executeUpdate();
            
            if (rowsUpdated > 0) {
                con.commit();
                out.println("<script>alert('Updated successfully');"
                        + "document.location = './managebooks.jsp';</script>");
            } else {
                con.rollback();
                out.println("<script>alert('Cannot update');"
                        + "document.location = './editbooks.jsp?isbn=" + old_isbn + "';</script>");
            }
            
            con.setAutoCommit(true);
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            out.println("<script>alert('" + e.getMessage() + "');"
                    + "document.location = './editbooks.jsp?isbn=" + old_isbn + "';</script>");
        }

}
}