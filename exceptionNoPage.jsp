<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>상품 아이디 오류</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h2 class = "alert alert-danger">요청하신 페이지를 찾을 수 없습니다..</h2>
		</div>
	</div>
	<div class = "container">
		<p><%=request.getRequestURL() %>
		<p> <a href = "products.jsp" class = "btn btn-secondary">상품목록</a>
	</div>
</body>
</html>