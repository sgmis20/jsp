<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<div class="container">
	<h3>FORM BASIC - 내정보</h3>
	<table class="table table-striped">
		<caption></caption>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>${userid}</td>
			</tr>
			<%-- <tr>
				<th scope="row">비밀번호</th>
				<td><%=dto.getUserpass()%></td>
			</tr> --%>
			<tr>
				<th scope="row">이름</th>
				<td>${dto.username }</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>${dto.useremail}</td>
			</tr>
			<tr>
				<th scope="row">우편번호</th>
				<td>${dto.userpost}</td>
			</tr>
			<tr>
				<th scope="row">가입날짜</th>
				<td>${dto.userdate}</td>
			</tr>
		</tbody>
	</table>
	<div class="form-group text-right">
		<a href="<%=request.getContextPath()%>/mupdate_view.do" class="btn" style="height:44px; width:160px">개인정보 수정</a>
	</div>
	<div class="form-group text-right">
		<!-- <a href="members/login_01.jsp" class="btn" style="height:44px; width:160px">회원 탈퇴</a> -->
		<button onclick="javascript:btn('<%=request.getContextPath()%>/mdelete.do')" class="btn" style="height:44px; width:160px">회원 탈퇴</button>
	</div>
</div>

<script>
	function btn(url){
		var check = confirm("정말로 탈퇴하시겠습니까?");
			if(check) {
				location.replace(url);
			}
	}
</script>
<!-- <meta http-equiv="refresh" content="10; url=members/login_01.jsp"> -->

<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@ include file="../inc/footer1.jsp"%>