<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.PageManager"%>
<%@page import="common.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/qgzxmis/admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/qgzxmis/admin/images/syscome.files/Admin.js"></SCRIPT>
<SCRIPT language=javascript src="/qgzxmis/js/popup.js"></SCRIPT>
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
<form action="n-protype.jsp?f=f" name="f1" method="post">

<%
String url="n-protype.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from protype where delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (typename like'%"+key+"%' ) ";
}
sql+=" order by id desc ";
 %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=2 height=24 bgcolor="#353c44"><span class="STYLE1">工作类型管理</span></TD> 
  </TR>
  <TR>
    <TD width="27%" height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">请输入关键字</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="73%" 
      height=24><label>
      <input name="key" type="text"  size="30">
    </label></TD></TR>
  <TR>
    <TD height=24 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加内容">    </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  location.href("n-protypeadd.jsp");
  }
  
  function update(no)
  {
  location.href("n-protypeedit.jsp?id="+no);
  }
  </script>
  
  
  <br />
  
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=3 height=24 bgcolor="#353c44"><span class="STYLE1">信息列表</span></TD> 
  </TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">工作类型名称</TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">修改</TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">删除</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("update protype set delstatus=1  where id="+did);
  }
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
   %>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("typename") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><a href="javascript: update('<%=m.get("id") %>')">修改</a></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><a href="n-protype.jsp?did=<%=m.get("id") %>">删除</a></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="5" align="center" bgcolor="#FFFFFF" class="STYLE19">
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