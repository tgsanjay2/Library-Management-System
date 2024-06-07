<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logging out</title>
</head>
<body>
	<%
		session.removeAttribute("rollno");
		session.removeAttribute("firstname");
		session.removeAttribute("lastname");
		session.removeAttribute("admin");
		response.sendRedirect("./login.jsp");
	%>
</body>
</html>