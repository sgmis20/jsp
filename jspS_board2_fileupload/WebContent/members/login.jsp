<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<script>
	jQuery(document).ready(function() {
		jQuery("#login").submit(function() {
			if (jQuery("#userid").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#userid").focus();
				return false;
			} else if (jQuery("#userpass").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#userpass").focus();
				return false;
			}
		})
	})
</script>

<%
	//1.userid 초기값 ""지정
	String userid = "";
	String remem = "";
	//2.쿠키존재여부 확인
	String cookie = request.getHeader("Cookie");

	int a = 0;
	if (cookie != null) {
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			/*if (cookies[i].getValue().equals("remem")) {
				userid = cookies[i - 1].getValue();
				a = 1;
			} */
			//선생님 코드
			if(cookies[i].getValue().equals("remem")){
				remem=cookies[i].getValue();
				a=1;
			}
			if(cookies[i].getName().equals("userid")){
				userid=cookies[i].getValue();
			}
		}
	}
%>

<div class="container">
	<h3>FORM BASIC - 로그인</h3>
	<form action="<%=request.getContextPath()%>/login.do" method="post" id="login">
		<label for="userid">USERID : </label>
		<div class="form-group">
			<input type="text" value="<%if (a == 1) {%><%=userid%><%}%>" name="userid" id="userid" class="form-control" placeholder="아이디를 입력해주세요." />
		</div>
		<label for="userpass">USERPASS : </label>
		<div class="form-group">
			<input type="password" name="userpass" id="userpass" class="form-control" placeholder="패스워드를 입력해주세요." />
		</div>
		<div class="form-group">
			<input type="checkbox" name="remem" id="remem" value="remem" <%if (a == 1) {%> checked <%}%> /> 
			<label for="remem">아이디 저장하기</label>
		</div>
		<div class="form-group text-right">
			<input type="submit" id="button" value="로그인" class="btn"> 
			<a href="join.jsp" class="btn">회원가입</a>
		</div>
	</form>
</div>
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@ include file="../inc/footer1.jsp"%>