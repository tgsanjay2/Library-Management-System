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

@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String rollno = request.getParameter("rollno");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement ps2 = null;
        ResultSet rs2 = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");

            // Check if the student has a pending fine
            String checkFine = "SELECT fine FROM students WHERE rollno = ?";
            ps = con.prepareStatement(checkFine);
            ps.setString(1, rollno);
            rs = ps.executeQuery();
            rs.next();
            int fine = rs.getInt("fine");
            
            String checkIssue = "SELECT * FROM issue WHERE rollno = ? AND return_date IS NULL";
            ps2 = con.prepareStatement(checkIssue);
            ps2.setString(1, rollno);
            rs2 = ps2.executeQuery();    
                
                if (fine > 0) {
                    out.println("<script>alert('The Student has a pending fine');"
                            + "document.location = './managestudents.jsp';</script>");
                } 
                else if(rs2.next()) {
                	out.println("<script>alert('The Student hasn't returned some books');"
                            + "document.location = './managestudents.jsp';</script>");
                }
                else {
                    // Close the current PreparedStatement
                    if (ps != null) ps.close();

                    // Delete the student
                    String deleteStudent = "DELETE FROM students WHERE rollno = ?";
                    ps = con.prepareStatement(deleteStudent);
                    ps.setString(1, rollno);
                    int n = ps.executeUpdate();

                    if (n > 0) {
                        response.sendRedirect("managestudents.jsp");
                    } else {
                        out.println("<script>alert('An error occurred while deleting the student');"
                                + "document.location = './managestudents.jsp';</script>");
                    }
                }
            } 
         catch (ClassNotFoundException | SQLException e) {
            out.println("<script>alert(e.getMessage());"
                    + "document.location = './managestudents.jsp';</script>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (rs2 != null) rs2.close();
                if (ps2 != null) ps2.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        out.close();
    }
}
