<%@ page contentType="text/html; charset=UTF-8" %>  

<!DOCTYPE html>
<html>
  <head>
     <meta charset="utf-8">
    <title>주문식 햄버거</title>
    <link rel="stylesheet" type="text/css" href="./css/burger-response.css?v=1.3">
  </head>
  <body>

	<p>패티 : <%=  %> 장</p>
	
	<p>패티 굽기 정도 : [1(레어)~5(웰던)] : <%=  %></p>
	
	
	<P>선택한 토핑</P>
	<ul>
 		<%
 		// form의 name="topping" 에 있는 값들을 모두 가져오는 코드
 		String[] toppings = request.getParameterValues("topping");
    	
 		// 이 JSP 스크립틀릿 안에 for문 또는 while문과 out.println(); 을 이용해서
 		// ul태그 안의 li 태그를 동적으로 만들어주는 코드를 작성하세요
    	
 		
    	
 		%>
 	</ul>

	<p>치즈 선택 여부 : <%= 	%></p>
	
	<p>번 타입 : <%= 	%></p>
	
	<p>소스 타입 : <%= 	%></p>

  </body>
</html>