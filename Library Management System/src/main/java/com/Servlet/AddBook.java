package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String edition = request.getParameter("edition");
        String genre = request.getParameter("genre");
        String no_of_copies = request.getParameter("no_of_copies");
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");

            String checkBook = "SELECT * FROM books WHERE isbn = ?";
            ps = con.prepareStatement(checkBook);
            ps.setString(1, isbn);
            rs = ps.executeQuery();

            if (rs.next()) {
                out.println("<script>alert('Book already added')</script>");
            } else {
                String addBook = "INSERT INTO books(isbn, title, author, publisher, edition, genre, no_of_copies, availability) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(addBook);
                ps.setString(1, isbn);
                ps.setString(2, title);
                ps.setString(3, author);
                ps.setString(4, publisher);
                ps.setString(5, edition);
                ps.setString(6, genre);
                ps.setString(7, no_of_copies);
                ps.setString(8, no_of_copies);
                int n = ps.executeUpdate();
                if (n > 0) {
                    out.println("<script>alert('Book added successfully');"
                    		+ "document.location = './managebooks.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to add book');"
                    		+ "document.location = './managebooks.jsp';</script>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<script>alert(e.getMessage());"
            		+ "document.location = './managebooks.jsp';</script>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
