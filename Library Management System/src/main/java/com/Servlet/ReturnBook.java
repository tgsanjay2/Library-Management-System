package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReturnBook")
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	     PrintWriter out = response.getWriter();	        
	     String issue_id = request.getParameter("issue_id");
	     String rollno = request.getParameter("rollno");
	     try {
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
	         String returnBook = "UPDATE issue SET return_date=current_date() WHERE rollno=? AND issue_id=?";
	         PreparedStatement ps = con.prepareStatement(returnBook);
	         ps.setString(1, rollno);
	         ps.setString(2, issue_id);
	         int n=ps.executeUpdate();
	         if(n>0) {
	        	 out.println("<script>document.location = './returnbooks.jsp?rollno=" + rollno + "';</script>");
	         }
	         else {
	        	 out.println("<script>alert('Cannot return');</script>");
	         }
	         ps.close();
	         con.close();
	         out.close();
	     }
	     catch (ClassNotFoundException | SQLException e) {
	    	 out.println("<script>alert(e.getMessage());"
	            		+ "document.location = './returnbooks.jsp';</script>");
	     }
	}

}
