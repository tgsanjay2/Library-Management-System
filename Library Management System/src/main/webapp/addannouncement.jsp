<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Announcement</title>
<style>
    .content-container{
        display: flex;
        flex-direction: column;
    }
    .book-data-input{
        width: 70%;
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
    	width: 100%
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
		
	<div class=" overflow-x-auto  mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
            <div class="book-data-box">
            	<form action="AddAnnouncement" method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<label class="font-semibold">Title</label>
                <input type="text" name="message_title" placeholder="Title" required>
                </div>
                <div class="book-data-field">
                <label class="font-semibold">Content</label>
                <textarea id="message" name="message_content" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Write the content here..." required></textarea>                
                </div>
           		</div>
            	<div class="submit-style">
            	<button type="submit" class="submit-button">Post</button>            	
            	</div>
                </form>
             </div>
        </div>
    </div>
</div>
	
</body>
</html>