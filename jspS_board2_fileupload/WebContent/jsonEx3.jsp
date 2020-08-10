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
	<div class="container" style="background-color:pink;" >
		<h4>[3]json3 : onchange json 형식의 파일을 읽어들이기</h4>
		<select id="selectjson" name="selectjson">
			<option value="default d1">[필수] 타입 선택</option>
			<option value="default d2">------------</option>
			<option value="black1">black-1</option>
			<option value="black2">black-2</option>
			<option value="black3">black-3</option>
		</select>
		<div class="result r3">
			<table class="table table-striped">
				<caption>GREEN</caption>
				<thead>
					<tr>
						<th scope="col">name</th>
						<th scope="col">price</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		$(function() {
			$("#selectjson").click(function() {
				$.ajax({
					url : "data/json3.json",
					type : "get",
					dataType : "json",
					success : function(json3) {

						var items = json3.gstore.menu;

						//만약 select값과 json에서 가져온 값이 같다면 
						//$("#selectjson").val()	items[0].cop
						//1.td에 데이터 담기
						//2.tr에 td담기
						//3.화면에 tr담기.
						for (var i = 0; i < items.length; i++) {
							if ($("#selectjson").val() == items[i].cop) {
								var cop = items[i].cop;
								var cnum = items[i].cnum;

								var tr = $("<tr>");
								var td1 = $("<td>").html(cop);
								var td2 = $("<td>").html(cnum);

								tr.append(td1).append(td2);

								$(".result.r3 table tbody").html(tr)
							}
						}
					}
				})
			})
		})
	</script>
	
	<!-- 진목코드 -->
	<!-- <script>
			$(document).ready(function(){
				$("#selectjson").change(function(){
					$(".result.r3 table tbody").empty();
					
					$.ajax({
						url:"data/json3.json",
						type:"post",
						dataType:"json",
						success:function(data){
							console.log(data);
							
							var menu=data.gstore.menu;
							
							for(var i=0; i<menu.length; i++){
								var tr=$("<tr>");
								var tdcop=$("<td>");
								var tdcnum=$("<td>");
								
								console.log("1 : "+$("#selectjson option:selected").val());
								console.log("2 : "+menu[i].cop);
								
								if($("#selectjson option:selected").val()==menu[i].cop){
									tdcop.html(menu[i].cop);
									tdcnum.html(menu[i].cnum);
									tr.append(tdcop).append(tdcnum);
									$(".result.r3 table tbody").append(tr);
									break;
								}
							}
						},
						error:function(){
						}
					});
				});
			});	
		</script> -->
</body>
</html>


























