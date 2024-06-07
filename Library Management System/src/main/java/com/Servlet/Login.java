package com.Servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
	


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(); // Obtaining session object
	    PrintWriter out = response.getWriter(); // Obtaining PrintWriter
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        response.setContentType("text/html");
	        // Initialize connection variables
	        Connection con = null;
	        PreparedStatement ps1 = null;
	        ResultSet rs = null;
	        PreparedStatement ps2 = null;

	        try {
	            // Load MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish connection to the database
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");

	            // Prepare SQL statement with parameters to avoid SQL injection
	            String checkUser = "SELECT * FROM ADMIN WHERE USERID = ? AND PASSWORD = ?";
	            ps1 = con.prepareStatement(checkUser);
	            ps1.setString(1, username);
	            ps1.setString(2, password);

	            // Execute query
	            String checkUser2 = "SELECT * FROM students WHERE rollno = ? AND password = ?";
	            ps2 = con.prepareStatement(checkUser2);
	            ps2.setString(1, username);
	            ps2.setString(2, password);
	            rs = ps2.executeQuery();
	            if (ps1.executeQuery().next()) {
	                session.setAttribute("admin", "yes");
	                out.println("<script>alert(\"Admin found\");"
	                		+ "document.location = \'./adminhome.jsp\';</script>");	          
	            } 
	            else if(rs.next()) {
	            	session.setAttribute("rollno", rs.getString("rollno"));
	            	session.setAttribute("firstname", rs.getString("firstname"));
	            	session.setAttribute("lastname", rs.getString("lastname"));
	                out.println("<script>alert(\"Student found\");"
	                		+ "document.location = \'./studenthome.jsp\';</script>");
	            }
	            else {
	                // Display error message using JavaScript
	            	out.println("<script>alert(\"Invalid Details\");"
	                		+ "document.location = \'./login.jsp\';</script>");
//	                response.sendRedirect("./login.jsp");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            // Display error message
	            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
	            
	        } finally {
	            // Close resources
	            try {
	                if (rs != null) rs.close();
	                if (ps1 != null) ps1.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	               
	                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
	            }
	        }
	    }
		

}
