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
<form action="foodmanager.jsp?f=f" name="f1" method="post">

<%
String url="foodmanager.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from foodmanager";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" where (foodname like'%"+key+"%' ) ";
}
sql+=" order by id desc ";
 %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=2 height=24 bgcolor="#353c44"><span class="STYLE1">饮食管理</span></TD> 
  </TR>
  <TR>
    <TD width="27%" height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入查询关键字</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="73%" 
      height=24><label>
      <input name="key" type="text"  size="30">
    </label></TD></TR>
  <TR>
    <TD height=24 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="查询数据">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加数据">    </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("addfood_safe.jsp","添加食物数据",400,300);
  }
  function update(no)
  {
  pop("editfoodmanager_safe.jsp?id="+no,"修改食物数据",400,300);
  }
  </script>
  
  
  <br />
  
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=6 height=24 bgcolor="#353c44"><span class="STYLE1">信息列表</span></TD> 
  </TR>
  <TR>
  	<TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">食物名<br></TD>
  	<TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">食物能量<br></TD>
  	<TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">单位<br></TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">食物分类<br></TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">食用时间<br></TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">操作</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete  foodmanager where id="+did);
  }
  		PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
   %>
  <TR>
  <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("foodname") %></TD>
  <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("foodenergy") %>大卡</TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("foodcount") %>克</TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("foodtype") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("foodeattime") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><a href="javascript: update('<%=m.get("id") %>')">修改</a>&nbsp;|&nbsp;<a href="foodmanager.jsp?did=<%=m.get("id") %>">删除</a></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="6" align="center" bgcolor="#FFFFFF" class="STYLE19">
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 <%}%>
 </script>
<%dao.close();%>