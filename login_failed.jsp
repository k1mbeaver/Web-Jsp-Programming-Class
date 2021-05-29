<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login Failed</title>
</head>
<body>
	<% response.sendRedirect("login.jsp?error=1"); %>
</body>
</html>