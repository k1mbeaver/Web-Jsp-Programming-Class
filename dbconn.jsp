<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>DB Connection</title>
</head>
<body>
<%
	Connection conn = null;

	try {
		String url = "jdbc:mysql://localhost:3306/WebMarketDB";
		String user = "root";
		String password = "rlatmddnr48!";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패했습니다.");
		out.println("SQL Exception : " + ex.getMessage());
	}
%>
</body>
</html>