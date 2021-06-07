<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.net.URLDecoder" %>
<%
	request.setCharacterEncoding("EUC-KR");

	String cartId = session.getId();
	
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
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			else if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			else if (n.equals("Shipping_date"))
				shipping_date = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			else if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			else if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
			else if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(), "euc-kr");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>주문 정보</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class="jumbotron">
         <div class="container">
         	<h1 class="display-3"> 주문 정보 </h1>
          </div>
  	</div>
  	<div class = "container col-8 alert alert-info">
  		<div class = "text-center">
  			<h1>영수증</h1>
  		</div>
  		<div class = "row justify-content-between">
  			<div class = "col-4" align = "left">
  				<strong>배송 주소</strong> <br>
  				성명 : <%=shipping_name%> <br>
  				우편번호 : <%=shipping_zipCode%> <br>
  				주소 : <%=shipping_addressName%>(<%=shipping_country %>) <br>
  			</div>
  			<div class = "col-4" align = "right">
  				<p> <em>배송일 : <%= shipping_date%></em>
  			</div>
  			<div > 
  				<table class = "table table-hover">
  					<tr>
  						<th class = "text-center">제품명</th>
  						<th class = "text-center">#</th>
  						<th class = "text-center">가격</th>
  						<th class = "text-center">소계</th>
  					</tr>
  					<%
  						int sum = 0;
  						ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
  						
  						if(cartList == null)
  							cartList = new ArrayList<Product>();
  						
  						for(int i = 0; i < cartList.size(); i++)
  						{
  							Product product = cartList.get(i);
  							int total = product.getUnitPrice() * product.getQuantity();
  							sum = sum + total;
  					%>
  					<tr>
  						<td class = "text-center"><em><%=product.getPname() %></em></td>
  						<td class = "text-center"><%=product.getQuantity() %></td>
  						<td class = "text-center"><%=product.getUnitPrice() %></td>
  						<td class = "text-center"><%=total%>원</td>
  					</tr>
  					<%
  						}
  					%>
  					<tr>
  						<td></td>
  						<td></td>
  						<td class = "text-right"><strong>총액:</strong></td>
  						<td class = "text-center text-danger"><strong><%=sum %></strong></td>
  					</tr>
  				</table>
  				
  				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class = "btn btn-secondary" role = "button">이전</a>
  				<a href="./thankCustomer.jsp" class = "btn btn-success" role = "button">주문완료</a>
        	    <a href="./checkOutCancelled.jsp" class = "btn btn-secondary" role = "button">취소</a>
  			</div>
  		</div>
  	</div>
</body>
</html>