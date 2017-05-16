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
<form action="/qgzxmis/mainCtrl?ac=activeadd" name="f1" method="post" onsubmit="return check()" enctype="multipart/form-data">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
 
  <TR>
    <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">标题</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" 
      height=24><label>
      <input name="title" type="text" id="title" size="60">
    </label></TD></TR>
    <tr>
        <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">图片</td>
        <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><label>
        <input name="img" type="file" id="img"  />
        </label></td>
       </tr>
       <tr>
        <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">类型</td>
        <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><label>
        <select id="type" name="type">
        	<option value="">请选择</option>
        	<%CommDAO dao = new CommDAO();  
        	ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from protype where delstatus='0'");
        	for(HashMap map:list){%>
        	<option value="<%=map.get("id") %>"><%=map.get("typename") %></option>
        	<%} %>
        </select>
        </label></td>
       </tr>
       <tr>
        <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">酬金设置</td>
        <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><label>
        <input name="jt" type="text" id="jt" size="5" onkeyup='checkDecimal(this)'  />元/小时
        </label></td>
       </tr>
       <tr>
        <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">截止时间</td>
        <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><label>
        <input name="etime" type="text" id="etime" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
          <script type="text/javascript" src="/qgzxmis/commfiles/js/calendar/WdatePicker.js"></script>
        </label></td>
       </tr>
  <TR>
    <TD   align="center" bgcolor="#FFFFFF" class="STYLE19">内容</TD>
    <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><textarea rows="" cols="" name="mt" id="mt"></textarea></TD></TR>
 <script  language=javascript src="/qgzxmis/fckeditor/fckeditor.js"></script>
  <TR>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function window.onload() { 

var of = new FCKeditor("mt");
of.BasePath="/qgzxmis/fckeditor/";
of.Height = "280";
of.ToolbarSet="Default";
of.ReplaceTextarea();

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+150; return;}}} 

}

var record={ 
num:"" 
} 
var checkDecimal=function(n){ 
var decimalReg=/^\d{0,8}\.{0,1}(\d{1,2})?$/;//var decimalReg=/^[-\+]?\d{0,8}\.{0,1}(\d{1,2})?$/; 
if(n.value!=""&&decimalReg.test(n.value)){ 
record.num=n.value; 
}else{ 
if(n.value!=""){ 
n.value=record.num; 
} 
} 
} 
function check()
{
var decimalReg=/^\d{0,8}\.{0,1}(\d{1,2})?$/;

if(f1.title.value=="")
{
alert("请输入标题");
return false;
}if(f1.img.value=="")
{
alert("请选择图片");
return false;
}if(f1.type.value=="")
{
alert("请选择类型");
return false;
}
if(f1.jt.value==""){
			alert("津贴不能为空");
			return false;
		}else if(decimalReg.test(f1.jt.value)==false||f1.jt.value=="0"){
			alert("请输入正确的金额");
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
  location.replace("/qgzxmis/admin/activeinfo.jsp");
 <%}%>
 </script>
