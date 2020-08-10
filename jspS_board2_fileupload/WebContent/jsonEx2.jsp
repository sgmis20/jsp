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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

	<div class="container">
		<h3>Ajax2</h3>
		<p><input type="button" id="json2" value="json2"/></p>
		<div class="result r2">
			<table class="table table-striped">
					<caption>ajax예제</caption>
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">나이</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
			<!-- <p class="result r2"></p> -->
		<script>
		
			$(function(){
				$("#json2").click(function(){
					$.ajax({
						url		:"data/json2.json",  //1.받는다.
						type	:"get",				 //2.방식
						datatype:"json",			 //3.데이터 타입
						success : function(data){	 //4.(123 성공하면 작동시켜라 (data에 1번에서 받아온 데이터를 넣어라.)
							console.log(data);		 //5.data를 크롬 f12 콘솔에 로그로 찍어라.
							console.log(data.menu[0].name);		//6.데이터 안에있는 배열[0]의 name을 찍어라.
							console.log(data.menu[0].age);		//7.데이터 안에있는 배열[0]의 age를 찍어라.
							////////////////////////////////////////
							/*
								menus[0] = {name:"sally" , age:"3"}
								menus[1] = {name:"gildong" , age:"5"}
								menus[0].name	menus[0].age
								menus[1].name	menus[1].age
							*/
							//1.데이터 추출
							var menus=data.menu;

							//2.html엘리먼트 동적생성 - html덮기
							for(var i=0; i<menus.length; i++){
								var name=menus[i].name;
								var age=menus[i].age;
							
								var tr = $("<tr>");
								var td1 = $("<td>").html(name);
								var td2 = $("<td>").html(age);
	
								tr.append(td1).append(td2);
								
								//3.화면에 보이기
								$(".result.r2 table tbody").append(tr);
							}
						},
						error:function(xhr, textStatus, errorThrown){$(".result.r2").html(textStatus + "(HTTP-" + xhr.status + "/"+errorThrown)
						}
					})
				})
			})
		
		</script>
		
		
		
		
		
		
		
		
		
		
		
	</div>
	
</body>
</html>