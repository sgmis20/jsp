<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>

<html>
<head>
<title>cookie 확인</title>
<link rel="stylesheet" href="./cookie.css" />
</head>
<body>
<%
	// form 데이터 읽어들이기
	String favLang = request.getParameter("favoriteLanguage");

	// java.net.URLEncoder (net 패키지의 URLEncoder 클래스를 최상단에 import 해준 뒤)
	// cookie 데이터를 UTF-8로 인코딩해주는 코드
	favLang = URLEncoder.encode(favLang, "UTF-8");

	// cookie 생성 new Cookie(name, value)
	// 예시: name : "kanji.myClass", value : "hiroko"
	Cookie theCookie = new Cookie("myApp.favoriteLanguage", favLang);
	
	
	// 쿠키의 수명을 지정해줍니다. 파타미터는 int 값으로 '초' 단위 이므로
	// 일반적인 쿠키의 수명인 1년을 지정해주기 위해 아래와 같이 입력
	theCookie.setMaxAge(60*60*24*365);
	
	// 생성한 쿠키를 브라우저로 전달
	// (response 객체의 addCookie() 메소드를 이용해서)
	response.addCookie(theCookie);
%>



	<p>선호하는 프로그래밍 언어를 <%= favLang %> 로(으로) 설정했습니다</p>
	
	<a href="cookies-homepage.jsp">메인페이지로 돌아가기</a>
	
</body>

</html>








