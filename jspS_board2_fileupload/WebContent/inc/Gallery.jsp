<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<c:forEach var="list" items="${list}" varStatus="status">
		<tr>
			<td>${listcount - status.index}</td>
			<td><a
				href="<%=request.getContextPath() %>/detail2.do?bno=${list.bno}">${list.btitle}</a></td>
			<td>${list.bname}</td>
			<td>${list.bdate}</td>
			<td>${list.bhit}</td>
		</tr>
	</c:forEach>
</div>
