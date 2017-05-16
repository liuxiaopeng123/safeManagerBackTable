<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校勤工助学网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<STYLE type=text/css>
	#dbgdtp {
	MARGIN: 0px; WIDTH: 1400px; FLOAT: left
	}
	#demo {
		WIDTH: 710px; OVERFLOW: hidden
	}
	#demo1 {
		FLOAT: left
	}
	#demo2 {
		FLOAT: left
	}
	#indemo {
		WIDTH: 1500%; FLOAT: left
	}
	</STYLE>
<SCRIPT type=text/javascript src="files/boot.js" loadClass="Time;FormValid"></SCRIPT>
<LINK rel=stylesheet type=text/css href="files/css.css">
<SCRIPT type=text/javascript src="files/AC_RunActiveContent.js"></SCRIPT>
  </head>
  <%CommDAO dao = new CommDAO(); %>
  <body>
    <center>
    <jsp:include page="top.jsp"></jsp:include>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=1000 bgColor=#ffffff 
align=center>
  <TBODY>
  <TR>
    <TD>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=986 align=center>
        <TBODY>
        <TR>
          <TD vAlign=top align=left>
            <SCRIPT type=text/javascript src="files/boot.js" 
            loadClass="Time;FormValid"></SCRIPT>
            
            <jsp:include page="left.jsp"></jsp:include>
            
            </TD>
          <TD vAlign=top width=745>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
              <TBODY>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
                    <TBODY>
                    <TR>
                      <TD vAlign=top align=left>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=440>
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width=440>
                                <TBODY>
                                <TR>
                                <TD class=ct background=files/ne.jpg 
                                width=150 align=middle>站内新闻</TD>
                                <TD background=files/ne1.jpg 
                                align=right><A 
                                href="notice.jsp"><IMG 
                                border=0 src="files/more.jpg" 
                                width=39 height=13></A></TD>
                                <TD width=6><IMG src="files/ne2.jpg" 
                                width=6 height=29></TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=bb border=0 cellSpacing=0 
                              cellPadding=0 width=438>
                                <TBODY>
                                <TR>
                                <TD>
                                <TABLE style="MARGIN: 10px" border=0 
                                cellSpacing=0 cellPadding=0 width=418 
                                align=center>
                                <TBODY>
                                <TR>
                                <TD align=left>
                                <TABLE id=standard border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                                <%ArrayList<HashMap> noticelist = (ArrayList<HashMap>)dao.select("select * from info where type='1' order by savetime desc limit 7"); 
                                for(HashMap notice:noticelist){
                                %>
                                <TR>
                                <TD class=dd height=30>· <A title=<%=notice.get("title") %> 
                                href="infox.jsp?id=<%=notice.get("id")%>" 
                                target=_self><%=notice.get("title")%></A></TD>
                                <TD class=dd vAlign=center align=right>[ 
                                <%=notice.get("savetime").toString().substring(0,10)%> ]</TD></TR>
                                <%} %>
                                </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                      <TD vAlign=top width=295>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=295 
                        align=right height=235>
                          <TBODY>
                          <TR>
                            <TD id=infoarea>
						          			<script> 
 
var widths=300; 
var heights=220; 
<%ArrayList<HashMap> imgadvlist = (ArrayList<HashMap>)dao.select("select  * from info where type=1 order by savetime desc limit 5");  //.findByHql(" from Imgadv where type='ADV' ");
	int counts=0;
	int i=0;
	if(imgadvlist.size()!=0){
		counts = imgadvlist.size();
		for(HashMap imgadv:imgadvlist){
		i++;
		%>
			img<%=i%>=new Image ();img<%=i%>.src="/qgzxmis/upfile/<%=imgadv.get("img")%>";  
<%		}
	}
%>

var counts=<%=counts%>;

