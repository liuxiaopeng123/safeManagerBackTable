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
<SCRIPT type=text/javascript src="files/boot.js" loadClass="Time;FormValid"></SCRIPT>
<LINK rel=stylesheet type=text/css href="files/css.css">
<SCRIPT type=text/javascript src="files/AC_RunActiveContent.js"></SCRIPT>
  </head>
  <%CommDAO dao = new CommDAO(); 
    String url="actives.jsp?1=1";
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String type = request.getParameter("type")==null?"":request.getParameter("type");
  String sql = "select * from active where 1=1 and delstatus='0' ";
  if(!key.equals(""))
  {
  url+="&key="+key;
  sql+=" and (title like'%"+key+"%' ) ";
  }  
  if(!type.equals("")){
	  url+="&type="+type;
	  sql+=" and (type ='"+type+"' ) ";
  }
  sql+=" order by id desc ";%>
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
                      <TD class="ct a_none" background=files/ne.jpg 
                      width=150 align=middle>工作浏览</TD>
                      <TD background=files/ne1.jpg 
                      align=right>&nbsp;</TD>
                      <TD width=6><IMG src="files/ne2.jpg" width=6 
                        height=29></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD>
                  <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 width=745>
                    <TBODY>
                    <TR>
                      <TD height=652 vAlign=top align=left>
                        <DIV style="MARGIN: 10px">
                        <FORM id=stSearchform method=post 
                        name=stSearchform action=/pro.jsp><INPUT value=2 
                        type=hidden name=classid> 
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                        align=center>
                          <TBODY>
                          <TR style="HEIGHT: 0px">
                            <TD width="33%"></TD>
                            <TD width="33%"></TD>
                            <TD width="33%"></TD></TR>
                          <TR>
                        <%PageManager pageManager = PageManager.getPage(url,10, request);
                  	    pageManager.doList(sql);
                	    PageManager bean= (PageManager)request.getAttribute("page");
                	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
                	    int a = 0;
                	    for(HashMap m:nlist)
                	    { 
                	    a++;
                	    %>
                          
                            <TD align=middle>
                              <TABLE id=st border=0 cellSpacing=0 
                              cellPadding=0 width=210>
                                <TBODY>
                                <TR align=middle>
                                <TD vAlign=center align=middle>
                                <TABLE 
                                style="BORDER-BOTTOM: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-RIGHT: #cccccc 1px solid" 
                                border=0 cellSpacing=0 cellPadding=0 width=210>
                                <TBODY>
                                <TR>
                                <TD height=150 vAlign=center align=middle><A 
                                href="activex.jsp?id=<%=m.get("id") %>" 
                                target=""><IMG title="<%=m.get("title") %> " border=0 
                                src="upfile/<%=m.get("img") %>" 
                                width=200 
                                height=140></A></TD></TR></TBODY></TABLE></TD></TR>
                                <TR align=middle>
                                <TD height=30 class="lin"><A 
                                href="activex.jsp?id=<%=m.get("id") %>" 
                                target=""><%=m.get("title") %></A></TD></TR>
                                <TR>
                                <TD height=10></TD></TR>
                                <TR align=middle>
                                <TD></TD></TR></TBODY></TABLE></TD>
                                <%if(a%3==0)
                                {%>
                                </TR><tr>
                                <%
                                }
                                }
                                 %>
                                
                            
                          <TR height=12>
                            <TD colSpan=3>&nbsp;</TD></TR>
                          <TR align=middle>
                            <TD colSpan=3 class="lin">
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
