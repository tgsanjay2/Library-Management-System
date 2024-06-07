<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Announcements</title>
<style type="text/css">
	.submit-button{
		padding: 10px 30px;
        width: 270px;
        background-color: yellowgreen;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        border: none;
	}
</style>
</head>
<body>
	<jsp:include page="includes/adminsidebar.jsp" />
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String admin = (String)session.getAttribute("admin");
		if(admin == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
		<div class="flex flex-col p-20 gap-10 ml-64">
		<div class="text-5xl text-center font-bold">
            Announcements<br>
            <a class="submit-button mt-10" href="./addannouncement.jsp">Add New Announcement</a>
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
                   <div class="flex items-center justify-items-end">
                   		<a href="editannouncement.jsp?id=<%= rs.getString("message_id") %>" class="inline">
                   			<svg class="w-[28px] h-[28px] text-gray-800 dark:text-white hover:text-blue-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
  								<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m14.304 4.844 2.852 2.852M7 7H4a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-4.5m2.409-9.91a2.017 2.017 0 0 1 0 2.853l-6.844 6.844L8 14l.713-3.565 6.844-6.844a2.015 2.015 0 0 1 2.852 0Z"/>
							</svg>                   			
                   		</a>
                   		<form action="DeleteAnnouncement" method="post">
                   		<input type="hidden" name="message_id" value="<%= rs.getString("message_id") %>">
                   		<button type="submit" class="inline ml-2">
                   			<svg class="w-[28px] h-[28px] text-gray-800 dark:text-white hover:text-red-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
  								<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 7h14m-9 3v8m4-8v8M10 3h4a1 1 0 0 1 1 1v3H9V4a1 1 0 0 1 1-1ZM6 7h12v13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7Z"/>
							</svg>                   			
                   		</button>
                   		</form>
                   </div>
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