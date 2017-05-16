<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/qgzxmis/admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/qgzxmis/admin/images/syscome.files/Admin.js"></SCRIPT>
<SCRIPT language=javascript src="/qgzxmis/commfiles/js/popup.js"></SCRIPT>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<%CommDAO dao = new CommDAO();  %>
<form action="/qgzxmis/mainCtrl?ac=addhealth_safe" name="f1" method="post" onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">用户名</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="username" type="text" id="username" >
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">健康指数<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="userhealthnumber" type="text" id="userhealthnumber" >
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">收缩压<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="userssy" type="text" id="userssy" >
    </label></TD></TR>
  <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">舒张压<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="userszy" type="text" id="userszy" >
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">心率<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="userxl" type="text" id="userxl" >
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">日期<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="userdate" type="text" id="userdate" >
    </label></TD></TR>
  <TR>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">

function check()
{
if(f1.username.value=="")
{
alert("请输入用户名");
return false;
}if(f1.userhealthnumber.value=="")
{
alert("请输入健康指数");
return false;
}if(f1.userssy.value=="")
{
alert("请输入收缩压");
return false;
}if(f1.userszy.value=="")
{
alert("请输入舒张压");
return false;
}if(f1.userxl.value=="")
{
alert("请输入心率");
return false;
}

}
</script>
<script type="text/javascript">

 <%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("已存在的用户名");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/qgzxmis/admin/healthmanager.jsp");
 <%}%>
 </script>
