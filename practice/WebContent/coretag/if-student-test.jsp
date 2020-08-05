<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, tagdemo.Student" %>

<%
	//tagdemo 패키지의 Student 클래스 이용해서 샘플 데이터 생성
	ArrayList<Student> studentList = new ArrayList<>();

	studentList.add(new Student("병후", "김", false));
	studentList.add(new Student("효근", "최", false));
	studentList.add(new Student("유경", "오", true));
	studentList.add(new Student("상원", "이", true));

	pageContext.setAttribute("myStudents", studentList);
%>

<html>

<body>
<head>
<title>JSTL core 04</title>
<link rel="stylesheet" href="./style.css">
</head>
	<table>

	<tr>
		<th>성</th>
		<th>이름</th>
		<th>골드회원</th>
	</tr>
	
	<c:forEach var="tempStudent" items="${myStudents}">
		
		<tr>
			<td>${tempStudent.lastName}</td>
			<td>${tempStudent.firstName}</td>
			<td>
			
			<!-- c:if 태그 : JSP 교재 299~301 페이지 상단까지  -->
			
			<c:if test="${tempStudent.goldCustomer}">
				<p>특별할인</p>
			</c:if>
			
			
			<c:if test="${not tempStudent.goldCustomer}">
				<p>일반가격</p>
			</c:if>
			
			
			</td> 
		</tr>
		
	</c:forEach>

	</table>

</body>

</html>
