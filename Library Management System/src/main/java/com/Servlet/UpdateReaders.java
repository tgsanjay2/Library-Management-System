package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


@WebServlet("/UpdateReaders")
public class UpdateReaders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String 	rollno = request.getParameter("rollno");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
			String checkUser = "SELECT * FROM students WHERE rollno = ?";
			PreparedStatement ps = con.prepareStatement(checkUser);
			ps.setString(1, rollno);
			if(ps.executeQuery().next()) {
				checkUser = "SELECT * FROM readers WHERE rollno = ?";
				ps = con.prepareStatement(checkUser);
				ps.setString(1, rollno);
				if(ps.executeQuery().next()) {
					checkUser = "DELETE FROM readers WHERE rollno = ?";
					ps = con.prepareStatement(checkUser);
					ps.setString(1, rollno);
				}
				else {
					checkUser = "INSERT INTO readers(rollno) VALUES (?)";
					ps = con.prepareStatement(checkUser);
					ps.setString(1, rollno);
				}
				ps.executeUpdate();
			}
			else {
				out.println("<script>alert('Student Not Found')</script>");
			}
			out.println("<script> document.location = './adminhome.jsp'; </script>");
		} 
		catch (ClassNotFoundException | SQLException e) {
			 out.println("<script>alert(e.getMessage());</script>");
		}
		
	}

}
