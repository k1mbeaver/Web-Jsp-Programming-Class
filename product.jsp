<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dto.ProductRepository" %>
<%@ page errorPage = "exceptionNoProductid.jsp" %>
<jsp:useBean id ="productDAO" class = "dto.ProductRepository" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Product list</title>
<script type = "text/javascript">
	function addToCart() {
		if( confirm("상품을 장바구니에 추가하시겠습니까?"))
		{
			document.addForm.submit();
		}
		else
		{
			document.addForm.reset();
		}
	}	
</script>
</head>
<body>
	<%@ include file = "menu.jsp" %>
		<div class="jumbotron">
           <div class="container">
               <h1 class="display-3"> 상품 정보 </h1>
           </div>
        </div>
    <%
    	String id = request.getParameter("id");
    	ProductRepository dao = ProductRepository.getInstance();
    	Product product = dao.getProductById(id);
    %>
    <div class = "container">
    	<div class = "row">
    		<div class = "col-md-5">
    			<img src ="./resoureces/images/<%=product.getFilename() %>" style ="width:300px">
    		</div>
    		<div class = "col-md-6">
    			<h3><%=product.getPname() %></h3>
    			<p><%=product.getDescription() %>
    			<p><b>상품 코드</b> : <span class = "badge badge-danger">
    				<%=product.getProductId() %>
    			</span>
    			<p> <b>제조사</b> : <%=product.getManufacturer() %>
    			<p> <b>분류</b> : <%=product.getCategory() %>
    			<p> <b>재고 수</b> : <%=product.getUnitsInStock() %>
    			<h4><%=product.getUnitPrice() %>원</h4>
    			<p>
    				<form name = "addForm" action = "./addCart.jsp?id=<%=product.getProductId()%>" method="post">
    					<a href = "#" class = "btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>
    					<a href="./cart.jsp" class = "btn btn-warning">장바구니&raquo;</a>
    					<a href = "./products.jsp" class = "btn btn-secondary">상품 목록 &raquo;</a>
    				</form>
    		</div>
    	</div>
    	<hr>
    </div>
    
    <%@ include file = "footer.jsp" %>
</body>
</html>