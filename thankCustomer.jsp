<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.net.URLDecoder" %>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_date = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if(cookies != null)
	{
		for (int i = 0; i < cookies.length; i++)
		{
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			if(n.equals("Shipping_cartId"))
			{
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			}
			else if (n.equals("Shipping_date"))
			{
				shipping_date = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>주문 완료</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
         <div class="container">
         	<h1 class="display-3"> 주문 완료 </h1>
          </div>
  	</div>
  	<div class = "container">
  		<h2 class = "alert alert-danger">주문해주셔서 감사합니다</h2>
  		<p> 주문은 <%=shipping_date %>에 배송될 예정입니다!
  		<p> 주문번호 : <%=shipping_cartId %>
  	</div>
  	<div class = "container">
  		<p> <a href="./products.jsp" class = "btn btn-secondary"> &laquo; 상품 목록</a>
  	</div>
</body>
</html>
<%
	session.invalidate();

	for(int i = 0; i < cookies.length; i++)
	{
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		else if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		else if (n.equals("Shipping_date"))
			thisCookie.setMaxAge(0);
		else if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		else if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		else if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>