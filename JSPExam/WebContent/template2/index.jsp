<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String pagefile=request.getParameter("page");
     if(pagefile==null){ pagefile="newitem";}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

    table {
    margin: auto;
    width: 90vw;
    height: 85vh;
    color: rgb(80, 2, 22);
    border: 1px solid aliceblue;
    background-color: blanchedalmond;
    border-radius: 20px;
    }
    
    body, a{
    font-weight: 900;
    color: rgb(26, 81, 119);
    text-decoration: none
    }
    
    a{
    margin-top: 3vh;
    margin-left: 1.5vw;
    }
    
    

</style>
</head>
<body>

<table>
    <tr>
         <td height="20" colspan="3" align="left">
             <jsp:include page="top.jsp" />
         </td>
    </tr>
    
    <tr>
        <td width="22%" align="right" valign="top"><br>
              <jsp:include page="left.jsp" />
        </td>
    
        <td colspan="2" align="center">
             <jsp:include page='<%=pagefile+".jsp" %>' />
        </td>
    
    </tr>
    
    <tr>
       <td width="100%" height="40" colspan="3">
             <jsp:include page="bottom.jsp" />
       </td>
    </tr>


</table>

</body>
</html>