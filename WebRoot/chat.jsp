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
          
          
			<TABLE border=0 cellSpacing=0 cellPadding=0 width=231>
                    <TBODY>
                    <TR>
                      <TD height=35 background=files/gg.jpg>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=208 
                        align=center>
                          <TBODY>
                          <TR>
                            <TD class=ct 
                    align=left>在线互动</TD></TR></TBODY></TABLE></TD></TR>
                    <TR>
                      <TD>
                        <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 
                        width=231>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left>
                              <DIV style="MARGIN: 10px 20px">
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="94%" class="lin">
                                <TBODY>
                                <TR>
                                <TD height=26 vAlign="center" 
                                background="files/line2.gif" 
                                align=left><IMG src="files/j.jpg" 
                                width=8 height=7>&nbsp;&nbsp;<A 
                                href="chat.jsp">在线留言</A></TD></TR>
                                <TR>
                                <TD height=26 vAlign="center" 
                                background="files/line2.gif" 
                                align=left><IMG src="files/j.jpg" 
                                width=8 height=7>&nbsp;&nbsp;<A 
                                href="chatlist.jsp">留言列表</A></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
            
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
                      align=middle>在线互动</TD>
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
                        
						<form action="/qgzxmis/mainCtrl?ac=addmsg" name="f1" method="post" onsubmit="return ck()">
                        <TABLE id=login border=0 cellSpacing=1 cellPadding=4 width="100%" align=center class="lin">
                          <TBODY>
                          <TR height=22 align=middle>
                            <TD colSpan=2>我要留言  </TD></TR>
                          <TR height=22>
                            <TD height=30 align=right><SPAN 
                              class=style3>您的名字:</SPAN></TD>
                            <TD height=22>
                              <DIV align=left><INPUT size=10 type="text" name="tname" id="tname" > <FONT 
                              color=#ff0000>*</FONT> </DIV></TD></TR>
                          <TR height=22>
                            <TD height=30 align=right>标题留言:</TD>
                            <TD height=22>
                              <DIV align=left><INPUT size=10 type="text" name="title" id="title" >  
                              <FONT color=#ff0000>* </FONT></DIV></TD></TR>
                          <TR height=22>
                            <TD height=22 align=right><SPAN 
                              class=style3>咨询内容:</SPAN></TD>
                            <TD height=22>
                              <DIV align=left><TEXTAREA rows=10 cols=50 name="content" id="content" height="30" width="50"></TEXTAREA> 
                              <FONT color=#ff0000>*</FONT> </DIV></TD></TR>
                         
                          <TR height=22>
                            <TD height=22 colSpan=2 align=middle><INPUT  value="添加" type="submit" > 
						<INPUT value="清除" type="reset" > 
                          </TD></TR></TBODY></TABLE>
                          </form>
<SCRIPT type=text/javascript>
	function ck(){
		if(document.getElementById("tname").value==""){
			alert("名字不能为空");
			return false;
		}
		if(document.getElementById("title").value==""){
			alert("标题不能为空");
			return false;
		}if(document.getElementById("content").value==""){
			alert("内容不能为空");
			return false;
		}
	}
</SCRIPT>

                        
                        </DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
          <!-- 内容结束 -->
          
          </TD>
    </TR></TBODY></TABLE></TD>   </TR></TBODY></TABLE>

<jsp:include page="foot.jsp"></jsp:include>
    </center>
  </body>
</html>
<script language="javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("发布成功");
parent.location.replace("/qgzxmis/chat.jsp");
<%}%>
</script>