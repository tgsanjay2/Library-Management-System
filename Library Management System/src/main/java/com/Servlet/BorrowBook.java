package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/BorrowBook")
public class BorrowBook extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		PrintWriter out = response.getWriter();
		
		String rollno = (String)session.getAttribute("rollno");
		String isbn = (String)request.getParameter("isbn");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
			
			String checkBorrowed = "SELECT count(*) no_of_borrowed_books FROM issue WHERE rollno=? AND return_date IS NULL";
			PreparedStatement ps = con.prepareStatement(checkBorrowed);
			ps.setString(1, rollno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int no_of_borrowed_books = rs.getInt("no_of_borrowed_books");
			
			String checkBook = "SELECT * FROM books WHERE isbn = ?";
			PreparedStatement ps2 = con.prepareStatement(checkBook);
			ps2.setString(1, isbn);
			ResultSet rs2 = ps2.executeQuery();	
			
			if(no_of_borrowed_books == 4) {
                out.println("<script>alert('You can borrow maximum of 4 books only');"
                		+ "document.location = \'./borrowbooks.jsp\';</script>");
			}			
			else if(!rs2.next()) {
				out.println("<script>alert('Enter correct ISBN');"
                		+ "document.location = \'./borrowbooks.jsp\';</script>");
			}
			else {
				String checkAvailability = "SELECT availability FROM books WHERE isbn=?";
				PreparedStatement ps3 = con.prepareStatement(checkAvailability);
				ps3.setString(1, isbn);
				ResultSet rs3 = ps3.executeQuery();
				rs3.next();
				int no_of_available_copies = rs3.getInt("availability");
				
				if(no_of_available_copies == 0) {
					out.println("<script>alert('Book not available');"
	                		+ "document.location = \'./borrowbooks.jsp\';</script>");
				}
				else {
					String issueBook = "INSERT INTO issue(rollno, isbn, issue_date) VALUES (?, ?, current_date())";
					PreparedStatement ps4 = con.prepareStatement(issueBook);
					ps4.setString(1, rollno);
					ps4.setString(2, isbn);
					int rs4 = ps4.executeUpdate();					
					if(rs4>0) {
						out.println("<script>alert('Book Issued Successfully');"
		                		+ "document.location = \'./borrowbooks.jsp\';</script>");
					}
					else {
						out.println("<script>alert('Error occurred');"
		                		+ "document.location = \'./borrowbooks.jsp\';</script>");
					}
					ps4.close();					
				}
				ps3.close();
				rs3.close();
			}
			ps.close();
			rs.close();
			ps2.close();
			rs2.close();
			con.close();
		}
		
		catch(ClassNotFoundException | SQLException e) {
			out.println(e.getMessage());
		}
	}

}
