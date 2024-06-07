<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Curriculum</title>
<style>
    .content-container{
        display: flex;
        flex-direction: column;
    }
    .book-data-input{
        width: 60%;
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
    	margin: 10px;
    }
    
    .form-container
    {
    display:flex;
    flex-wrap:wrap;
    gap:10px;
    justify-content:space-between;
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
	<div class=" overflow-x-auto  mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
            <div class="book-data-box">
            	<form action="AddCurriculum" method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<label class="font-semibold">Degree</label>
                <div class="flex items-center">
                <label for="UG">UG</label>
                <input type="radio" class="-ml-20" id="UG" name="degree" value="UG" required>
                <label for="PG">PG</label>
                <input type="radio" id="PG" class="-ml-20" name="degree" value="PG" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">Course</label>
                <select name="course" id="course" class="p-2" required>
                          <option value="" selected disabled hidden="true">Choose here</option>
                          <option value="Biomedical Engineering">Biomedical Engineering</option>
                          <option value="Civil Engineering">Civil Engineering</option>
                          <option value="Computer Science and Engineering">Computer Science and Engineering</option>
                          <option value="Electronic and Communication Engineering">Electronics and Communication Engineering</option>
                          <option value="Electrical and  Electronics Engineering">Electrical and Electronics Engineering</option>
                          <option value="Geo Informatics">Geo Informatics</option>
                          <option value="Industrial">Industrial Engineering</option>
                          <option value="Information Technology">Information Technology</option>
                          <option value="Manufacturing Engineering">Manufacturing Engineering</option>
                          <option value="Material Science and Engineering">Material Science and Engineering</option>
                          <option value="Mechanical Engineering">Mechanical Engineering</option>
                          <option value="Mining Engineering">Mining Engineering</option>
                          <option value="Printing and Packaging Technology">Printing and Packaging Technology</option>
                </select>
                </div>
                <div class="book-data-field">
                <label>Semester</label>
                <input type="number" name="semester" placeholder="Semester" required>
                </div>
                <div class="book-data-field">
                <label>Subject Code</label>
                <input type="text" name="subject_code" placeholder="Subject Code" required>
                </div>
                <div class="book-data-field">
                <label>Subject Name</label>
                <input type="text" name="subject_name" placeholder="Subject Name" required>
                </div> 
                </div>
                </div>  
                <div class="submit-style">         
            	<button type="submit" class="submit-button">Add Subject</button>            	
            	</div>
                </form>
             </div>
        </div>
    </div>
</div>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        Statement st = con.createStatement();
        String sql = "SELECT * FROM curriculum";
        ResultSet rs = st.executeQuery(sql);
%>
<div class="overflow-x-auto shadow-md sm:rounded-lg mt-14 pt-5 ml-64">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3 text-center">Degree</th>
                <th scope="col" class="px-6 py-3 text-center">Course</th>
                <th scope="col" class="px-6 py-3 text-center">Semester</th>
                <th scope="col" class="px-6 py-3 text-center">Subject Code</th>
                <th scope="col" class="px-6 py-3 text-center">Subject Name</th>                
                <th scope="col" class="px-6 py-3 text-center">Update</th>
                <th scope="col" class="px-6 py-3 text-center">Delete</th>
            </tr>
        </thead>
        <tbody>
            <% while(rs.next()) { %>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 book_details">
                <td scope="row" class="px-6 py-4 font-medium text-gray-900 text-center whitespace-nowrap dark:text-white book_isbn">
                    <%= rs.getString("degree") %>
                </td>
                <td class="px-6 py-4 text-center book_title">
                    <%= rs.getString("course") %>
                </td>
                <td class="px-6 py-4 text-center book_author">
                    <%= rs.getString("semester") %>
                </td>
                <th class="px-6 py-4 text-center book_publisher">
                    <%= rs.getString("subject_code") %>
                </th>
                <td class="px-6 py-4 text-center book_edition">
                    <%= rs.getString("subject_name") %>
                </td>               
                <td class="px-6 py-4 text-center">
                    <a href="./editcurriculum.jsp?id=<%= rs.getString("row_id") %>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                </td>
                <td class="px-6 py-4 text-center">
                     <form action="DeleteCurriculumBook" method="post">
        				<input type="hidden" name="row_id" value="<%= rs.getString("row_id") %>">
                    	<button type="submit" class="font-medium text-red-600 dark:text-red-500 hover:underline"> Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
        rs.close();
        st.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e.getMessage());
    }
%>
</body>
</html>