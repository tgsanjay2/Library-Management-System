<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<style>
    .content-container{
        display: flex;
        flex-direction: column;
    }
    .book-data-input{
        width: 40%;
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
    width:100%;
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
		String old_rollno = request.getParameter("rollno");
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        String sql = "SELECT * FROM students WHERE rollno=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, old_rollno);
        ResultSet rs = ps.executeQuery();
        rs.next();
	%>
	<div class=" overflow-x-auto  mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
            <div class="book-data-box">
            	<form action="EditStudent" method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<input type="hidden" name="old_rollno" value="<%= old_rollno %>">
            	<label class="font-semibold">Rollno</label>
                <input type="number" name="rollno" placeholder="Rollno" value="<%= rs.getString("rollno") %>" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">FirstName</label>
                <input type="text" name="firstname" placeholder="FirstName" value="<%= rs.getString("firstname") %>" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">LastName</label>
                <input type="text" name="lastname" placeholder="LastNmae" value="<%= rs.getString("lastname") %>" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">Gender</label>
                <div class="flex items-center">                
                <label for="male">Male</label>
                <input class="-ml-20" type="radio" id="male" name="gender" value="Male">
                <label for="female">Female</label>
                <input class="-ml-20" type="radio" id="female" name="gender" value="Female">
                </div>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">Degree</label>
                <div class="flex items-center">
                <label for="UG">UG</label>
                <input type="radio" class="-ml-20" id="UG" name="degree" value="UG" required>
                <label for="PG">PG</label>
                <input type="radio" id="PG" class="-ml-20" name="degree" value="PG" required>
                </div>
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
                <label class="font-semibold">Semester</label>                
                <input type="number" name="semester" min="1" placeholder="Semester" value="<%= rs.getString("semester") %>" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">E-mail</label>                
                <input type="email" name="email" min="1" placeholder="E-mail" value="<%= rs.getString("email") %>" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">Phone</label>                
                <input type="number" name="phone" min="1" placeholder="Phone Number" value="<%= rs.getString("phone") %>" required>
                </div>
            	</div>
            	<div class="submit-style">
            	<button type="submit" class="submit-button">Edit Student</button>            	
            	</div>
                </form>
             </div>
        </div>
    </div>
</div>
<script>
    var gender = "<%= rs.getString("gender") %>";

    if (gender === 'Male') {
        document.getElementById('male').checked = true;
    } else if (gender === 'Female') {
        document.getElementById('female').checked = true;
    }
    
    var degree = "<%= rs.getString("degree") %>";

    if (degree === 'UG') {
        document.getElementById('UG').checked = true;
    } else if (degree === 'PG') {
        document.getElementById('PG').checked = true;
    }
    
	var course = "<%= rs.getString("course") %>";
    
    var selectElement = document.getElementById('course');
    
    for (var i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === course) {
            selectElement.options[i].selected = true;
            break;
        }
    }

</script>
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