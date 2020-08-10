<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<div class="container">
	<h3>FORM BASIC - 정보수정</h3>
	<p>(*)은 필수정보입니다.</p>
	<form action="<%=request.getContextPath()%>/mupdate.do" method="post" id="Myupdate">
		<fieldset>
			<legend>정보입력</legend>

			<div class="form-group">
				<label for="username">(*)이름</label> 
				<input type="text" value="${dto.username }" 
					name="username" id="username" class="form-control" disabled />
			</div>
			<div class="form-group">
				<label for="userid">(*)아이디</label> 
				<input type="text" value="${userid}" 
					name="userid" id="userid" class="form-control" disabled />
			</div>
			<div class="form-group">
				<label for="userpass">(*)비밀번호</label> 
				<input type="password" 
					name="userpass" id="userpass" class="form-control" />
			</div>
			<div class="form-group">
				<label for="userpassre">(*)비밀번호 확인</label> 
				<input type="password"
					name="userpassre" id="userpassre" class="form-control" />
			</div>
			<div class="form-group">
				<label for="useremail">(*)이메일</label> 
				<input type="text" value="${dto.useremail }" 
					name="useremail" id="useremail" class="form-control" />
			</div>
			<div class="form-group">
				<div>
					<label for="userpost">(*)우편번호</label>
				</div>
				<div class="col-sm-3">
					<input type="number" id="userpost1" name="userpost1" title="우편번호 앞 자리" class="form-control" />
				</div>
				<div class="col-sm-3">
					<input type="number" id="userpost2" name="userpost2" title="우편번호 뒷 자리"	class="form-control" />
				</div> 
				<div class="col-sm-6">
					<input type="button" id="postbutton" value="우편번호 검색" class="btn btn-black" />
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="form-group col-sm-12">
						<label for="">상세주소</label> 
						<input type="text" id="address" name="address" class="form-control" />
					</div>
					<div class="form-group col-sm-12">
						<input type="text" id="address2" name="address2" title="상세주소 2" class="form-control" />
					</div>
				</div>
			</div>
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
				$(function(){
					$("#postbutton").click(function(){
					    new daum.Postcode({
					        oncomplete: function(data) {
					          $("#userpost1").val(data.postcode1);
					          $("#userpost2").val(data.postcode2);
					          $("#address").val(data.address);
					        }
					    }).open();
					});
				});
			</script>
			

			<div class="form-group">
				<a href="javascript:history.back()" class="btn btn-white form-control">이전</a>
			</div>
			<div class="form-group">
				<input type="submit" value="확인" class="btn btn-white form-control">
			</div>
		</fieldset>
	</form>
</div>
<script>
	jQuery(document).ready(function() {
		jQuery("#Myupdate").submit(function() {
			if (jQuery("#userpass").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#userpass").focus();
				return false;
			} else if (jQuery("#userpassre").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#userpassre").focus();
				return false;
			} else if (jQuery("#useremail").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#useremail").focus();
				return false;
			}
		});
	});
</script>
<%@ include file="../inc/footer1.jsp"%>