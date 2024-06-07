<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrow History</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<jsp:include page="includes/studentsidebar.jsp" /> 
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String rollno = (String)session.getAttribute("rollno");
		if(rollno == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
	<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        String sql = "SELECT i.isbn, title, DATE_FORMAT(i.issue_date, '%d-%m-%Y') issue_date , DATE_FORMAT(i.return_date, '%d-%m-%Y') return_date, DATEDIFF(return_date, DATE_ADD(issue_date, INTERVAL 14 DAY)) days_gap FROM issue i, books b WHERE i.isbn=b.isbn AND rollno=? AND i.return_date IS NOT NULL";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, rollno);
        ResultSet rs = ps.executeQuery();        
%>
    <div class="overflow-x-auto p-4 mx-auto ml-72 w-9/12 ">
    <div class="border-2 mt-24 rounded-lg items-center justify-center dark:border-gray-700">
        <div class="bg-gray-100">
            <p class="text-3xl font-sans flex items-center justify-center p-4">Borrowed Books History</p>
        </div>
        <div class="grid grid-cols-5 text-gray-700 mb-4 border-b p-4">
            <div class="flex items-center justify-center">ISBN</div>
            <div class="flex items-center justify-center"> Book Title</div>
            <div class="flex items-center justify-center">Issue Date</div>
            <div class="flex items-center justify-center">Return Date</div>
            <div class="flex items-center justify-center">Return Status</div> 
        </div>

        <%while(rs.next()){ %>
        <div class="text-center items-center">
            <div class="grid grid-cols-5 p-4 ">
                <div><%= rs.getString("isbn") %></div>
                <div ><%= rs.getString("title") %></div>
                <div><%= rs.getString("issue_date") %></div>                
                <div><%= rs.getString("return_date") %></div>
                <% if(rs.getInt("days_gap") > 0){ %>  
                	<div class="text-red-600"> Late Submission</div>
                <% } else{ %>
                	<div class="text-green-600"> Timely Submission</div>
                <% } %>             
            </div>
           </div>
            <%} %>
    </div>
    </div>
	<%
        rs.close();
        ps.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e.getMessage());
    }
%>
</body>
</html>