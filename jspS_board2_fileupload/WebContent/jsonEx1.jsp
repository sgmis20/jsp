<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h3> AJAX </h3>
		<p><input type="button" id="json1" value="json1"/></p>
		<div class="result r1"></div>
		
		<script>
			$(function(){
				$("#json1").click(function(){
					$.ajax({
						url		:"data/json1.json",
						type	:"get",
						dataType:"json",
						success:function(data){
							console.log(data);
							//1.데이터 추출
							var name= data.name; var age= data.age;
							
							//2.html 엘리먼트 동적생성
							var p1 = $("<p>").html(name);
							var p2 = $("<p>").html(age);
							
							//3.화면에 보여주기
							$("result.r1").append(p1).append(p2);
							
						},
						error:function(xhr, textStatus, errorThrown){$(".result.r1").html(textStatus + "(HTTP-" + xhr.status + "/"+erroThrown)}	
					})
				})
			});
		</script>
	</div>

</body>
</html>