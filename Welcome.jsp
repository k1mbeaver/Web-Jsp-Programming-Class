<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date" %>

<%-- 218124113 김승욱 프로젝트 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<title>Welcome</title>
</head>
<body>
		<%@ include file = "menu.jsp" %>
       <%! 
            String greeting="웹 쇼핑몰에 오신 것을 환영합니다";
            String tagline="Welcome to Web Market!";
       %>
       <div class="jumbotron">
           <div class="container">
               <h1 class="display-3">
                    <%= greeting %>
               </h1>
           </div>
       </div>
       
       <main role="main">
           <div class="container">
               <div class="text-center">
                   <h3> <%= tagline %></h3>
                   <%
                   		Date day = new java.util.Date(); 
                   		String am_pm;
                   		int hour = day.getHours();
                   		int minute = day.getMinutes();
                   		int second = day.getSeconds();
                   		
                   		if(hour / 12 == 0) {
                   		am_pm = "AM";
                   		}
                   		
                   		else {
                   		am_pm = "PM";
                   		hour = hour - 12;
                   		}
                   		
                   		String CT = hour + ":" + minute + ":" + second + " " + am_pm;
                   		out.println("현재 접속 시각 : " + CT + "\n");
                   		
                   		response.setIntHeader("Refresh", 5);
                   	%>
               </div>
           </div>
       </main>
       <%@ include file = "footer.jsp" %>
</body>
</html>