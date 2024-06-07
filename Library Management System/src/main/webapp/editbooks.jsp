<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Books</title>
<style>
    .content-container{
        display: flex;
        flex-direction: column;
    }
    .book-data-input{
        width: 50%;
        border-radius: 15px;
        background-color: #f2f2f2 ;
        margin: auto;
        padding: 40px;
    }

    .book-data-box{
        width: 100%;
        align-items: center;
        justify-content: space-between;
        display: flex;
        flex-direction: column;
    }
    .book-data-field input{
        border-radius: 5px;
        padding: 10px ;
        width: 250px;
        font-size: 16px;
        background-color: #fffff;
        border: none;
        color: rgb(0, 0, 0);
        outline-style: none;
    }

    .book-data-input input:hover{
        background-color: rgb(251, 251, 251) ;
    }

    .book-data-input button{
        padding: 10px 30px;
        width: 270px;
        background-color: yellowgreen;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        border: none;
    }

    .book-data-input button:hover{
        background-color:  rgb(128,156,19);
        color: white;
        cursor: pointer;
    }
    .book-data-field {
    	display: flex;
    	flex-direction: column;
    	margin: 8px 0px;
    }
    
    .form-container
    {
    display:flex;
    flex-direction:column;
    }
    
    .submit-style
    {
    	margin-top: 20px;
    	display:flex;
    	justify-content: center;
    	align-items: center;	
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
	<%
		String oldisbn = request.getParameter("isbn");
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        String sql = "SELECT * FROM books WHERE isbn=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, oldisbn);
        ResultSet rs = ps.executeQuery();
        rs.next();
	%>
	<div class=" overflow-x-auto  mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
            <div class="book-data-box">
            	<form action="EditBook" method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<input type="hidden" name="oldisbn" value="<%= oldisbn %>">
            	<input type="hidden" name="availability" value="<%= rs.getString("availability") %>">
                <input type="hidden" name="old_no_of_copies" value="<%= rs.getString("no_of_copies") %>">
            	<label>ISBN</label>
                <input type="text" name="isbn" placeholder="ISBN" value="<%= rs.getString("isbn") %>" required>
                </div>
                <div class="book-data-field">
                <label>Title</label>
                <input type="text" name="title" placeholder="Title" value="<%= rs.getString("title") %>" required>
                </div>
                <div class="book-data-field">
                <label>Author</label>
                <input type="text" name="author" placeholder="Author" value="<%= rs.getString("author") %>" required>
                </div>
                <div class="book-data-field">
                <label>Publisher</label>
                <input type="text" name="publisher" placeholder="Publisher" value="<%= rs.getString("publisher") %>" required>
                </div>
                <div class="book-data-field">
                <label>Edition</label>
                <input type="number" name="edition" placeholder="Edition" value="<%= rs.getString("edition") %>" required>
                </div>
                <div class="book-data-field">
                <label>Category</label>
                <input type="text" name="genre" placeholder="Category" value="<%= rs.getString("genre") %>" required>
                </div>
                <div class="book-data-field">
                <label>No Of Copies</label>                
                <input type="number" name="new_no_of_copies" min="1" placeholder="No of copies" value="<%= rs.getString("no_of_copies") %>" required>
                </div>
            	</div>
            	<div class="submit-style">
            	<button type="submit" class="submit-button">Edit Book</button>            	
            	</div>
                </form>
             </div>
        </div>
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