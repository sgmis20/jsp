<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주문식 햄버거</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="./css/burger-response.css?v=1.3">
</head>
	<body>


	<%	 out.println("<h1> 주문하신 햄버거 나왔습니다~ </h1>"); %>

	<!--  번 top -->


	<%
	String bunTop = request.getParameter("bun");
	switch(bunTop){
	case "sesame":
		out.println("<img src=\"./images/bun-top-sesame.png\" alt=\"sesame bun top\">");
		break;
	case "oregano":
		out.println("<img src=\"./images/bun-top-oregano.png\" alt=\"oregano bun top\">");
		break;
	case "pita":
		out.println("<img src=\"./images/bun-top-pita.png\" alt=\"pita bun top\">");
		break;
	}
	%>
	<!--  치즈  -->
	<%
		String cheese = request.getParameter("cheese");
		if (cheese != null) {
			if (cheese.equals("yes")) {
			out.println("<img src=\"./images/cheese.png\" alt=\"cheese\">");
		}
	}
	%>

	<!--  패티 갯수 -->
	<%
	String doneness = "0"+request.getParameter("doneness");
 	int pattyAmount = Integer.parseInt(request.getParameter("amount"));
	int count=0;
	while(count<pattyAmount){
		out.println("<img class=\"patty\" src=\"./images/patty");
		out.println(doneness);
		out.println(".png\" alt=\"patty with doneness\">");
		count++;
	}

    %>

	<!--  선택한 토핑 -->
	<%
 	String[] toppings = request.getParameterValues("topping");
    if (toppings != null) {
 		for(int i=0; i<toppings.length; i++){
 			if(toppings[i].equals("onion")){
 				out.println("<img src=\"./images/onion.png\" alt=\"onion\">");
 			}else if(toppings[i].equals("tomato")){
 				out.println("<img src=\"./images/tomato.png\" alt=\"tomato\">");
 			}else{ // lettuce
 				out.println("<img src=\"./images/lettuce.png\" alt=\"lettuce\">");
 			}
 		}
 	}
 	%>

	<%
	 String sauce = request.getParameter("sauce");
	 out.println("<section class=\"sauce\">");
	 switch(sauce){
		case "ketchup":
			out.println("<img src=\"./images/ketchup.png\" alt=\"ketchup\">");
			break;
		case "mayo":
			out.println("<img src=\"./images/mayo.png\" alt=\"mayo\">");
			break;
		case "mustard":
			out.println("<img src=\"./images/mustard.png\" alt=\"mustard\">");
			break;
		}
	 out.println("</section>");
	 %>

	<!--  번 botton -->
	<%
	String bunBottom = request.getParameter("bun");
	switch(bunBottom){
	case "sesame":
		out.println("<img src=\"./images/bun-bottom-sesame.png\" alt=\"sesame bun bottom\">");
		break;
	case "oregano":
		out.println("<img src=\"./images/bun-bottom-oregano.png\" alt=\"oregano bun bottom\">");
		break;
	case "pita":
		out.println("<img src=\"./images/bun-bottom-pita.png\" alt=\"pita bun bottom\">");
		break;
	}
	%>


	<h2><a href="./form-burger-FINISHED.html">햄버거 다시 주문하기</a></h2>

	</body>
</html>
