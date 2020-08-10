<%@page import="com.company.dto.Board2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  include  file="../inc/header.jsp" %>
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
			<div class="container  myboard">
			
				<h3>QNA 상세보기</h3>
					<div class="panel">
					  <div  class="panel-heading"> <span class="glyphicon glyphicon-plus">HIT</span></div>
					  <div  class="panel-body">${dto.bhit}</div>
					</div>						
					<div class="panel">
					  <div  class="panel-heading"><span class="glyphicon glyphicon-plus">NAME</span></div>
					  <div  class="panel-body">${dto.bname}</div>
					</div>
					<div class="panel">
					  <div  class="panel-heading"><span class="glyphicon glyphicon-plus">TITLE</span></div>
					  <div  class="panel-body">${dto.btitle}</div>
					</div>	
					<div class="panel">
					  <div  class="panel-heading"> <span class="glyphicon glyphicon-plus">CONTENT</span></div>
					  <div  class="panel-body">${dto.bcontent}</div>
					</div>	
					<div class="panel">
					  <div  class="panel-heading"> <span class="glyphicon glyphicon-plus">FILE</span></div>
					  <div  class="panel-body"><a href="/upload/${dto.bfile}"><img src="/upload/${dto.bfile}" width="900"/></a></div>
					</div>
					<div class="row  text-right">
						 <a href="<%=request.getContextPath()%>/pass_view2.do?bno=${dto.bno}&bcommand=update_view2.do"   class="btn" >수정</a> 
						 <a href="<%=request.getContextPath()%>/pass_view2.do?bno=${dto.bno}&bcommand=delete2.do"   class="btn" >삭제</a>
						 <a href="<%=request.getContextPath()%>/list2.do"  class="btn" >목록보기</a>
					</div>	
			</div>
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@  include  file="../inc/footer.jsp" %>