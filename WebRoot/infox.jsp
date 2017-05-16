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
          
          <!-- 内容开始 -->
          <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
              <TBODY>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=745>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>信息详情</TD>
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
                        <%String id = request.getParameter("id");
                        HashMap info = dao.select("select * from info where id="+id).get(0);
                        %>
                        <TABLE id=content border=0 cellSpacing=0 cellPadding=0 
                        width="100%">
                          <TBODY>
                          <TR vAlign=top align=middle>
                            <TD 
                            style="BORDER-BOTTOM: #cccccc 1px dotted; COLOR: #003399; FONT-SIZE: 14px; FONT-WEIGHT: bold" 
                            height=40 vAlign=center colSpan=2 
                              align=middle><%=info.get("title") %></TD></TR>
                          <TR vAlign=center align=middle>
                            <TD height=30 vAlign=center colSpan=2 
                              align=center class="lin">发布时间：<%=info.get("savetime") %>  
                            </TD></TR>
                            <%if(info.get("img")!=null){ %>
                          <TR vAlign=center align=middle>
                            <TD height=30 vAlign=center colSpan=2 
                              align=center class="lin"> 
                              <img src="upfile/<%=info.get("img") %>" height="300" width="500"/> 
                            </TD></TR>
                            <%} %>
                          <TR vAlign=center align=middle>
                            <TD height=56 vAlign=center colSpan=2 
                              align=middle><TABLE border=0 cellSpacing=0 
                              cellPadding=0 width="94%">
                                <TBODY>
                                <TR>
                                <TD height=21 vAlign=center width="50%" 
                                align=left class="lin">
                                <P>
                                <%=info.get("content") %>
                                </P>
                                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
          <!-- 内容结束 -->
          
          </TD>
    </TR></TBODY></TABLE></TD>     </TR></TBODY></TABLE>
<SCRIPT type=text/javascript src="files/boot.js" 
loadClass="Time;FormValid"></SCRIPT>
<jsp:include page="foot.jsp"></jsp:include>
    </center>
  </body>
</html>
