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


@WebServlet("/DeleteBook")
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
	     PrintWriter out = response.getWriter();	        
	     String isbn = request.getParameter("isbn");  
	     
	     Connection con = null;
	     PreparedStatement ps = null;
	     ResultSet rs = null;
	     int n;
	     
	     try {
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
	         
	         String checkIssue = "SELECT * FROM books WHERE isbn = ? AND no_of_copies > availability";
	         ps = con.prepareStatement(checkIssue);
	         ps.setString(1, isbn);
	         rs = ps.executeQuery();
	         if(rs.next()) {
	        	 out.println("<script>alert('The Book is issued');"
		            		+ "document.location = './managebooks.jsp';</script>");
	         }
	         else {
	        	 String checkBook = "DELETE FROM books WHERE isbn = ?";
	        	 ps = con.prepareStatement(checkBook);
	        	 ps.setString(1, isbn);
	        	 n = ps.executeUpdate();
	        	 
	        	 if(n>0) {
	        		 out.println("<script>document.location = './managebooks.jsp';</script>");
	        	 }
	        	 else {
	        		 out.println("<script>alert('An error occurred');"
	        				 + "document.location = './managebooks.jsp';</script>");
	        	 }
	         }
	     }
	     
	     catch (ClassNotFoundException | SQLException e) {
	    	 out.println("<script>alert(e.getMessage());"
	            		+ "document.location = './managebooks.jsp';</script>");
	     } finally {
	    	 try {
	    		 if (ps != null) ps.close();
	    		 if (con != null) con.close();
	    	 } catch (SQLException e) {
	    		 e.printStackTrace();
	    	 }
	     }
	}
}
