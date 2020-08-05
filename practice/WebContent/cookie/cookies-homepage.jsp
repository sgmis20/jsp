<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLDecoder" %>

<html>
<head>
<meta charset="UTF-8" />
<title>쿠키 메인</title>
 <link rel="stylesheet" href="./cookie.css" />
</head>
<body>
<h3>프로그래밍 언어 교재</h3>

<!-- 쿠키 값을 읽어들이는 코드 -->

<%
	// 아직 쿠키가 생성되지 않았을 경우(홈페이지 첫 방문 등)
	// 기본으로 보여줄 기본값을 지정해줌
	String favLang = "Java";

	// request 객체의 getCookies() 메소드를 이용해서
	// Cookie의 값을 가져옴 쿠키가 여러 개일 경우에도 대응해주기 위해서
	// Cookie 클래스를 데이터타입으로 하는 '객체 배열'을 만들어줌
	// 객체 배열의 개념이 생소하다면
	// (자바 교재 4장 실습문제 7번 문제를 보고 관련 내용을 읽고, 풀어보고 오세요)
	Cookie[] cookieArray = request.getCookies();
	
	
	// Cookie의 객체 배열 cookieArray로부터 cookies-personalize-response.jsp 페이지에서
	//	Cookie theCookie = new Cookie("myApp.favoriteLanguage", favLang); 명령문을 통해 생성한
	// Cookie의 인스턴스, 즉 theCookie 객체를 찾아서 거기에 입력된 값인 favLang 변수를 불러오는 코드를 아래와 같이 작성
	
	if (cookieArray != null) {	
		for (Cookie temp : cookieArray) {
			
			// cookieArray 안을 for문으로 탐색하다가  Cookie의 이름이 "myApp.favoriteLanguage" 과 같은 경우 경우 if문을 실행
			
			if (temp.getName().equals("myApp.favoriteLanguage")) {
		        
				// 앞서 cookies-personalize-response.jsp 에서의 favLang = URLEncoder.encode(favLang, "UTF-8");
				// 코드를 통해 인코딩 해준 내용을 출력하기 위해 반대로 디코딩 해주는 코드를 작성 encode <-> decode
		        favLang = URLDecoder.decode(temp.getValue(), "UTF-8");
				
				// UTF-8 인코딩을 이용하지 않을 경우(즉 영문자로만 페이지가 이루어져있을 경우는 아래 코드처럼 간단)
				// 위의 UTF-8 디코딩을 처리해준 후 쿠키 값을 가져오는게 복잡해 보인다면 아래와 비교해보며 차이를 익혀보세요
		        // favLang = temp.getValue();
			}
		}
	}
%>

<!-- 자 이제 favLang 변수(쿠키 설정)를 통해 개인화(personalize)된 페이지를 출력해봅시다  -->
<!-- 여기서는 favLang 변수를 JSP 표현식 안에 출력해주는 형식으로 간단히 개인화된 페이지를 만들어봤습니다 -->

<h4>명품 <%= favLang %> Programming</h4>
<ul>
	<li> <%= favLang %> 코딩에 빠져들게 하는 재미있고 쉬운 해설서</li>
	<li>생능출판</li>
</ul>

<h4><%= favLang %>의 정석</h4>
<ul>
	<li>개발자로 입문하기: 일단 이것부터 읽어보자!</li>
	<li>도우출판</li>
</ul>

<h4>Do it! 프로그래밍 : <%= favLang %>편</h4>
<ul>
	<li>이미 200만명이 이 책으로 프로그래밍을 시작했다!</li>
	<li>이지스퍼블리싱</li>
</ul>

<h4>혼자 공부하는 <%= favLang %> 알고리즘</h4>
<ul>
	<li><%= favLang %> 최신 버전 반영</li>
	<li>한빛미디어</li>
</ul>

<hr>
	<a href="cookies-personalize-form.html">쿠키 설정 페이지로 이동</a>
</body>

</html>
