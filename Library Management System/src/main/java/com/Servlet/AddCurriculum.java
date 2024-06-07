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


@WebServlet("/AddCurriculum")
public class AddCurriculum extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
	        String degree = request.getParameter("degree");
	        String semester = request.getParameter("semester");
	        String course = request.getParameter("course");
	        String subject_code = request.getParameter("subject_code");
	        String subject_name = request.getParameter("subject_name");	        
	        
	              
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");

	            String checkSubject = "SELECT * FROM curriculum WHERE semester = ? AND subject_code=?";
	            PreparedStatement ps = con.prepareStatement(checkSubject);
	            ps.setString(1, semester);
	            ps.setString(2, subject_code);
	            ResultSet rs = ps.executeQuery();
	            
	            String checkName = "SELECT * FROM curriculum WHERE subject_code=? AND subject_name<>?";
	            PreparedStatement ps2 = con.prepareStatement(checkName);
	            ps2.setString(1, subject_code);
	            ps2.setString(2, subject_name);
	            ResultSet rs2 = ps2.executeQuery();
	            if (rs.next()) {
	                out.println("<script>alert('Subject already added')</script>");
	            } 
	            else if(rs2.next()){
	            	out.println("<script>alert('Check Subject code and name')</script>");
	            }
	            
	            else {
	                String addSubject = "INSERT INTO curriculum(degree, course, semester, subject_code, subject_name) VALUES (?, ?, ?, ?, ?)";
	                ps = con.prepareStatement(addSubject);
	                ps.setString(1, degree);
	                ps.setString(2, course);
	                ps.setString(3, semester);
	                ps.setString(4, subject_code);
	                ps.setString(5, subject_name);	                
	                int n = ps.executeUpdate();
	                if (n > 0) {
	                    out.println("<script>alert('Subject added successfully');"
	                    		+ "document.location = './admincurriculum.jsp';</script>");
	                } else {
	                    out.println("<script>alert('Failed to add subject');"
	                    		+ "document.location = './admincurriculum.jsp';</script>");
	                }
	            }
	            rs.close();
	            ps.close();
	            rs2.close();
	            ps2.close();
	            con.close();
	            } catch (ClassNotFoundException | SQLException e) {
	            out.println("<script>alert(e.getMessage());"
                		+ "document.location = './admincurriculum.jsp';</script>");
	        } 
	        
	    }
}
