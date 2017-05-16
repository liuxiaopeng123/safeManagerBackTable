<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<LINK rel=stylesheet type=text/css href="files/css.css">
  </head>
  
  <body>
    <center>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=1000 bgColor=#ffffff 
align=center>
  <TBODY>
  <TR>
    <TD height=8></TD></TR>
  <TR>
    <TD class=meun bgColor=#37699c height=30 align=middle> 
      &nbsp;&nbsp;<a href="/qgzxmis/admin/login.jsp" target="blank">管理员/企业登陆</a>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="/qgzxmis/regqy.jsp">企业注册</A>
      <IMG border=0 src="files/ga.gif" 
      width=30 height=30></IMG> &nbsp;&nbsp;<IMG border=0 
      src="files/gangting.gif" width=15 
  height=15>&nbsp;&nbsp;</TD></TR></TBODY></TABLE>
    </center>
  </body>
</html>