//webjx.com 
var nn=1; 
var key=0; 
function change_img() 
{if(key==0){key=1;} 
else if(document.all) 
{document.getElementById("pic").filters[0].Apply();document.getElementById("pic").filters[0].Play(duration=2);} 
eval('document.getElementById("pic").src=img'+nn+'.src'); 
for (var i=1;i<=counts;i++){document.getElementById("xxjdjj"+i).className='axx';} 
document.getElementById("xxjdjj"+nn).className='bxx'; 
nn++;if(nn>counts){nn=1;} 
tt=setTimeout('change_img()',4000);} 
function changeimg(n){nn=n;window.clearInterval(tt);change_img();} 
document.write('<style>'); 
document.write('.axx{padding:1px 7px;border-left:#cccccc 1px solid;}'); 
document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#666;}'); 
document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#999;}'); 
document.write('.bxx{padding:1px 7px;border-left:#cccccc 1px solid;}'); 
document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}'); 
document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}'); 
document.write('</style>'); 
document.write('<div style="width:'+widths+'px;height:'+heights+'px;overflow:hidden;text-overflow:clip;">'); 
document.write('<div><img id="pic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widths+' height='+heights+' /></div>'); 
document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=80);background: #888888;width:100%-2px;text-align:right;top:-12px;position:relative;margin:1px;height:12px;padding:0px;margin:0px;border:0px;">'); 
for(var i=1;i<counts+1;i++){document.write('<a href="javascript:changeimg('+i+');" id="xxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');} 
document.write('</div></div>'); 
change_img(); 

</script> 
                            </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
                    <TBODY>
                    <TR>
                      <TD>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
                          <TBODY>
                          <TR>
                            <TD class=ct background=files/ne.jpg 
                            width=150 align=middle>工作岗位</TD>
                            <TD background=files/ne1.jpg 
                              align=right><A 
                              href="actives.jsp"><IMG 
                              border=0 src="files/more.jpg" width=39 
                              height=13></A></TD>
                            <TD width=6><IMG src="files/ne2.jpg" 
                              width=6 height=29></TD></TR></TBODY></TABLE></TD></TR>
                    <TR>
                      <TD>
                        <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 
                        width=745>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left>
                              <DIV style="MARGIN: 14px">
                              <DIV style="FLOAT: left" id=demo>
                              <DIV id=indemo>
                              <DIV id=demo1>
                              <DIV id=dbgdtp>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width=710 align=center>
                                <TBODY>
                                <TR>
                                <TD align=middle>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                <TBODY>
                                <TR style="heiht: 0px">
                                <TD width="13%"></TD>
                                <TD width="13%"></TD>
                                <TD width="13%"></TD>
                                <TD width="13%"></TD>
                                <TD width="13%"></TD>
                                <TD width="13%"></TD>
                                <TD width="13%"></TD>
                                <TD width="13%"></TD></TR>
                                <TR>
                                <%ArrayList<HashMap> prolist = (ArrayList<HashMap>)dao.select("select * from active where delstatus='0' order by id desc"); 
                                for(HashMap pro:prolist){
                                %>
                                <TD width="13%">
                                <TABLE 
                                style="BORDER-BOTTOM: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; MARGIN-RIGHT: 10px; BORDER-RIGHT: #cccccc 1px solid" 
                                id=st border=0 cellSpacing=0 cellPadding=0 
                                width=170 height=125>
                                <TBODY>
                                <TR align=middle>
                                <TD><A 
                                href="activex.jsp?id=<%=pro.get("id") %>" 
                                target=_self><IMG title="<%=pro.get("title") %>" 
                                border=0 
                                src="upfile/<%=pro.get("img") %>" 
                                width=160 
                                height=115></A></TD></TR></TBODY></TABLE></TD>
                                <%} %>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></DIV>
                              <DIV id=demo2></DIV></DIV></DIV>
                              <SCRIPT> 
var speed=20;
var tab=document.getElementById("demo"); 
var tab1=document.getElementById("demo1"); 
var tab2=document.getElementById("demo2"); 
tab2.innerHTML=tab1.innerHTML; 
function Marquee(){ 
if(tab2.offsetWidth-tab.scrollLeft<=0) 
tab.scrollLeft-=tab1.offsetWidth 
else{ 
tab.scrollLeft++; 
} 
} 
var MyMar=setInterval(Marquee,speed); 
tab.onmouseover=function() {clearInterval(MyMar)}; 
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)}; 
                </SCRIPT>
                              </DIV></TD></TR>
                          <TR>
                            <TD 
                  height=16></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<jsp:include page="foot.jsp"></jsp:include>
    </center>
  </body>
</html>
