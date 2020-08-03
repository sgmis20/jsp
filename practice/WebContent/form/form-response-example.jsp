<%@ page contentType="text/html; charset=UTF-8" %>  

<!DOCTYPE html>
<html>
  <head>
     <meta charset="utf-8">
    <title>주문식 햄버거</title>
    <link rel="stylesheet" type="text/css" href="./css/burger-response.css?v=1.3">
  </head>
  <body>

	<p>패티 : <%= request.getParameter("amount")%> 장</p>
	<p>패티 굽기 정도 : [1(레어)~5(웰던)] : <%= request.getParameter("doneness")%></p>
	<P>선택한 토핑</P>
	
	<ul>
 		<%
 		String[] toppings = request.getParameterValues("topping");
    	if (toppings != null) {
	 		for(String checkboxValue : toppings){
 				out.println("<li>"+ checkboxValue +"</li>");
 			}
 		}
 		%>
 	</ul>

	<p>치즈 선택 여부 : <%= request.getParameter("cheese")%></p>
	
	<p>번 타입 : <%= request.getParameter("bun")%></p>
	
	<p>소스 타입 : <%= request.getParameter("sauce")%></p>

  </body>
</html>