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


@WebServlet("/RegisterStudent")
public class RegisterStudent extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(); // Obtaining session object
	    PrintWriter out = response.getWriter(); // Obtaining PrintWriter
	    String fname = request.getParameter("firstname");
	    String lname = request.getParameter("lastname");
	    String rollno = request.getParameter("rollno");
	    String gender = request.getParameter("gender");
	    String degree = request.getParameter("degree");
	    String course = request.getParameter("course");
	    String password = request.getParameter("password");
	    String phone = request.getParameter("phone");
	    String semester = request.getParameter("semester");
	    String email = request.getParameter("email");
	    
	    response.setContentType("text/html");
	    
	    Connection con = null;
	    PreparedStatement ps = null;
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
            
            String addUser = "SELECT * FROM students WHERE rollno=?";
            ps = con.prepareStatement(addUser);
            ps.setString(1, rollno);
            if(ps.executeQuery().next()) {
            	 out.println("<script>alert('Student already registered');"
 						+ "document.location = './login.jsp';</script>");
            }
            else {
	        addUser = "INSERT INTO students (rollno, firstname, lastname, email, phone, password, gender, degree, course, semester) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        ps = con.prepareStatement(addUser);
	        ps.setString(1, rollno);
	        ps.setString(2, fname);
	        ps.setString(3, lname);
	        ps.setString(4, email);
	        ps.setString(5, phone);
	        ps.setString(6, password);
	        ps.setString(7, gender);
	        ps.setString(8, degree);
	        ps.setString(9, course);
	        ps.setString(10, semester);
	        
	        int rs = ps.executeUpdate();
	        
	        if (rs > 0) {
	            out.println("<script>alert('Student registered successfully');"
						+ "document.location = './login.jsp';</script>");
	        } else {
	        	out.println("<script>alert('Failed to register Student. Please check your details.');"
						+ "document.location = './register.jsp';</script>");
	        }
            }
	    } catch (ClassNotFoundException | SQLException e) {
	        out.println("Error: " + e.getMessage());
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            out.println("Error: " + e.getMessage());
	        }
	    }
	}
}
