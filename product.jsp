<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dto.ProductRepository" %>
<jsp:useBean id ="productDAO" class = "dto.ProductRepository" scope = "session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Product list</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
		<div class="jumbotron">
           <div class="container">
               <h1 class="display-3"> ��ǰ ���� </h1>
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
    			<p><b>��ǰ �ڵ�</b> : <span class = "badge badge-danger">
    				<%=product.getProductId() %>
    			</span>
    			<p> <b>������</b> : <%=product.getManufacturer() %>
    			<p> <b>�з�</b> : <%=product.getCategory() %>
    			<p> <b>��� ��</b> : <%=product.getUnitsInStock() %>
    			<h4><%=product.getUnitPrice() %>��</h4>
    			<p><a href = "#" class = "btn btb-info">��ǰ �ֹ� &raquo;</a>
    				<a href = "./products.jsp" class = "btn btn-secondary">��ǰ ��� &raquo;</a>
    		</div>
    	</div>
    	<hr>
    </div>
    
    <%@ include file = "footer.jsp" %>
</body>
</html>