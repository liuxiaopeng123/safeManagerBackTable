<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%@page import="util.Info"%>
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
  %>
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
                      align=middle>工作详情</TD>
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
                        <%
                        boolean ispj = false;
                        String id = request.getParameter("id");
                        HashMap amap = dao.select("select * from active where id="+id).get(0);
                        
                        String stid =  request.getParameter("id");
                        String studentid =  request.getParameter("studentid");
                        if(stid!=null&&studentid!=null){
                        	ArrayList clist = (ArrayList)dao.select("select * from joininfo where studentid='"+studentid+"' and stid='"+stid+"' ");
                        	if(clist.size()==0){
                        		dao.commOper("insert into joininfo (stid,studentid,shstatus) values ('"+stid+"','"+studentid+"','待审核')");
                        	}
                        }
                        
                        String tc = request.getParameter("tc");
                        if(tc!=null){
                        	String stid1 =  request.getParameter("id");
                            String studentid1 =  request.getParameter("studentid");
                            dao.commOper("delete from joininfo where stid='"+stid1+"' and studentid='"+studentid1+"' ");
                        }
                        %>
                        <TABLE id=content border=0 cellSpacing=0 cellPadding=0 
                        width="100%">
                          <TBODY>
                          <TR vAlign=top align=middle>
                            <TD 
                            style="BORDER-BOTTOM: #cccccc 1px dotted; COLOR: #003399; FONT-SIZE: 14px; FONT-WEIGHT: bold" 
                            height=40 vAlign=center colSpan=2 
                              align=middle><%=amap.get("title") %>
                              <%HashMap user = (HashMap)session.getAttribute("user");
                              if(user!=null){ 
                              ArrayList cklist = (ArrayList)dao.select("select * from joininfo where stid='"+amap.get("id")+"' and studentid='"+user.get("id")+"' ");
                              HashMap m=null;
                              if(cklist.size()!=0){
                              m = (HashMap)cklist.get(0);
                              if(m.get("shstatus").equals("待审核")){%>
                            	 			 【已申请，正在审核】  
                              <%}
                              if(m.get("shstatus").equals("通过")){
                              ispj = true;%>
                              			<% if(m.get("overtime")==null){%>
                        				<a href="activex.jsp?id=<%=amap.get("id") %>&studentid=<%=user.get("id") %>&tc='yes'">【注销】</a>
                        				<%} %>
                        				<br/>
                        				<font size="2">参与时间：<%=m.get("jointime") %>--<%=m.get("overtime")==null?"":m.get("overtime") %></font>
                          	<%}%>
                          	<%if(m.get("shstatus").equals("拒绝")){ %>
                          	<br/>
                          		<font size="2">对不起，您此次报名审核未通过，期待您的下一次参与！</font>
                          	<%} %>
                            	         
                              <%}else{%>
                              
                           <a href="activex.jsp?id=<%=amap.get("id") %>&studentid=<%=user.get("id") %>">【申请报名】</a>
                              <%} }%>
                            	
                            	
                            	
                            	  
                            	
             
                              
                              </TD></TR>
                          <TR vAlign=center align=middle>
                            <TD height=30 vAlign=center colSpan=2 
                              align=center>  
                              <img src="upfile/<%=amap.get("img") %>" height="200" width="200">
                            </TD></TR>
                          
                          <TR vAlign=center align=middle>
                            <TD height=56 vAlign=center colSpan=2 
                              align=middle><TABLE border=0 cellSpacing=0 
                              cellPadding=0 width="94%">
                                <TBODY>
                                <TR>
                                <TD height=21 vAlign=center width="50%" 
                                align=left class="lin">
                                <P>
                                <%HashMap mm = dao.select("select * from sysuser where id="+amap.get("saver")+"").get(0); %>
                                发起企业：<%=mm.get("tname") %>
                                </P>
                                </TD></TR>
                                <TR>
                                <TD height=21 vAlign=center width="50%" 
                                align=left class="lin">
                                <P>
                                发起日期：<%=amap.get("savetime") %>
                                </P>
                                </TD></TR>
                                <TR>
                                <TD height=21 vAlign=center width="50%" 
                                align=left class="lin">
                                <P>
                                津贴标准：<%=amap.get("jt") %>元/天
                                </P>
                                </TD></TR>
                                <TR>
                                <TD height=21 vAlign=center width="50%" 
                                align=left class="lin">
                                <P>
                                截止日期：<%=amap.get("etime") %>
                                </P>
                                </TD></TR>
                                <TR>
                                <TD height=21 vAlign=center width="50%" 
                                align=left class="lin">
                                工作介绍：<%=amap.get("content") %>
                                </TD></TR></TBODY></TABLE></TD></TR>
                                
                                <TR>
                                	<td>
                                	<hr size="1">
          <%ArrayList<HashMap> pjlist = (ArrayList<HashMap>)dao.select("select * from workpj where aid="+id+" order by savetime desc"); %>                      	
          <form action="/qgzxmis/mainCtrl?ac=workpj&id=<%=id %>" name="f1" method="post" onsubmit="return check()">
          <TABLE border=1 cellSpacing=0 cellPadding=0 width="94%">
          	<TBODY>
          	<%
          	if(user!=null&&ispj){ %>
          		<th colspan="3" align="left">
          			留言内容：<input type="text" id="content1" name="content1" size="80">
          			<input type="submit" value="评价">
          		</th>
          	<%} %>
          		<TR align="center">
          			<td class="lin">评价内容</td>
          			<td class="lin">评价人</td>
          			<td class="lin">评价日期</td>
          		</TR>
          		<%for(HashMap pjm:pjlist){ 
          			HashMap sm = dao.select("select * from sysuser where id='"+pjm.get("xs")+"'").get(0);
          		%>
          		<TR>
          			<td class="lin" width="60%"><%=pjm.get("content") %></td>
          			<td class="lin" align="center"><%=sm.get("tname") %></td>
          			<td class="lin" align="center"><%=pjm.get("savetime") %></td>
          		</TR>
          		<%} %>
          	</TBODY>
          </TABLE>
          </form>
                                	</td>
                                </TR>
                                
                                </TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR>
                                
                                
                                
                                </TBODY></TABLE>
          <!-- 内容结束 -->
          
          		
          
          
          
          </TD>
    </TR></TBODY></TABLE></TD>     </TR></TBODY></TABLE>
<SCRIPT type=text/javascript src="files/boot.js" 
loadClass="Time;FormValid"></SCRIPT>
<jsp:include page="foot.jsp"></jsp:include>
    </center>
      <script type="text/javascript">
  	function check(){
  		if(document.getElementById("content1").value==""){
  			alert("评价内容不能为空");
  			return false;
  		}
  	}
  	 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
  location.replace("/qgzxmis/activex.jsp?id=<%=id%>");
 <%}%>
  </script>
  </body>
</html>
