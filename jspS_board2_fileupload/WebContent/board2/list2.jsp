<%@page import="com.company.dto.Board2"%>
<%@page import="com.company.dto.Board1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->

<%
	if (request.getAttribute("a") != null) {
%>
<script>
	alert("게시물이 작성됐습니다.")
</script>
<%
	}
%>

<div class="container  myboard">
	<h3>BASIC - BOARD2</h3>
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
			
			
			
			<%-- <%int[] a = {10,9,8,7,6,5,4,3,2,1}; 
				request.setAttribute("a", a);%> --%>
			<c:forEach var="list2" items="${list2p}" begin="0" end="10" step="1" varStatus="status">
				<tr>
					<%-- <td>${((pstartno2+10)*status.index)}</td> --%>
					<%-- <td>${pstartno2*status.index}</td> --%>
					<%-- <td>${list2.bno}</td> --%>
					<%-- 선생님 방법 : <td>${listcount2p-status.index-((current_page2-1)*onepagelimit2)}</td> --%>
					<td>${listcount2p-pstartno2-status.index}</td>
					<td><a href="<%=request.getContextPath()%>/detail2.do?bno=${list2.bno}">${list2.btitle}</a></td>
					<td>${list2.bname}</td>
					<td>${list2.bdate}</td>
					<td>${list2.bhit}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="text-right">
				<td colspan="5"><a
					href="<%=request.getContextPath()%>/write_view2.do" class="btn">글쓰기</a>
				</td>
			</tr>
		</tfoot>
	</table>

	<div class="text-center">
		<c:choose>
			<c:when test="${current_page2<=pagetotal2}">
				<!-- 내방법 start -->
				<c:if test="${current_page2>=11}"> <a href="<%=request.getContextPath()%>/list2.do?pstartno2=${pstartno2-10}">[이전]</a> </c:if>
				<!-- 내방법 end -->
				
				<%-- <!-- 선생님방법 [이전] start -->
				<c:if test="${start_page2>=bottomlist2}">
					<c:set var="prev" value="${(start_page2-2)*onepagelimit2 }"/>
				 	<a href="<%=request.getContextPath()%>/list2.do?pstartno2=${prev}">[이전]</a> 
				 </c:if>
				<!-- 선생님방법 [이전] end --> --%>
				
				<c:forEach var="listindex" begin="${start_page2}" end="${pagetotal2}" step="1" varStatus="status">
					<c:if test="${status.index<=end_page2}"> <a href="<%=request.getContextPath()%>/list2.do?pstartno2=${(status.index*10)-10}">${listindex}</a> </c:if>
				</c:forEach>
				
				<%-- <!-- 내방법 start --> 
				<c:if test="${listcount2p>100}"> <a href="<%=request.getContextPath()%>/list2.do?pstartno2=${end_page2*10}">[다음]</a> </c:if>
				<!-- 내방법 end -->  --%>
				
				<!-- 선생님 방법 [다음] start -->
				<c:if test="${pagetotal2 > end_page2}">
					<c:set var="test" value="${end_page2*onepagelimit2}"/> 
					<a href="<%=request.getContextPath()%>/list2.do?pstartno2=${test}">[다음]</a> 
				</c:if>
				<!-- 선생님 방법 [다음] end -->
				
			</c:when>
			<c:otherwise>
				<script>alert("마지막 페이지입니다.")</script>
				<c:if test="${current_page2>=11}"> <meta http-equiv="refresh" content="0; url=<%=request.getContextPath()%>/list2.do?pstartno2=${listcount2p-10}"> </c:if>
			</c:otherwise>
		</c:choose>
		<p>list2p : ${list2p}</p>
		<p>listcount2p : ${listcount2p}</p>
		<p>onepagelimit2 : ${onepagelimit2}</p>
		<p>pagetotal2 : ${pagetotal2}</p>
		<p>bottomlist2 : ${bottomlist2}</p>
		<p>pstartno2 : ${pstartno2}</p>
		<p>current_page2 : ${current_page2}</p>
		<p>start_page2 : ${start_page2}</p>
		<p>end_page2 : ${end_page2}</p>
	</div>
	
	<!-- 선생님 방법 페이징 -->
	<div class="text-center">
			
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