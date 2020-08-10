<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
<script>
 	function emailcheck(){
		if(jQuery("#email").val()!=""){
			$(".result.e1").html("");
		return false;
		}
 	}
	function titlecheck(){
		if(jQuery("#title").val()!=""){
			$(".result.e2").html("");
		return false;
		}
 	}
	
 	$(function(){
		$("#submit1").click(function(){
			//console.log( typeof (CKEDITOR.instances.content.getData() ));
			
			if(jQuery("#email").val()==""){
				jQuery("#email").focus();
				$(".result.e1").html("이메일을 입력해주세요.");
				return false;
			} else if(jQuery("#title").val()==""){
				jQuery("#title").focus();
				$(".result.e2").html("제목을 입력해주세요.");
				return false;
			} else if(CKEDITOR.instances.content.getData()==""){
				CKEDITOR.instances.content.focus();
				$(".result.e3").html("내용을 입력해주세요.");
				$("#Hcontent").val(CKEDITOR.instances.content.getData());
				return false;
			}
			
			$.ajax({
				url:"../M1Mail",
				type:"post",
				data:{
					  "email" : $("#email").val(),
					  "title" : $("#title").val(),
					  "content" : CKEDITOR.instances.content.getData()
					},
				dataType:"text",
				success:function(mail){
					$("#title").val("");
					$("#email").val("");
					CKEDITOR.instances.content.setData("<p></p>");
					alert("e-mail이 성공적으로 보내졌습니다.")
				},
				error:function(xhr, textStatus, errorThrown){
				}
			});
		});
	});
 
</script>

<script>
	$(function(){
		$("#del").click(function(){
			$("#title").val("");
			$("#email").val("");
			CKEDITOR.instances.content.setData("<p></p>");
		});
	});
</script>

<div class="container">
		<form id="index_mail">
			<fieldset>
				<legend>CONTACT ME</legend>
				<div class="form-group">
					<label for="email">이메일</label> 
					<input type="text" name="sender_name" id="email" onkeyup="emailcheck();" class="form-control" placeholder="e-mail을 입력해 주세요."/>
					<p class="result e1"></p>
				</div>
				<div class="form-group">
					<label for="title">글제목</label> 
					<input type="text" name="sender_title" id="title" onkeyup="titlecheck();" class="form-control" placeholder="제목을 입력해 주세요."/>
					<p class="result e2"></p>
				</div>
				<div class="form-group">
					<input type="hidden" value="1" name="Hcontent" id="Hcontent" />
					<textarea name="sender_content" id="content" onkeyup="contentcheck();" rows="10" class="form-control" placeholder="내용을 입력해 주세요."></textarea>
					<p class="result e3"></p>
					<script>
						// Replace the <textarea id="content"> with a CKEditor
						// instance, using default configuration.
						CKEDITOR.replace('content');
					</script>
				</div>

				<div class="form-group text-right">
					<input type="button" id="submit1" value="보내기" class="btn"/>
					<input type="button" id="del" value="내용 지우기" class="btn"/>
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