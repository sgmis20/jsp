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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function(){
		$("#postbutton1").click(function(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		          $("#post1").val(data.postcode1);
		          $("#post2").val(data.postcode2);
		          $("#address").val(data.address);
		        }
		    }).open();
		});
	});
</script>
	<div class="container">
		<h3>다음 우편번호</h3>
		<div class="row">
			<div class="col-sm-3">
				<input type="number" id="post1" name="post1" title="우편번호 앞 자리" class="form-control" />
			</div>
			<div class="col-sm-3">
				<input type="number" id="post2" name="post2" title="우편번호 뒷 자리"	class="form-control" />
			</div>
			<div class="col-sm-6">
				<input type="submit" id="postbutton1" value="postbutton1" class="btn btn-danger" />
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

	</div>
</body>
</html>