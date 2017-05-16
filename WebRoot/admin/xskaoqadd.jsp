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
HashMap map = dao.select("select * from joininfo where id="+id).get(0);
%>
<form action="/qgzxmis/mainCtrl?ac=xskaoqadd&id=<%=id %>&xs=<%=map.get("studentid") %>&aid=<%=map.get("stid") %>" name="f1" method="post" onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" >
  <TBODY>
       <tr>
        <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">考勤日期</td>
        <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><label>
        <input name="rq" type="text" id="rq" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
          <script type="text/javascript" src="/qgzxmis/commfiles/js/calendar/WdatePicker.js"></script>
        </label></td>
       </tr>
  	<tr>
        <TD width="20%" height=31 align="center" bgcolor="#FFFFFF" class="STYLE19">工作时长</td>
        <TD bgcolor="#FFFFFF" class="STYLE19" width="68%" height=24><label>
        <input name="hournum" type="text" id="hournum" size="5" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />小时
        </label></td>
       </tr>
       <tr>
    <TD height=31 colspan="2" align="center" bgcolor="#FFFFFF" class="STYLE19">
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">


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
if(f1.rq.value=="")
{
alert("请输入考勤日期");
return false;
}if(f1.hournum.value==""){
			alert("工作长不能为空");
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
  location.replace("/qgzxmis/admin/xskaoq.jsp");
 <%}%>
 
  <%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("该天该工和已录入工作时长");
 <%}%>
 </script>
