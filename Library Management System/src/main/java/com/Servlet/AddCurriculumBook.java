package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCurriculumBook
 */
@WebServlet("/AddCurriculumBook")
public class AddCurriculumBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();       
       
        String subject_code = request.getParameter("subject_code");
        String isbn = request.getParameter("isbn");	        
        
              
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
            PreparedStatement ps = null;
            ResultSet rs = null;
            
         /*   String check = "SELECT * FROM curriculum WHERE subject_code=?";
            PreparedStatement ps = con.prepareStatement(check);
            ps.setString(1, subject_code);
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
            	out.println("<script>alert('No such subject')"
                		+ "document.location = './admincurriculumbooks.jsp';</script>");
            	return;
            }
            
            check = "SELECT * FROM books WHERE isbn=?";
            ps = con.prepareStatement(check);
            ps.setString(1, isbn);
            rs = ps.executeQuery();
            if(!rs.next()) {
            	out.println("<script>alert('No such book')"
                		+ "document.location = './admincurriculumbooks.jsp';</script>");
            	return;
            }
            */
            String checkBook = "SELECT * FROM curriculum_books WHERE isbn = ? AND subject_code=?";
            ps = con.prepareStatement(checkBook);
            ps.setString(1, isbn);
            ps.setString(2, subject_code);
            rs = ps.executeQuery();
                        
            if (rs.next()) {
                out.println("<script>alert('Record already added')"
                		+ "document.location = './admincurriculumbooks.jsp';</script>");
            } 
                        
            else {
                String addBook = "INSERT INTO curriculum_books(isbn, subject_code) VALUES (?, ?)";
                ps = con.prepareStatement(addBook);
                ps.setString(1, isbn);
                ps.setString(2, subject_code);	                
                int n = ps.executeUpdate();
                if (n > 0) {
                    out.println("<script>document.location = './admincurriculumbooks.jsp';</script>");
                } else {
                    out.println("<script>alert('Failed to add subject');"
                    		+ "document.location = './admincurriculumbooks.jsp';</script>");
                }
            }
            rs.close();
            ps.close();
            con.close();
            } catch (ClassNotFoundException | SQLException e) {
            out.println("<script>alert(e.getMessage());"
            		+ "document.location = './admincurriculumbooks.jsp';</script>");
        } 
        
    }

}
