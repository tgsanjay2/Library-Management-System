<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String rollno = (String)session.getAttribute("rollno");
		if(rollno == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
	<jsp:include page="includes/studentsidebar.jsp" />
	<div class="flex flex-col p-20 gap-10 ml-64">
		<div class="text-5xl text-center font-bold">
            Announcements<br>
        </div>
        <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        Statement st = con.createStatement();
        String sql = "SELECT * FROM announcements ORDER BY message_id DESC";
        ResultSet rs = st.executeQuery(sql);
        while(rs.next()){
	%>
        <div class="p-5 bg-gray-50 rounded-md shadow-2xl hover:scale-105 transition-all duration-200">
            <div class="flex flex-col gap-5">
                <div class="text-3xl font-semibold flex justify-between">
                   <div class="inline"><%= rs.getString("message_title") %></div>                   
                </div>
                <div class="text-xl">
                    <%= rs.getString("message_content") %>
                </div>
            </div>
        </div>
        <%
        }
        rs.close();
        st.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e.getMessage());
    }
%>        
    </div>
</body>
</html>