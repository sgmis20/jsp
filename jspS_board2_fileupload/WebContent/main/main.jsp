<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  include file="../inc/header.jsp"%>
<body>
	<!-- 슬라이더 start -->
	<!-- 슬라이더 start -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:forEach var="listslider" items="${best2}" begin="0" end="4" varStatus="status">
				<c:choose>
					<c:when test="${status.index==0}">
						<div class="item active">
							<img src="/upload/${listslider.bfile}" alt="Chania">
							<div class="carousel-caption">
								<h3>${listslider.btitle}</h3>
								<p>${listslider.bcontent}</p>
							</div>
						</div>
					</c:when>
					<c:when test="${status.index!=0}">
						<div class="item">
							<img src="/upload/${listslider.bfile}" alt="Chania">
							<div class="carousel-caption">
								<h3>${listslider.btitle}</h3>
								<p>${listslider.bcontent}</p>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 슬라이더 end -->
	<!-- 슬라이더 end -->
	
	<!-- 써치 start -->
	<!-- 써치 start -->
	<div class="container">
		<h3>MOVIE SEARCH</h3>
		<input type="search" name="search" id="search"
			class="form-control form-group" />
		<p id="test"></p>
		<script>
				$(function(){
					$("#search").on("keyup",function(e){
						var usersearch = $(this).val();
						$.ajax({
							url:"<%=request.getContextPath()%>/search.do",
							type     : "get",
							dataType : "text",
							data     : {"usersearch" : usersearch},
							success  : function(text) {
								if ($("#search").val() == "") {
									$(".a3").html("");
								} else {
									console.log(text)
									var dtolist = text.split("\n");
									$(".a3").html(text);
								}
							}, error : function() {}
						});
					});
				});
		</script>
		<p class="a3">
	</div>
	<!-- 써치 end -->
	<!-- 써치 end -->

	<!-- 갤러리 start -->
	<!-- 갤러리 start -->
	<div class="container  myboard">
		<input type="hidden" id="hidden" value="<%=request.getAttribute("a")%>">
		<div class="form-group">
		<c:forEach var="listgallery" items="${list2p}" varStatus="status">
			<div class="col-sm-3">
				<div class="thumbnail">
					<!-- <div style="border: 1px solid gold; padding: 10px; height: 150px;"> -->
					<img src="/upload/${listgallery.bfile}" alt="Paris" width="400" height="300">
					<p><strong>${listgallery.btitle}</strong></p>
					<p>${listgallery.bcontent}</p>
					<button class="btn" data-toggle="modal" data-target="#myModal">BuyTickets</button>
				</div>
			</div>
		</c:forEach>
		</div>
		
	</div>
	<div class="text-center">
			<c:choose>
				<c:when test="${current_page2<=pagetotal2}">
					<c:if test="${current_page2>=11}"> <a href="<%=request.getContextPath()%>/index.do?pstartno2=${pstartno2-10}">[이전]</a> </c:if>
					
					
					
					<c:forEach var="listindex" begin="${start_page2}" end="${pagetotal2}" step="1" varStatus="status">
						<c:if test="${status.index<=end_page2}"> <a href="<%=request.getContextPath()%>/index.do?pstartno2=${(status.index*10)-10}">${listindex}</a> </c:if>
					</c:forEach> 
					<c:if test="${listcount2p>100}"> <a href="<%=request.getContextPath()%>/index.do?pstartno2=${end_page2*10}">[다음]</a> </c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${current_page2>=11}"> <meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>/index.do?pstartno2=${listcount2p-10}"> </c:if>
				</c:otherwise>
			</c:choose>
		</div>
	<!-- 갤러리 end -->
	<!-- 갤러리 end -->

	<!-- MVCBOARD start -->
	<!-- MVCBOARD start -->
	<div class="container  myboard">
		<div class="row">

			<!-- MVC1 start -->
			<!-- MVC1 start -->
			<div class="col-sm-6 ">
				<h3>BASIC - board</h3>
				<table class="table table-stripped">
					<caption>MULTIBOARD</caption>
					<colgroup>
						<col style="width: 15%" />
						<col style="width: 40%" />
						<col style="width: 10%" />
						<col style="width: 25%" />
						<col style="width: 10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">TITLE</th>
							<th scope="col">WRITER</th>
							<th scope="col">DATE</th>
							<th scope="col">HIT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list1" items="${list1p}" varStatus="status">
							<tr>
								<%-- <td>${listcount - status.index}</td> --%>
								<td>${listcount1p-pstartno1-status.index}</td>
								<td><a href="<%=request.getContextPath() %>/detail2.do?bno=${list1.bno}">${list1.btitle}</a></td>
								<td>${list1.bname}</td>
								<td>${list1.bdate}</td>
								<td>${list1.bhit}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="text-right">
							<td colspan="5"> 
								<a href="<%=request.getContextPath()%>/write_view.do" class="btn">글쓰기</a>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<div class="text-center">
					<c:choose>
						<c:when test="${current_page1<=pagetotal1}">
							<c:if test="${current_page1>=11}"> <a href="<%=request.getContextPath()%>/index.do?pstartno1=${pstartno1-10}">[이전]</a> </c:if>
							<c:forEach var="listindex" begin="${start_page1}" end="${pagetotal1}" step="1" varStatus="status">
								<c:if test="${status.index<=end_page1}"> <a href="<%=request.getContextPath()%>/index.do?pstartno1=${(status.index*10)-10}">${listindex}</a> </c:if>
							</c:forEach> 
							<c:if test="${listcount1p>100}"> <a href="<%=request.getContextPath()%>/index.do?pstartno1=${end_page1*10}">[다음]</a> </c:if>
						</c:when>
						<c:otherwise>
							<script>alert("마지막 페이지입니다.")</script>
							<c:if test="${current_page1>=11}"> <meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>/index.do?pstartno1=${listcount1p-10}"> </c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- MVC1 end -->
			<!-- MVC1 end -->

			<!-- MVC2 start -->
			<!-- MVC2 start -->
			<div class="col-sm-6 ">
				<h3>BASIC - Gallery board</h3>
				<table class="table table-stripped">
					<caption>MULTIBOARD</caption>
					<colgroup>
						<col style="width: 15%" />
						<col style="width: 40%" />
						<col style="width: 10%" />
						<col style="width: 25%" />
						<col style="width: 10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">TITLE</th>
							<th scope="col">WRITER</th>
							<th scope="col">DATE</th>
							<th scope="col">HIT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list2" items="${list2p}" varStatus="status">
							<tr>
								<%-- <td>${listcount - status.index}</td> --%>
								<td>${listcount2p-(pstartno2)-status.index}</td>
								<td><a href="<%=request.getContextPath() %>/detail2.do?bno=${list2.bno}">${list2.btitle}</a></td>
								<td>${list2.bname}</td>
								<td>${list2.bdate}</td>
								<td>${list2.bhit}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="text-right">
							<td colspan="5">
								<a href="<%=request.getContextPath()%>/write_view2.do" class="btn">글쓰기</a>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<div class="text-center">
					<c:choose>
						<c:when test="${current_page2<=pagetotal2}">
							<c:if test="${current_page2>=11}"> <a href="<%=request.getContextPath()%>/index.do?pstartno2=${pstartno2-10}">[이전]</a> </c:if>
							<c:forEach var="listindex" begin="${start_page2}" end="${pagetotal2}" step="1" varStatus="status">
								<c:if test="${status.index<=end_page2}"> <a href="<%=request.getContextPath()%>/index.do?pstartno2=${(status.index*10)-10}">${listindex}</a> </c:if>
							</c:forEach> 
							<c:if test="${listcount2p>100}"> <a href="<%=request.getContextPath()%>/index.do?pstartno2=${end_page2*10}">[다음]</a> </c:if>
						</c:when>
						<c:otherwise>
							<script>alert("마지막 페이지입니다.")</script>
							<c:if test="${current_page2>=11}"> <meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>/index.do?pstartno2=${listcount2p-10}"> </c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- MVC2 end -->
			<!-- MVC2 end -->

		</div>
	</div>
	<!-- MVCBOARD end -->
	<!-- MVCBOARD end -->

</body>
<%@  include file="../inc/footer.jsp"%>