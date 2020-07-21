<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String id="",
    		passwd="",
    		name="",
    		mem_num1="",
    		mem_num2="",
    		e_mail="",
    		phone="",
    		zipcode="",
    		address="",
    		job="";
    
    int counter = 0;
    
    try {
        con =DriverManager.getConnection(
        		"jdbc:oracle:thin:@localhost:1521:orcl",
        		"scott", "tiger");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from tempmember");
   
   %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
 <h2> JSP에서 데이터베이스 연동 </h2><br><br>
 <h3> 회원정보 </h3>
 <table bordercolor="#0000FF" border="1">
 <tr>
    <td><strong>ID</strong></td>
    <td><strong>PASSWD</strong></td>
    <td><strong>NAME</strong></td>
    <td><strong>MEM_NUM1</strong></td>
    <td><strong>MEM_NUM2</strong></td>
    <td><strong>E_MAIL</strong></td>
    <td><strong>PHONE</strong></td>
    <td><strong>ZIPCODE/ADDRESS</strong></td>
    <td><strong>JOB</strong></td>
 </tr>
 
 
 
 
 
 
 </table><br><br>
 
 total records : <%=counter %>
 <%
    }catch(SQLException sq) {
    	sq.printStackTrace();
    }catch(Exception e) {
    	e.printStackTrace();
    }finally {
     if(rs != null) try {rs.close();}catch(SQLException se) {};   	
     if(stmt != null) try {stmt.close();}catch(SQLException se) {};
     if(con != null) try {con.close();}catch(SQLException se) {};
    	
    }
  %>

</body>
</html>