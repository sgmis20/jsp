<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>To to List</title>
<style>
body {
	background-color: #004643;
	color: #e8e4e6;
	font-size: 22px;
	font-weight: bold;
}

li {
	color: #f9bc60;
	font-size: 18px;
}
</style>
</head>

<body>

<!-- 1단계 HTML 폼 만들기  -->

<form action = "session-todo.jsp">
	<span>새로운 할 일 추가 : </span>
	<input type= "text" name = "userInput" />
	<input type="submit" value="추가" />
</form>

<%-- 참고사항 : 입력된 항목을 확인하는 코드 : <%= request.getParameter("userInput") %> --%> 



<!-- 2단계  To Do 리스트에 새로운 항목 추가하기 -->

<%
	// 바로 아래 코드가 다운캐스팅 할 때 type check해주는 코드를 작성해주지 않아서
	// 잠재적으로 오류가 발생할 위험을 알리기 위해 뜨는 이클립스의 노란색 주의표시가 신경쓰인다면
	//@SuppressWarnings("unchecked") // ← 이 어노테이션을 주석해제 처리해서 이용하면 됩니다
	
	// To Do 리스트들을 (Tomcat이 자동으로 생성한) 세션으로부터 가져오는 코드 작성
	ArrayList<String> items = (ArrayList<String>)session.getAttribute("myToDoList");

	
	if (items == null) { // 만일 To Do 리스트가 존재하지 않으면, 
		
		//새로운 항목을 만들어 주기 (즉, To do 리스트가 비어있는 경우, 최초 1회)
		items = new ArrayList<String>();
		// 세션 객체의 setAttribute(name, value) 메소드를 이용해서
		// myToDoList 라는 이름을 지어주고 items를 그 값으로 지정해서 세션에 set 해줍니다
		// (items는 여기서 ArrayList이나, 클래스의 객체가 올 수도 있고 다른 유형의 자료구조가 와도 무방함)
		session.setAttribute("myToDoList", items); // 
	}
	
	
	// 추가될 form 데이터가 있는지 체크하기 위해 form 양식에서 name의 속성 값이 userInput인
	// input 태그에 입력된 사용자 입력값을 가져오는 request.getParameter() 메소드를 이용
	String userInput = request.getParameter("userInput");
	
	// userInput 이 null 이 아니면서
	// trim() 메소드를 통해 String 의 맨 앞과 뒤의 공백을 제거했을 때의 값이 "" 즉, 공란이 아닐 때
	// (null 과 "" 일때의 두 가지 경우를 동시에 제외하면 userInput에 사용자가 무언가를 입력했다는 것)
	if (userInput != null && !userInput.trim().equals(""))  {
		// ArrayList items 에 userInput을 추가해줌
		items.add(userInput);
	}
	
%>

<!-- 3단계 모든 To Do 항목 들을 세션으로부터 가져와 화면에 출력하기 -->
<hr>
	<h3>To Do 리스트 </h3>
<br/>

<ol>
	<%
	for(String print : items){
		out.println("<li>" + print + "</li>");
	}
	%>
</ol>


</body>

</html>