<%@ page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students</title>
    <style>
    .content-container{
        display: flex;
        flex-direction: column;
    }
    .book-data-input{
        width: 90%;
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
    }
    
    .form-container
    {
    display:flex;
    flex-wrap:wrap;
    gap:10px;
    justify-content:space-evenly;
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
<script src="https://cdn.tailwindcss.com"></script>
<body>
    
<jsp:include page="includes/adminsidebar.jsp" />
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String admin = (String)session.getAttribute("admin");
		if(admin == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        Statement st = con.createStatement();
        String sql = "SELECT * FROM students";
        ResultSet rs = st.executeQuery(sql);
%>
<div class=" overflow-x-auto  mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
        	<div class="text-center text-3xl text-semibold mb-5 italic">
        		Search Student
        	</div>
            <div class="book-data-box">
            	<form method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<label>Rollno</label>
                <input type="number" name="isbn" placeholder="Rollno" id="rollno_input">
                </div>
                <div class="book-data-field">
                <label>Name</label>
                <input type="text" name="title" placeholder="Name" id="name_input">
                </div>
                <div class="book-data-field">
                <label>Degree</label>
                <input type="text" name="author" placeholder="Degree" id="degree_input">
                </div>
                <div class="book-data-field">
                <label>Course</label>
                <input type="text" name="publisher" placeholder="Course" id="course_input">
                </div>
                <div class="book-data-field">
                <label>Semester</label>
                <input type="number" name="edition" placeholder="Semester" id="semester_input">
                </div>              
            	</div>            	
                </form>
             </div>
        </div>
    </div>
</div>
<div class=" overflow-x-auto shadow-md sm:rounded-lg mt-14 pt-5 ml-64 ">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3 text-center">
                    Roll No
                </th>
                <th scope="col" class="px-6 py-3 text-center">
                    Name
                </th>
                <th scope="col" class="px-6 py-3 text-center">
                    Degree
                </th>
                 <th scope="col" class="px-6 py-3 text-center">
                    Course
                </th>
                <th scope="col" class="px-6 py-3 text-center">
                    Semester
                </th>
                <th scope="col" class="px-6 py-3 text-center">
                    Fine
                </th>
                <th scope="col" class="px-6 py-3 text-center">
                    Email
                </th>
                <th scope="col" class="px-6 py-3 text-center">
                    Update
                </th>
                <th scope="col" class="px-6 py-3 text-centers">
                    Delete
                </th>
            </tr>
        </thead>
        <tbody>
        <% while(rs.next()) { %>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 student_details">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 text-center whitespace-nowrap dark:text-white student_rollno">
                    <%= rs.getString("rollno") %>
                </th>
                <td class="px-6 py-4 text-center student_name">
                    <%= rs.getString("firstname") + ' ' + rs.getString("lastname") %>
                </td>
                <td class="px-6 py-4 text-center student_degree">
                    <%= rs.getString("degree") %>
                </td>
                <td class="px-6 py-4 text-center student_course">
                    <%= rs.getString("course") %>
                </td>
                 <td class="px-6 py-4 text-center student_semester">
                    <%= rs.getString("semester") %>
                </td>
                <td class="px-6 py-4 text-center">
                    <%= rs.getString("fine") %>
                </td>
                <td class="px-6 py-4 text-center">
                    <%= rs.getString("email") %>
                </td>
                <td class="px-6 py-4 text-center">
                    <a href="./editstudents.jsp?rollno=<%= rs.getString("rollno") %>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                </td>
                <td class="px-6 py-4 text-center">
                    <form action="DeleteStudent" method="post">
                    	<input type="hidden" name="rollno" value="<%= rs.getString("rollno") %>">
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
   <script>
   function searchStudents() {
	    const rollnoInput = document.getElementById('rollno_input').value.toLowerCase();
	    const nameInput = document.getElementById('name_input').value.toLowerCase();
	    const degreeInput = document.getElementById('degree_input').value.toLowerCase();
	    const courseInput = document.getElementById('course_input').value.toLowerCase();
	    const semesterInput = document.getElementById('semester_input').value.toLowerCase();

	    const studentDetails = document.querySelectorAll('.student_details');

	    studentDetails.forEach((student) => {
	        const rollno = student.querySelector('.student_rollno').textContent.toLowerCase();
	        const name = student.querySelector('.student_name').textContent.toLowerCase();
	        const degree = student.querySelector('.student_degree').textContent.toLowerCase();
	        const course = student.querySelector('.student_course').textContent.toLowerCase();
	        const semester = student.querySelector('.student_semester').textContent.toLowerCase();

	        const rollnoMatch = rollno.includes(rollnoInput) || !rollnoInput;
	        const nameMatch = name.includes(nameInput) || !nameInput;
	        const degreeMatch = degree.includes(degreeInput) || !degreeInput;
	        const courseMatch = course.includes(courseInput) || !courseInput;
	        const semesterMatch = semester.includes(semesterInput) || !semesterInput;

	        if (rollnoMatch && nameMatch && degreeMatch && courseMatch && semesterMatch) {
	            student.style.display = ''; 
	        } else {
	            student.style.display = 'none'; 
	        }
	    });
	}

	document.getElementById('rollno_input').addEventListener('input', searchStudents);
	document.getElementById('name_input').addEventListener('input', searchStudents);
	document.getElementById('degree_input').addEventListener('input', searchStudents);
	document.getElementById('course_input').addEventListener('input', searchStudents);
	document.getElementById('semester_input').addEventListener('input', searchStudents);
  </script>
</body>
</html>