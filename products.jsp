<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dto.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<title>Product List</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
		<div class="jumbotron">
           <div class="container">
               <h1 class="display-3"> 상품 목록 </h1>
           </div>
        </div>
        <%
        	ProductRepository dao = ProductRepository.getInstance();
        	ArrayList<Product> listOfProducts = dao.getAllProducts();
        %>
        <div class ="container">
        	<div class ="row" align = "center">
        		<%
        			for(int i = 0; i < listOfProducts.size(); i++)
        			{
        				Product product = listOfProducts.get(i);
        			
        		%>
        		<div>
        			<img src ="./resoureces/images/<%=product.getFilename() %>" style ="width:300px">
        			<h3><%=product.getPname()%></h3>
        			<p><%=product.getDescription()%> 
        			<p><%=product.getUnitPrice()%> 원
        			<p><a href = "./product.jsp?id=<%=product.getProductId() %>" class = "btn btn-primary" role="button">상세정보</a>
        		</div>
        		<%
        			}
        		%> 
        	</div>
        </div>
        
        <%@ include file = "footer.jsp" %>
</body>
</html>