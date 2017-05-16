<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
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
    <TD height=82 vAlign=top background=files/to.jpg>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=1000>
        <TBODY>
        <TR>
          <TD width=415><IMG src="files/logo1.jpg" width=415 
            height=82></TD>
          <TD vAlign=top width=585>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=400 align=right>
              <TBODY>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                  align=right height=26>
                    <TBODY>
                    <TR>
                    <%HashMap user = (HashMap)session.getAttribute("user"); %>
                    <%if(user==null){ %>
                    
                      <TD width=65 class="lin"><A href="/qgzxmis/login.jsp">注册/登录</A></TD>
                     
                      
                      
                      <%}else{ %>
                      <TD align=middle><IMG src="files/sj.gif" 
                        width=7 height=6></TD>
                      <TD width=65 class="lin"><%=user.get("tname") %> 你好</TD>
                      <TD align=middle><IMG src="files/sj.gif" 
                        width=7 height=6></TD>
                      <TD  class="lin"><A href="myst.jsp">我参与的工作</A></TD>
                      <TD align=middle><IMG src="files/sj.gif" 
                        width=7 height=6></TD>
                      <TD  class="lin"><A href="myworktj.jsp">工作统计</A></TD>
                      <TD align=middle><IMG src="files/sj.gif" 
                        width=7 height=6></TD>
                      <TD width=65 class="lin"><A href="myinfo.jsp">个人信息</A></TD>
                      <TD align=middle><IMG src="files/sj.gif" 
                        width=7 height=6></TD>
                      <TD width=65 class="lin"><A href="/qgzxmis/mainCtrl?ac=studentexit">退出</A></TD>
                      <%} %>
                      </TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=20>&nbsp;</TD></TR>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=300>
                    <TBODY>
                    <TR>
                      <TD>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=300>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=middle>
                            <form action="infosearch.jsp?f=f" method="post" name="f1">
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=center width="59%" align=left><INPUT 
                                class=bk size=22 type=text name="key" id="key"></TD>
                                <TD vAlign=center width="27%" align=left>
                                <SELECT name="searchMode" id="searchMode"> 
                                <OPTION selected value="1">标　题</OPTION> 
                                <OPTION value="2">内　容</OPTION>
                                </SELECT></TD>
                            <TD vAlign=center width="14%" align=left><INPUT 
                                src="files/serch.jpg" type=image 
                                name=imageField></TD></TR></TBODY></TABLE>
                                </form>
                                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=1000>
        <TBODY>
        <TR>
          <TD width=7><IMG src="files/me.jpg" width=7 
height=35></TD>
          <TD background=files/me1.jpg width=1000 align=right>
            <TABLE class=meun border=0 cellSpacing=0 cellPadding=0 width="96%" 
            align=center>
              <TBODY>
              <TR>
                <TD width=80 align=middle><A 
                  href="index.jsp">首页</A> </TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="companyjj.jsp">网站简介</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="notice.jsp">站内新闻</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="actives.jsp">工作浏览</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="chat.jsp">在线互动</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
          <!--      <TD width=90 align=middle><A 
                  href="http://www.whhcfgm.com/message.jsp">在线留言</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>  -->  
                <TD width=90 align=middle><A 
                  href="contact.jsp">联系我们</A></TD></TR></TBODY></TABLE></TD>
          <TD width=7><IMG src="files/me3.jpg" width=7 
          height=35></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=8></TD></TR>
  <TR>
    <TD height=8></TD></TR></TBODY></TABLE>
    </center>
  </body>
</html>
