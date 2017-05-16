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
<form action="xskaoqlist.jsp?f=f" name="f1" method="post">

<%
String url="xskaoqlist.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "SELECT  DISTINCT xs,aid,sum(hournum) as hournum  FROM xskaoq  group by xs,aid ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (typename like'%"+key+"%' ) ";
}
 %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=2 height=24 bgcolor="#353c44"><span class="STYLE1">学生考勤记录</span></TD> 
  </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  location.href("n-protypeadd.jsp");
  }
  
  function update(no)
  {
  location.href("xskaoqadd.jsp?id="+no);
  }
  </script>
  
  
  <br />
  
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=4 height=24 bgcolor="#353c44"><span class="STYLE1">信息列表</span></TD> 
  </TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">学生</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">参与工作</TD>
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">工作时长</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from  xskaoq   where id="+did);
  }
  
  System.out.println(sql);
	    
	    
	   
	    ArrayList<HashMap> nlist=( ArrayList<HashMap> )dao.select(sql);
	    for(HashMap m:nlist)
	    {
	    	HashMap sm = dao.select("select * from sysuser where id='"+m.get("xs")+"'").get(0);
	    	HashMap gm = dao.select("select * from active where id='"+m.get("aid")+"'").get(0);
	    	HashMap gsm = dao.select("select * from sysuser where id='"+gm.get("saver")+"'").get(0);
   %>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=sm.get("uname") %>-<%=sm.get("tname") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=gm.get("title") %>--(<%=gsm.get("tname") %>)</TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("hournum") %></TD>
  </TR>
  <%} %>
  
 
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