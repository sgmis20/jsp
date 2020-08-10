<%@page import="com.company.dto.Board1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  include  file="../inc/header.jsp" %>
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<!-- Header -->
<%
	Board1 dto = (Board1) request.getAttribute("dto");
%>
			<div class="container  myboard">
				<h3>QNA 상세보기</h3>
				 
					<input type="hidden" name="bId" value="">
					<div class="panel ">
					  <div  class="panel-heading"> <span class="glyphicon glyphicon-plus">HIT</span></div>
					  <div  class="panel-body"><%=dto.getBhit()%></div>
					</div>						
					<div class="panel"  >
					  <div  class="panel-heading"><span class="glyphicon glyphicon-plus">NAME</span></div>
					  <div  class="panel-body"><%=dto.getBname()%> </div>
					</div>	
					<div class="panel"  >
					  <div  class="panel-heading"><span class="glyphicon glyphicon-plus">TITLE</span></div>
					  <div  class="panel-body"><%=dto.getBtitle()%> </div>
					</div>	
					<div class="panel"  >
					  <div  class="panel-heading"> <span class="glyphicon glyphicon-plus">CONTENT</span></div>
					  <div  class="panel-body"><%=dto.getBcontent().replace("<br>", "\r\n")%></div>
					</div>
						
					<div class="row  text-right">
						 <a href="<%=request.getContextPath()%>/pass_view.do?bno=<%=dto.getBno()%>&bcommand=update_view.do"   class="btn" >수정</a> 
						 <a href="<%=request.getContextPath()%>/pass_view.do?bno=<%=dto.getBno()%>&bcommand=delete.do"   class="btn" >삭제</a>
						 <a href="<%=request.getContextPath()%>/list.do"  class="btn" >목록보기</a> 
					</div>	
			</div>
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<!-- Footer -->
<%@  include  file="../inc/footer.jsp" %>