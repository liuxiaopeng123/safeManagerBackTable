<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.PageManager"%>
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
<form action="/qgzxmis/admin/n-notice.jsp?f=f" name="f1" method="post">

<%
String url="/qgzxmis/admin/n-notice.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from user_info_safemanager where user_status='0'";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (user_name like'%"+key+"%' ) ";
}
sql+=" order by user_id desc ";
 %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=2 height=24 bgcolor="#353c44"><span class="STYLE1">用户管理</span></TD> 
  </TR>
  <TR>
    <TD width="27%" height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入用户账号</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="73%" 
      height=24><label>
      <input name="key" type="text"  size="30">
    </label></TD></TR>
  <TR>
    <TD height=24 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加用户">   
      
      
       </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("adduser_safe.jsp","添加学生",400,300);
  }
  
  function update(no)
  {
  pop("edituser_safe.jsp?user_id="+no,"修改学生",400,300);
  }
  
  </script>
  
  
  <br />
  
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=9 height=24 bgcolor="#353c44"><span class="STYLE1">用户信息列表</span></TD> 
  </TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">账号<br></TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">密码</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">性别</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">身高</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">体重</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">状态</TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">修改</TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">删除</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String user_id = request.getParameter("did");
  if(user_id!=null)
  {
  dao.commOper("delete  user_info_safemanager where user_id="+user_id);
  }
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
   %>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("user_name") %></TD>
    <TD height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("user_password") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("user_sex") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("user_height") %>cm</TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("user_weight") %>kg</TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("user_status") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><a href="javascript: update('<%=m.get("user_id") %>')">修改</a></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><a href="n-notice.jsp?did=<%=m.get("user_id") %>">删除</a></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="9" align="center" bgcolor="#FFFFFF" class="STYLE19">
      ${page.info }</TD>
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
<%dao.close();%>