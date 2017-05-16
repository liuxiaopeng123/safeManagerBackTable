<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.PageManager"%>
<%@page import="common.CommDAO"%>
<%@page import="common.Info"%>
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
<form action="mystcy.jsp?f=f" name="f1" method="post">

<%
HashMap admin = (HashMap)session.getAttribute("admin");
String url="mystcy.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from joininfo where shstatus='通过' ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (stid ='"+key+"' ) ";
}else{
	sql += "and stid in (select id from active where saver='"+admin.get("id")+"' and jointime is not null)";
}


sql+=" order by id desc ";
 %>


  
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
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=2 height=24 bgcolor="#353c44"><span class="STYLE1">学生管理</span></TD> 
  </TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">按工作查询</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" 
      height=24><label>
      <select id="key" name="key">
        	<option value="">请选择</option>
        	<%CommDAO dao = new CommDAO();  
        	ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from active where saver='"+admin.get("id")+"' and delstatus='0'");
        	for(HashMap map:list){%>
        	<option value="<%=map.get("id") %>"><%=map.get("title") %></option>
        	<%} %>
        </select>
    </label></TD>
    </TR>
  <TR>
    <TD height=24 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="查询信息">
      </TD>
    </TR>
  </TBODY></TABLE>
  
  <br />
  
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
  <TR>
    <TD colSpan=8 height=24 bgcolor="#353c44"><span class="STYLE1">信息列表</span></TD> 
  </TR>
  <TR>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">姓名</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">电话</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">班级</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">工作岗位</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">加入时间</TD>
    <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">终止时间</TD>
    <!--  <TD  height=24 align="center" bgcolor="#d3eaef" class="STYLE10">酬金</TD>-->
    <TD  align="center" bgcolor="#d3eaef" class="STYLE10">操作</TD>
  </TR>
  <%
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from joininfo  where id="+did);
  }
  String jjid = request.getParameter("jjid");
  if(jjid!=null)
  {
  dao.commOper("update joininfo set shstatus='拒绝'  where id="+jjid);
  }
  String lid = request.getParameter("lid");
  if(lid!=null)
  {
  dao.commOper("update joininfo set overtime='"+Info.getDateStr()+"'  where id="+lid);
  }
  
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
	    	HashMap mm = dao.select("select * from sysuser where id="+m.get("studentid")).get(0);
   %>
  <TR>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=mm.get("tname") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=mm.get("tel") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=mm.get("bj") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">
    <%HashMap mmm = dao.select("select * from active where id='"+m.get("stid")+"'").get(0); %>
    <%=mmm.get("title") %>
    </TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("jointime")==null?"":m.get("jointime") %></TD>
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19"><%=m.get("overtime")==null?"":m.get("overtime") %></TD>
    <!--  <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">
    <%//Double zje = 0.0;
    //int sjc = 0;
    //if(m.get("overtime")!=null){
    	
    //	sjc = Info.dayToday(m.get("jointime").toString().substring(0,11),m.get("overtime").toString().substring(0,11));
    //	zje = sjc * Double.valueOf(mmm.get("jt").toString());
    //} %>
    <%//sjc%>天<%//zje %>元
    </TD>-->
    <TD  height=24 align="center" bgcolor="#FFFFFF" class="STYLE19">
    <%if(m.get("overtime")==null){ %>
    <a href="mystcy.jsp?lid=<%=m.get("id") %>">终止</a>
    |
    <a href="mystcy.jsp?did=<%=m.get("id") %>">注销</a>
    <%} %>
    </TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="8" align="center" bgcolor="#FFFFFF" class="STYLE19">
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