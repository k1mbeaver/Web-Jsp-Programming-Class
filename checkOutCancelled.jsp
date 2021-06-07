<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>주문 취소</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
		<div class="jumbotron">
           <div class="container">
               <h1 class="display-3"> 주문 취소 </h1>
           </div>
        </div>
        <div class = "container">
        	<h2 class = "alert alert-danger">주문이 취소되었습니다.</h2>
        </div>
        <div class = "container">
        	<p><a href="./products.jsp" class = "btn btn-secondary"> &laquo; 상품 목록</a>
        </div>
</body>
</html>