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
	
	<div class="main_contents container">
		<h3>파일업로드에 사용되는 COS라이브러리</h3>
		<form action="upload.do" method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label for="name">글쓴이 : </label>
				<input type="text" name="name" id="name" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="title">제  목 : </label>
				<input type="text" name="title" id="title" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="uploadFile">파일업로드 : </label>
				<input type="file" name="uploadFile" id="uploadFile" class="form-control">
			</div>
			
			<div class="form-group">
				<input type="submit" value="전송" class="form-control btn btn-danger">
			</div>
			
		</form>
	</div>
	
</body>
</html>