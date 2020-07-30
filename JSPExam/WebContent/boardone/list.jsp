<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="boardone.BoardDAO" %>    
<%@ page import="boardone.BoardVO" %>    
<%@ page import="java.util.List" %>    
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ include file="view/color.jsp" %>

<%!
// 한 페이지에 보여줄 목록 수를 지정
 int pageSize = 5;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%

    String pageNum = request.getParameter("pageNum");
    
    if( pageNum == null) {
    	pageNum ="1";
    }
    
    // 현재페이지
    int currentPage = Integer.parseInt(pageNum);
    int startRow =(currentPage - 1 ) * pageSize + 1;
    int endRow = currentPage * pageSize;
    
    
 int count =0;
int number =0;
List<BoardVO> articleList = null;
BoardDAO dbPro = BoardDAO.getInstance();
count = dbPro.getArticleCount();// 전체 글수

if( count > 0) {
	articleList = dbPro.getArticles(startRow, endRow);
}

number = count - (currentPage -1) * pageSize;

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시판 </title>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="<%=bodyback_c %>">
<div align="center"><b>글 목록(전체 글:<%=count %>)</b>

<table width="700">
    <tr>
         <td align="right" bgcolor="<%=value_c %>">
            <a href="writeForm.jsp">글쓰기</a>
         </td>
    </tr>
</table>
<%
    if(count == 0) {
%>

<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
   <td align="center">
     게시판에 저장된 글이 없습니다.
   </td>
</tr>
</table>
<% } else { %>

<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">

     <tr height="30" bgcolor="<%=value_c %>">
       <td align="center" width="50">번호</td>
       <td align="center" width="250">제목</td>
       <td align="center" width="100">작성자</td>
       <td align="center" width="150">작성일</td>
       <td align="center" width="50">조회</td>
       <td align="center" width="100">IP</td>
     </tr>
   
   <%
        for(int i = 0; i<articleList.size(); i++) {
           BoardVO article = (BoardVO)articleList.get(i);
   %>
   
   <tr height="30">
       <td align="center" width="50"><%=number-- %></td>
       <td width="250">
       
       <%
          int wid=0;
          
          if(article.getDepth() > 0) {
        	  wid = 5 * (article.getDepth());
      %> 
        <img src="img/level.gif" width="<%=wid %>" height="16">
        <img src="img/re.gif"> 
      <%  }  else { %>    
       <img src="img/level.gif" width="<%=wid %>" height="16">
      <% } %>
     
       <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
         <%=article.getSubject() %></a>
         <%if(article.getReadcount() >= 20) { %>
         <img src="img/hot.gif" border="0" height="16">
         <%} %>
       </td>
       
       <td align="center" width="100">
          <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter() %></a></td>
       <td align="center" width="150">
             <%=sdf.format(article.getRegdate()) %></td>     
             
        <td align="center" width="50"><%=article.getReadcount() %></td>     
        <td align="center" width="100"><%=article.getIp() %></td>
   </tr>
<%} %>
</table>
<%} %>

<%

 if(count > 0) {
	 
	 int pageBlock = 5;
	 int imsi = count % pageSize == 0 ? 0 : 1;
	 int pageCount = count / pageSize + imsi;
	 
	 int startPage =(int)((currentPage-1)/pageBlock) * pageBlock + 1;
	 int endPage = startPage + pageBlock - 1;
	 
	 if(endPage > pageCount) endPage = pageCount;
	 
	 if(startPage > pageBlock) { 
 %>
<a href="list.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>	 

<%	 
 } 
	 for(int i=startPage; i<=endPage; i++) {
%>
<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>

<% } 
   if(endPage < pageCount) {
%>
<a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
<%
   }
 }
%>
</div>
</body>
</html>










