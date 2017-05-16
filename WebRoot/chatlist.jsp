<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%@page import="common.PageManager"%>
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
          
          
			<TABLE border=0 cellSpacing=0 cellPadding=0 width=231>
                    <TBODY>
                    <TR>
                      <TD height=35 background=files/gg.jpg>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=208 
                        align=center>
                          <TBODY>
                          <TR>
                            <TD class=ct 
                    align=left>在线互动</TD></TR></TBODY></TABLE></TD></TR>
                    <TR>
                      <TD>
                        <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 
                        width=231>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left>
                              <DIV style="MARGIN: 10px 20px">
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="94%" class="lin">
                                <TBODY>
                                <TR>
                                <TD height=26 vAlign="center" 
                                background="files/line2.gif" 
                                align=left><IMG src="files/j.jpg" 
                                width=8 height=7>&nbsp;&nbsp;<A 
                                href="chat.jsp">在线留言</A></TD></TR>
                                <TR>
                                <TD height=26 vAlign="center" 
                                background="files/line2.gif" 
                                align=left><IMG src="files/j.jpg" 
                                width=8 height=7>&nbsp;&nbsp;<A 
                                href="chatlist.jsp">留言列表</A></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
            
            <jsp:include page="left.jsp"></jsp:include>
            
            </TD>
          <TD vAlign=top width=745>
          
          <!-- 内容开始 -->
          <TABLE border=0 cellSpacing=0 cellPadding=0 width=745 >
              <TBODY>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>留言列表</TD>
                      <TD background=files/ne1.jpg 
                      align=right>&nbsp;</TD>
                      <TD width=6><IMG src="files/ne2.jpg" width=6 
                        height=29></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 
width=745>
                    <TBODY>
                    <TR>
                      <TD height=652 vAlign=top align=left>
                        <DIV style="MARGIN: 10px">
                        <FORM id=messageListForm method=post 
                        name=messageListForm action=/list.jsp><INPUT value=1 
                        type=hidden name=id> 
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                        align=center>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left>
                              <TABLE class=text2 border=0 cellSpacing=0 
                              cellPadding=0 width="100%" align=center>
                                <TBODY>
                                <TR>
                                <TD vAlign=top>
                                <%String  sql = "select * from msg order by id desc";
                                String url ="/qgzxmis/chatlist.jsp?1=1";
                                PageManager pageManager = PageManager.getPage(url,5, request);
							    pageManager.doList(sql);
							    PageManager bean= (PageManager)request.getAttribute("page");
							    ArrayList<HashMap> msglist=(ArrayList)bean.getCollection();
							    for(HashMap msg :msglist)
							    {
                                %>
                                <TABLE border=0 cellSpacing=1 cellPadding=4 width="100%" align=center class="lin">
                                <TBODY>
                                	<TR height=22 align=left>
                                		<TD class=body height=68 vAlign=top width=58 align=middle>
                                		<%=msg.get("tname") %> </TD>
                                		<TD class=redblack height=68 width=1119>
                                			<SPAN class=redblack>标题：</SPAN><%=msg.get("title") %> 
                                <HR color=#cccccc SIZE=1 width="100%">
                                		<%=msg.get("content") %> 
                                <P style="LINE-HEIGHT: 150%"><SPAN 
                                class=style2><FONT color=#666666><SPAN 
                                class=style3>回复</SPAN>：</FONT></SPAN><FONT color=#666666><%=msg.get("reply") %></FONT> 
                                </P>
                                <HR color=#cccccc SIZE=1 width="100%">
                                 　	<FONT color=#555555><IMG 
                                src="files/ico-posttime.gif" 
                                width=16 height=15>： <%=msg.get("savetime") %>　</FONT><BR></TD></TR>
                                <TR height=22>
                                <TD class=body height=0 colSpan=2 align=middle>
                                <HR color=#cccccc SIZE=1 width="100%">
                                </TD></TR></TBODY></TABLE>
                                <%} %>
                                
                                </TD></TR></TBODY></TABLE>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=center height=30>
                                <TBODY>
                                <TR align=right>
                                <TD colSpan=3 align=middle class="lin">
                                ${page.info }</TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD class=hui22 height=18 vAlign=top 
                          align=left></TD></TR></TBODY></TABLE></FORM></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
          <!-- 内容结束 -->
          
          </TD>
     </TR></TBODY></TABLE></TD>      </TR></TBODY></TABLE>

<jsp:include page="foot.jsp"></jsp:include>
    </center>
  </body>
</html>
<script language="javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
%>
alert("发布成功");
parent.location.replace("/qgzxmis/chat.jsp");
<%}%>
</script>