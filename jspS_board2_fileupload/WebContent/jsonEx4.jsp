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
		<div class="row">
		
			<h4>[4] json4 : #text4 버튼 클릭하면 json형식의 파일 읽어들이기</h4>
			
			<div class="form-group">
				<input type="button" id="text4" value="text4" class="btn btn-white"/>
			</div>
			<div class="form-group" style="background-color:pink">
				<div class="result r1  container">
					
				</div>
			</div>
		</div><!-- row -->
	</div><!-- container -->
	
	<script>
	
		$(function(){
			$("#text4").click(function(){
				$.ajax({
					url : "data/json4.json",
					type : "get",
					dataType : "json", 
					success : function(json){
						//data받기
						var items = json.herostore.menu;
						
						//반복
						for(var i=0; i<items.length; i++){
						
						//데이터 변수에 담기
						var name = items[i].name;
						var year = items[i].year;
						var character = items[i].character;
						var img = items[i].img;
						
						//로그 체크
						console.log(name)
						console.log(year)
						console.log(character)
						console.log(img)
						
						//폼 기본단위 제작
						var div_row = $("<div class='row'>")
						var div_col1 = $("<div class='col-sm-6'>")
						var p1 = $("<p>").html(name);
						var p2 = $("<p>").html(year);
						var p3 = $("<p>").html(character);
						var div_col2 = $("<div class='col-sm-6'>")
						var img1 = $("<img src='images/"   + img +  "'alt='' style='width:90%' />");
						
						//제작된 폼 조립
						div_col1.append(p1).append(p2).append(p3)
						div_col2.append(img1)
						div_row.append(div_col1).append(div_col2)
						
						//출력테그에 조립된 완성품 담기
						$(".result.r1").append(div_row);
						
						//$("#selectjson").val()	items[0].cop
						//1.td에 데이터 담기
						//2.tr에 td담기
						//3.화면에 tr담기.
						}
						
					},
					error : function(){
						
						
					} 
				})					
			})
		})
	
	</script>

</body>
</html>