<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrow Books</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
    .content-container{
    	margin-top: 50px;
        display: flex;
        flex-direction: column;
    }

      .entry-data-input {
        width: 75%;
        border-radius: 15px;
        background-color: #f2f2f2;
        margin: auto;
        padding: 40px;
        display: flex; /* Set display to flex */
        justify-content: center; /* Align items horizontally */
    }

    .entry-data-box {
        display: flex; /* Set display to flex */
        flex-direction: row; /* Set flex direction to row */
        gap: 20px;
        align-items: center; /* Align items vertically */
    }

    .entry-data-box label,
    .entry-data-box input,
    .entry-data-box button {
        margin: 0; 
    }

    .entry-data-input input{
        border-radius: 5px;
        display: inline;
        margin: 0px 30px;
        padding: 10px 30px ;
        width: 270px;
        font-size: 16px;
        background-color: #fffff;
        border: none;
        color: rgb(0, 0, 0);
        outline-style: none;
    }

    .entry-data-input input:hover{
        background-color: rgb(251, 251, 251) ;
    }

    .entry-data-input button{
        padding: 10px 15px;
        width: 180px;
        background-color: yellowgreen;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        border: none;
    }

    .entry-data-input button:hover{
        background-color:  rgb(128,156,19);
        color: white;
        cursor: pointer;
    }
</style>
</head>
<body>
	<jsp:include page="includes/studentsidebar.jsp" /> 
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String rollno = (String)session.getAttribute("rollno");
		if(rollno == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
	<div class=" overflow-x-auto  mt-4 pt-5 ml-64 ">
    <div class="content-container">
        <div class="entry-data-input">
            <div class="entry-data-box">
            	<form action="BorrowBook" method="post">
            	<label>Enter ISBN: </label>
                <input type="number" name="isbn" placeholder="ISBN">
                <button type="submit">Borrow</button>
                </form>
            </div>
        </div>
    </div>
    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        String sql = "SELECT i.issue_id, i.isbn, title, DATE_FORMAT(i.issue_date, '%d-%m-%Y') issue_date , DATE_FORMAT(DATE_ADD(issue_date, INTERVAL 14 DAY), '%d-%m-%Y') expected_return_date, DATEDIFF(current_date(), DATE_ADD(issue_date, INTERVAL 14 DAY)) days_remaining FROM issue i, books b WHERE i.isbn=b.isbn AND rollno=? AND i.return_date IS NULL";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, rollno);
        ResultSet rs = ps.executeQuery();        
%>
    <div class="p-4 mx-auto mt-10 w-9/12 ">
    <div class="border-2 rounded-lg items-center justify-center dark:border-gray-700 " style={{"margin-top" : "70px"}}>
        <div class="bg-gray-100">
            <p class="text-3xl font-sans flex items-center justify-center p-4">Borrowed Books</p>
        </div>
        <div class="grid grid-cols-6 text-gray-700 mb-4 border-b p-4">
        <div class="flex items-center justify-center">Issue Id</div>
            <div class="flex items-center justify-center">ISBN</div>
            <div class="flex items-center justify-center"> Book Title</div>
            <div class="flex items-center justify-center">Issue Date</div>
            <div class="flex items-center justify-center">Due Date</div>
            <div class="flex items-center justify-center">Status</div> 
        </div>

        <%while(rs.next()){ %>
        <div class="text-center items-center">
            <div class="grid grid-cols-6 p-4 ">
            	<div><%= rs.getString("issue_id") %></div>
                <div><%= rs.getString("isbn") %></div>
                <div ><%= rs.getString("title") %></div>
                <div><%= rs.getString("issue_date") %></div>                
                <div><%= rs.getString("expected_return_date") %></div>
                <% if(rs.getInt("days_remaining") > 0){ %>  
                	<div class="text-red-600"> Overdue</div>
                <% } else{ %>
                	<div class="text-green-600"> Ahead of Schedule</div>
                <% } %>             
            </div>
           </div>
            <%} %>
    </div>
	<%
        rs.close();
        ps.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e.getMessage());
    }
%>
 </div>
</div>
</body>
</html>