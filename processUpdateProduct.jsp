<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dto.ProductRepository" %>
<%@ include file = "dbconn.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String root_path = request.getSession().getServletContext().getRealPath("/");
	String realFolder = root_path + "resoureces/images/";
	int maxSize = 5 * 1024 * 1024;
	String encType = "euc-kr";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("unitsInStock");
	
	Integer price;
	if(unitPrice.isEmpty()){
		price = 0;	
	}
	else{
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	if(unitPrice.isEmpty()){
		stock = 0;	
	}
	else{
		stock = Long.valueOf(unitsInStock);
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String filename = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where p_id = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		if(filename != null)
		{
			sql = "update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitInStock=?, p_condition=?, p_fileName=? where p_id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, filename);
			pstmt.setString(9, productId);
			pstmt.executeUpdate();
			
		}
		else { 
			sql = "update product set p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitInStock=?, p_condition=? where p_id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, productId);
			pstmt.executeUpdate();
		}
	}
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
	
%>