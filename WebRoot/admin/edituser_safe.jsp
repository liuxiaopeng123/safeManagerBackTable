<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%@page import="util.Info"%>
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
<%CommDAO dao = new CommDAO(); 
String user_id = request.getParameter("user_id");
HashMap map = dao.select("select * from user_info_safemanager where user_id="+user_id).get(0);
%>
<form action="/qgzxmis/mainCtrl?ac=updateuser_safe" name="f1" method="post" onsubmit="return check()" >
<input type="hidden" id="user_id" name="user_id"  value="<%=map.get("user_id") %>">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">账号<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <%=map.get("user_name") %>
    </label></TD></TR>
      <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">密码</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="user_password" type="password" id="user_password" value="<%=map.get("user_password") %>">
    </label></TD></TR>
      <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">性别<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="user_sex" type="text" id="user_sex" value="<%=map.get("user_sex") %>">
    </label></TD></TR>
      <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">身高<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="user_height" type="text" id="user_height" value="<%=map.get("user_height") %>">
    </label></TD></TR>
      <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">体重<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="user_weight" type="text" id="user_weight" value="<%=map.get("user_weight") %>">
    </label></TD></TR>
      <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">状态<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="user_status" type="text" id="user_status" value="<%=map.get("user_status") %>">
    </label></TD></TR>
    <tr>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">

function check()
{
if(f1.user_password.value==""){
alert("请输入密码");
return false;
}if(f1.user_sex.value==""){
alert("请输入性别");
return false;
}if(f1.user_height.value==""){
alert("请输入身高");
return false;
}if(f1.user_weight.value==""){
alert("请输入体重");
return false;
}if(f1.user_status.value==""){
alert("请输入状态");
return false;
}

}
</script>
<script type="text/javascript">

 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/qgzxmis/admin/n-notice.jsp");
 <%}%>
 </script>
<%Info.tform(map);%>