<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
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
String id = request.getParameter("id");
HashMap map = dao.select("select * from foodmanager where id="+id).get(0);
%>
<form action="/qgzxmis/mainCtrl?ac=editfoodmanager_safe&id=<%=id %>" name="f1" method="post" onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">食品编号<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      000<%=map.get("id") %>
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">食物名<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="foodname" type="text" id="foodname" value="<%=map.get("foodname") %>">
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">食物能量<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="foodenergy" type="text" id="foodenergy" value="<%=map.get("foodenergy") %>">
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">单位<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="foodcount" type="text" id="foodcount" value="<%=map.get("foodcount") %>">
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">食物分类<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="foodtype" type="text" id="foodtype" value="<%=map.get("foodtype") %>">
    </label></TD></TR>
    <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">食用时间<br></TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="foodeattime" type="text" id="foodeattime" value="<%=map.get("foodeattime") %>">
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
if(f1.foodname.value=="")
{
alert("请输入名字");
return false;
}if(f1.foodenergy.value=="")
{
alert("请输入能量");
return false;
}if(f1.foodcount.value=="")
{
alert("请输入单位");
return false;
}if(f1.foodeattime.value=="")
{
alert("请输入食用时间");
return false;
}if(f1.foodtype.value=="")
{
alert("请输入食物类型");
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
  parent.location.replace("/qgzxmis/admin/foodmanager.jsp");
 <%}%>
 </script>
