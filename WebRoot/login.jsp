<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校勤工助学网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<STYLE type=text/css>
	#dbgdtp {
	MARGIN: 0px; WIDTH: 1400px; FLOAT: left
	}
	#demo {
		WIDTH: 710px; OVERFLOW: hidden
	}
	#demo1 {
		FLOAT: left
	}
	#demo2 {
		FLOAT: left
	}
	#indemo {
		WIDTH: 1500%; FLOAT: left
	}
	</STYLE>
<SCRIPT type=text/javascript src="files/boot.js" loadClass="Time;FormValid"></SCRIPT>
<LINK rel=stylesheet type=text/css href="files/css.css">
<SCRIPT type=text/javascript src="files/AC_RunActiveContent.js"></SCRIPT>
  </head>
  <%CommDAO dao = new CommDAO(); %>
  <body>
    <center>
    <jsp:include page="top.jsp"></jsp:include>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=1000 bgColor=#ffffff 
align=center>
  <TBODY>
  <TR>
    <TD>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=986 align=center>
        <TBODY>
        <TR>
          <TD vAlign=top align=left>
            <SCRIPT type=text/javascript src="files/boot.js" 
            loadClass="Time;FormValid"></SCRIPT>
            
            <jsp:include page="left.jsp"></jsp:include>
            
            </TD>
          <TD vAlign=top width=745>
          
          <!-- 内容开始 -->
          <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
              <TBODY>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>登陆</TD>
                      <TD background=files/ne1.jpg 
                      align=right>&nbsp;</TD>
                      <TD width=6><IMG src="files/ne2.jpg" width=6 
                        height=29></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 
width=745>
                    <TBODY>
                    <TR>
                      <TD height=420 vAlign=top align=left>
                        <DIV style="MARGIN: 10px">
                        <STYLE type=text/css>.black {
	FONT-FAMILY: "宋体"; COLOR: #990000; FONT-SIZE: 12px; FONT-WEIGHT: bold; TEXT-DECORATION: none
}
BODY {
	BACKGROUND-IMAGE: none; MARGIN: 0px
}
</STYLE>

                        <TABLE id=content border=0 cellSpacing=0 cellPadding=0 
                        width="100%">
                          <TBODY>
                          <TR vAlign=top align=middle></TR>
                          <TR vAlign=center align=middle>
                            <TD vAlign=top colSpan=3>
                            <form action="/qgzxmis/mainCtrl?ac=login1" name="f1" method="post" onsubmit="return check()">
                              <TABLE border=1 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD height=21 vAlign=center 
                                align=left class="lin">
                                用户名:<input type="text" id="uname" name="uname" >
                           </TD>
                           </TR>
                           <TR>
                                <TD height=21 vAlign=center 
                                align=left class="lin">
                                密码:<input type="password" id="upass" name="upass" >
                           </TD>
                           </TR>
                            <tr><TD height=21 vAlign=center 
                                align=left class="lin">
                                <input type="submit" value="登陆">
                                
                                <input type="button" value="注册" onclick="aa()">
                           </TD></tr>
                           
                           </TBODY></TABLE>
                           </form>
                           <script type="text/javascript">
                           function aa(){
                           	location.href="/qgzxmis/reg.jsp"
                           }
                            function check(){
                            	if(document.getElementById("uname").value==""){
                            		alert("用户名不能为空");
                            		return false;
                            	}if(document.getElementById("upass").value==""){
                            		alert("密码不能为空");
                            		return false;
                            	}
                            }
                           </script>
                           </TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
          <!-- 内容结束 -->
          
          </TD>
   </TR></TBODY></TABLE></TD>     </TR></TBODY></TABLE>
<SCRIPT type=text/javascript src="files/boot.js" 
loadClass="Time;FormValid"></SCRIPT>
<jsp:include page="foot.jsp"></jsp:include>
    </center>
  </body>
</html>
<script type="text/javascript">
<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("登陆成功");
  location.replace("/qgzxmis/index.jsp");
 <%}%>
 </script>