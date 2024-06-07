package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String old_rollno = request.getParameter("old_rollno");
        String rollno = request.getParameter("rollno");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String degree = request.getParameter("degree");
        String course = request.getParameter("course");
        String semester = request.getParameter("semester");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
            
            String updateStudent = "UPDATE students SET rollno=?, firstname=?, lastname=?, gender=?, degree=?, course=?, semester=?, email=?, phone=? WHERE rollno=?";
            PreparedStatement ps = con.prepareStatement(updateStudent);
            ps.setString(1, rollno);
            ps.setString(2, firstname);
            ps.setString(3, lastname);
            ps.setString(4, gender);
            ps.setString(5, degree);
            ps.setString(6, course);
            ps.setString(7, semester);
            ps.setString(8, email);
            ps.setString(9, phone);
            ps.setString(10, old_rollno);
            
            int rowsUpdated = ps.executeUpdate();
            
            if (rowsUpdated > 0) {
                out.println("<script>alert('Updated successfully');"
                        + "document.location = './profile.jsp';</script>");
            } else {
                con.rollback();
                out.println("<script>alert('Cannot update');"
                        + "document.location = './profile.jsp';</script>");
            }            
            con.setAutoCommit(true);
            con.close();
            ps.close();
        }
        
        catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            out.println("<script>alert('" + e.getMessage() + "');"
                    + "document.location = './profile.jsp';</script>");
        }
	}

}
