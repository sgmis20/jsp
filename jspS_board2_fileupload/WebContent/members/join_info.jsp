<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->


<%-- <%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String userpass = request.getParameter("userpass");
	String username = request.getParameter("username");
	String useremail = request.getParameter("useremail");
%> --%>
<div class="container">
	<h3>FORM BASIC - 가입정보</h3>
	<p>회원가입을 축하드립니다</p>
	<table class="table table-striped">
		<caption></caption>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>${dto.userid}</td>
			</tr>
			<%-- <tr>
				<th scope="row">비밀번호</th>
				<td><%=dto.getUserpass()%></td>
			</tr> --%>
			<tr>
				<th scope="row">이름</th>
				<td>${dto.username}</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>${dto.useremail}</td>
			</tr>
			<tr>
				<th scope="row">주소</th>
				<td>${dto.userpost}</td>
			</tr>
			<tr>
				<th scope="row">가입날짜</th>
				<td>${dto.userdate}</td>
			</tr>
		</tbody>
	</table>
	<div class="form-group text-right">
		<a href="members/login.jsp" class="btn">로그인</a>
		<% out.println("<meta http-equiv='refresh' content='10; url=members/login.jsp'>"); %>
	</div>
</div>


<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@ include file="../inc/footer1.jsp"%>