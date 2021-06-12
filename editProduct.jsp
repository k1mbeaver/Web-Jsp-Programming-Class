<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>상품 편집</title>
<script type = "text/javascript">
	function deleteConfirm(id) {
		if(confirm("해당 상품을 삭제합니다! [" + id + "]") == true)
			{
				location.href="./deleteProduct.jsp?id=" + id;
			}
		else
			{
				return;
			}
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<%@ include file = "menu.jsp" %>
		<div class="jumbotron">
           <div class="container">
               <h1 class="display-3"> 상품 편집 </h1>
           </div>
        </div>
        <div class ="container">
        	<div class ="row" align = "center">
        		<%@ include file = "dbconn.jsp"	%>
        		<%
        			PreparedStatement pstmt = null;
        			ResultSet rs = null;
        			String sql = "select * from product";
        			pstmt = conn.prepareStatement(sql);
        			rs = pstmt.executeQuery();
        			
        			while(rs.next()) {
        		%>
        		<div class = "col-md-4">
        			<img src ="./resoureces/images/<%=rs.getString("p_filename") %>" style ="width:100px">
        			<h3><%=rs.getString("p_name")%></h3>
        			<p><%=rs.getString("p_description")%> 
        			<p><%=rs.getString("p_unitPrice")%> 원
        			<p><%
        					if (edit.equals("update")) { 
        				%>
        			<a href = "./updateProduct.jsp?id=<%=rs.getString("p_id")%>" class = "btn btn-success" role="button">수정 &raquo;</a>
        				<%
        					} else if (edit.equals("delete")) {       						  
        				%>
        			<a href = "#" class = "btn btn-danger" role="button" onclick = "deleteConfirm('<%=rs.getString("p_id")%>')">삭제 &raquo;</a>
        				<%
        					}
        				%>
        		</div>
        		<%
        			}
        			
        			if(rs != null) rs.close();
        			if(pstmt != null) pstmt.close();
        			if(conn != null) conn.close();
        		%> 
        	</div>
        </div>
        
        <%@ include file = "footer.jsp" %>
</body>
</html>