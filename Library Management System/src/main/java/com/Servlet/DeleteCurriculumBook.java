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


@WebServlet("/DeleteCurriculumBook")
public class DeleteCurriculumBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");
	     PrintWriter out = response.getWriter();	        
	     String row_id_book = request.getParameter("row_id_book");  
	     
	     Connection con = null;
	     PreparedStatement ps = null;
	     ResultSet rs = null;
	     int n;
	     
	     try {
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
	         
	         	 String deleteBook = "DELETE FROM curriculum_books WHERE row_id_book = ?";
	        	 ps = con.prepareStatement(deleteBook);
	        	 ps.setString(1, row_id_book);
	        	 n = ps.executeUpdate();
	        	 
	        	 if(n>0) {
	        		 out.println("<script>document.location = './admincurriculumbooks.jsp';</script>");
	        	 }
	        	 else {
	        		 out.println("<script>alert('An error occurred');"
	        				 + "document.location = './admincurriculumbooks.jsp';</script>");
	        	 }	         
	     }

	     catch (ClassNotFoundException | SQLException e) {
	    	 out.println("<script>alert(e.getMessage());"
	            		+ "document.location = './admincurriculumbooks.jsp';</script>");
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
