<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  include file="../inc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->

<div class="container  myboard">
	<h3>BOARD - BASIC</h3>
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
					<td>${listcount1p-pstartno1-status.index}</td>
					<td><a href="<%=request.getContextPath() %>/detail.do?bno=${list1.bno}">${list1.btitle}</a></td>
					<td>${list1.bname}</td>
					<td>${list1.bdate}</td>
					<td>${list1.bhit}</td>
				</tr>
			</c:forEach>	
		</tbody>
		<tfoot>
			<tr class="text-right">
				<td colspan="5"><a
					href="<%=request.getContextPath()%>/write_view.do" class="btn">글쓰기</a>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<div class="text-center">
		<c:choose>
			<c:when test="${current_page1<=pagetotal1}">
				<c:if test="${current_page1>=11}"> <a href="<%=request.getContextPath()%>/list.do?pstartno1=${pstartno1-10}">[이전]</a> </c:if>
				<c:forEach var="listindex" begin="${start_page1}" end="${pagetotal1}" step="1" varStatus="status">
					<c:if test="${status.index<=end_page1}"> <a href="<%=request.getContextPath()%>/list.do?pstartno1=${(status.index*10)-10}">${listindex}</a> </c:if>
				</c:forEach> 
				<c:if test="${listcount1p>100}"> <a href="<%=request.getContextPath()%>/list.do?pstartno1=${end_page1*10}">[다음]</a> </c:if>
			</c:when>
			<c:otherwise>
				<script>alert("마지막 페이지입니다.")</script>
				<c:if test="${current_page1>=11}"> <meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>/list.do?pstartno1=${listcount1p-10}"> </c:if>
			</c:otherwise>
		</c:choose>
	</div>
	
</div>
<!-- CONTAINER END -->

<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@  include file="../inc/footer.jsp"%>