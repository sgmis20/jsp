  
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Confirmation Title</title>
  </head>
  <body>


 	당신의 이름은 : ${param.lastName} ${param.firstName} 
	
	<br>
	당신의 거주지 : ${param.address}
	<br>
	선호 지역 : ${param.favoredRegion}
 	<br>
 	할 수 있는 프로그래밍 스킬 <br>
 	<ul>
 	<%
 	String[] skills = request.getParameterValues("skills");
    if (skills != null) {
 		for(String cbxVal : skills){
 			out.println("<li>"+cbxVal+"</li>");
 		}
 	}
 	%>
 	</ul>
 
  </body>
</html>