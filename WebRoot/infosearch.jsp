<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%@page import="common.PageManager"%>
<%@page import="common.Info"%>
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
                      align=middle>站内新闻</TD>
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
                      <TD height=420 vAlign=top align=left>
                        <DIV style="MARGIN: 10px">
                        <FORM id=newsSearchform method=post name=newsSearchform 
                        action=/case.jsp><INPUT value=9 type=hidden 
                        name=classid> 
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
                          <TBODY>
                          <TR vAlign=top align=middle>
                            <TD width="300%" colSpan=3>
                              <TABLE id=standard_2 border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <%
                                String key = request.getParameter("key");
                                String mode = request.getParameter("searchMode");
                                String f = request.getParameter("f");
                                String sql = "select  * from info where 1=1  "; 
                                String url ="/qgzxmis/notice.jsp?1=1";
                                
                                if(f==null)
                                {
                                key = Info.getUTFStr(key);
                                }
                                if(!key.equals(""))
                                {
                                	if(mode.equals("1")){
                                		sql+=" and (title like'%"+key+"%')";
                                	}else{
                                		sql+=" and (content like'%"+key+"%')";
                                	}
                                	url+="&key="+key;
                                }else{
                                	sql+=" and type=1 ";
                                }
                                sql += "order by savetime desc";
                                PageManager pageManager = PageManager.getPage(url,10, request);
							    pageManager.doList(sql);
							    PageManager bean= (PageManager)request.getAttribute("page");
							    ArrayList<HashMap> noticelist=(ArrayList)bean.getCollection();
							    for(HashMap m :noticelist)
							    {%>
                                <TR>
                                <TD class=dd height=30 vAlign=center width="79%" 
                                align=left>· <A title=<%=m.get("title") %> 
                                href="infox.jsp?id=<%=m.get("id") %>" 
                                target=""><%=m.get("title") %></A></TD>
                                <TD class=dd height=30 vAlign=center width="21%" 
                                align=left><SPAN><%=m.get("savetime").toString() %></SPAN></TD></TR>
                                <%} %>
                                </TBODY></TABLE></TD></TR>
                          <TR vAlign=center align=middle>
                            <TD id=page height=60 colSpan=3 class="lin">
                            ${page.info }
                              </TD></TR></TBODY></TABLE></FORM></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
          <!-- 内容结束 -->
          
          </TD>
        </TR></TBODY></TABLE></TD> </TR></TBODY></TABLE>
<SCRIPT type=text/javascript src="files/boot.js" 
loadClass="Time;FormValid"></SCRIPT>
<jsp:include page="foot.jsp"></jsp:include>
    </center>
  </body>
</html>
