<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dto.Product" %>
<%@ page import = "dto.ProductRepository" %>

<%
	request.setCharacterEncoding("euc-kr");
	
	String root_path = request.getSession().getServletContext().getRealPath("/");
	String realFolder = root_path + "resoureces/images/";
	int maxSize = 5 * 1024 * 1024;
	String encType = "EUC-KR";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productID");
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
		stock = Integer.valueOf(unitsInStock);
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String filename = multi.getFilesystemName(fname);
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setUnitPrice(price);
	newProduct.setFilename(filename);
	
	
	ProductRepository dao = ProductRepository.getInstance();
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
	
%>