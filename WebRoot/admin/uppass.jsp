<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/qgzxmis/admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/qgzxmis/admin/images/syscome.files/Admin.js"></SCRIPT>

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
<form action="/qgzxmis/mainCtrl?ac=uppass" name="f1" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=2 height=24 bgcolor="#353c44"><span class="STYLE1">修改登录密码</span></TD> 
  </TR>
  <TR>
    <TD width="27%" height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入原密码</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="73%" 
      height=24><label>
      <input name="oldpass" type="password" id="oldpass">
    </label></TD></TR>
  <TR>
    <TD width="27%" height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入新密码</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="73%" height=24><input name="userpass" type="password" id="userpass"></TD></TR>
  <TR>
    <TD height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请重复新密码</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" height=24><input  name="copyuserpass" type="password" id="copyuserpass"></TD></TR>
  <TR>
    <TD height=24 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit" onMouseDown="check();" value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function check()
{
if(f1.olduserpass.value=="")
{
alert("请输入原密码");
return;
}
if(f1.userpass.value=="")
{
alert("请输入新密码");
return;
}
if(f1.copyuserpass.value!=f1.userpass.value)
{
alert("两次密码输入不一致");
return;
}
}
</script>
<script type="text/javascript">
<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("原密码不对");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 <%}%>
 </script>
