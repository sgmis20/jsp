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
		jQuery("#join").submit(function() {
			if (jQuery("#userid").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#userid").focus();
				return false;
			} else if (jQuery("#username").val() == "") {
				alert("공백이 있습니다.");
				jQuery("#username").focus();
				return false;
			} else if (jQuery("#userpass").val() == "") {
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
			
			//최후(submit)중복검사
			/* if (jQuery("#Hduple").val() != 0) {
				alert("아이디 중복검사를 해주세요.")
				jQuery("#userid").focus();
				return false;
			} */
			
			//pass == passre 체크 알림메세지
			if (jQuery("#userpass").val() != (jQuery("#userpassre").val())) {
				alert("비밀번호가 일치하지 않습니다.")
				jQuery("#userpass").focus();
				return false;
			}
		})
	});
</script>
<script>
function duplecheckfunction(){
	if(jQuery("#userid").val()!=""){
		$("#Hduple").val(1);
		$(".result.d1").html("");
	}
}

	$(function(){
		$("#duple").click(function(){
			$.ajax({url:"<%=request.getContextPath()%>/M1Duple",
				type:"post",
				data:{"userid" : $("#userid").val()},
				dataType:"text",
				success:function(idduple){
					if(idduple==0){
						if ($("#userid").val()=="") {
							$(".result.d1").css("color","black");
							$(".result.d1").html("아이디를 입력해주세요.");
							$("#userid").focus();
							$("#Hduple").val(1);
						} else {
							$(".result.d1").css("color","black");
							$(".result.d1").html("사용할 수 있는 아이디 입니다.");
							$("#Hduple").val(idduple);
						}
					} else {
						$(".result.d1").css("color","red");
						$(".result.d1").html("이미 사용중인 아이디 입니다.");
						$("#userid").focus();
						$("#Hduple").val(idduple);
					}
				},
				error:function(xhr, textStatus, errorThrown){
					$(".result.d1").html(textStatus + "HTTP-" + xhr.status + "/" + errorThrown);
				}
			});
		});
	});
</script>
	
<div class="container">
	<h3>FORM BASIC - 회원가입</h3>
	<form action="<%=request.getContextPath()%>/join.do" method="post" id="join" class="form-group">
		<fieldset>
			<legend>필수 입력 정보</legend>
			<p>(*)은 필수입력 사항입니다.</p>
			<label for="userid">(*아이디)</label>
			<div class="form-group">
				<input type="hidden" value="1" name="Hduple" id="Hduple" />
				<input type="text" name="userid" onkeyup="duplecheckfunction();" id="userid" class="form-control col-xs-4" style="width:300px" placeholder="아이디를 입력해 주세요."/>
				<div class="row">
					<div class="col-sm-6">
						<input type="button" id="duple" value="중복확인" class="btn btn-black" /><div class="result d1"></div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="username">(*)이름</label> 
				<input type="text" name="username" id="username" class="form-control" placeholder="이름을 입력해 주세요."/>
			</div>
			<div class="form-group">
				<label for="userpass">(*)비밀번호</label> 
				<input type="password" name="userpass" id="userpass" class="form-control" placeholder="비밀번호를 입력해 주세요."/>
			</div>
			<div class="form-group">
				<label for="userpassre">(*)비밀번호 확인</label> 
				<input type="password" name="userpassre" id="userpassre" class="form-control" placeholder="비밀번호를 다시 입력해 주세요."/>
			</div>
			<div class="form-group">
				<label for="useremail">(*)이메일</label> 
				<input type="text" name="useremail" id="useremail" class="form-control" placeholder="e-mail을 입력해 주세요."/>
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
				<a href="javascript:history.go(-1)" class="form-control btn">이전</a>
				<!-- <input type="submit" value="이전" class="form-control btn"> -->
			</div>
			<div class="form-group">
				<input type="submit" value="확인" class="form-control btn">
			</div>
		</fieldset>
	</form>
</div>

<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@ include file="../inc/footer1.jsp"%>