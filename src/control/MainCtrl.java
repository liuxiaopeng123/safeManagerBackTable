package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

import common.CommDAO;




import util.Info;


public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap admin = (HashMap)session.getAttribute("admin");
		HashMap user = (HashMap)session.getAttribute("user");
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);
		
		//登录
		if(ac.equals("login"))
		{
			    String uname = request.getParameter("uname");
			    String upass = request.getParameter("upass");
			    	String sql = "select * from sysuser where uname='"+uname+"' and upass='"+upass+"' and delstatus='0' and utype not in('学生') ";
			    	List<HashMap> list = dao.select(sql);
			    	if(list.size()>0){
			    		session.setAttribute("admin", list.get(0));
			    	gor("./admin/index.jsp", request, response);
			    	}else{
			    		request.setAttribute("error", "");
				    	go("./admin/login.jsp", request, response);
			    	}
		}
		//学生前台登陆
		if(ac.equals("login1")){
			 String uname = request.getParameter("uname");
			    String upass = request.getParameter("upass");
			    String sql = "select * from sysuser where uname='"+uname+"' and upass='"+upass+"' and delstatus='0' and utype='学生' ";
			    List<HashMap> list = dao.select(sql);
			    System.out.println(list.size());
		    	if(list.size()>0){
		    		session.setAttribute("user", list.get(0));
		    		request.setAttribute("suc", "");
		    		go("./login.jsp", request, response);
		    	}else{
		    		request.setAttribute("no", "");
			    	go("./login.jsp", request, response);
		    	}
		}
		
		
		//退出登录
		if(ac.equals("exit"))
		{
			    	session.removeAttribute("admin");
			    	
			    	gor("/admin/login.jsp", request, response);
			    	
			    	
		}
		
		//修改密码
		if(ac.equals("uppass"))
		{
			    String oldpass = request.getParameter("oldpass");  
			    String upass = request.getParameter("userpass");
			    if(!admin.get("upass").equals(oldpass))
			    {
			    	request.setAttribute("error", "");
			    	go("/admin/uppass.jsp", request, response);
			    }else{
			    	String sql = "update sysuser set upass='"+upass+"' where id="+admin.get("id");
			    	dao.commOper(sql);
			    	request.setAttribute("suc", "");
			    	go("/admin/uppass.jsp", request, response);
			    }
		}
		//添加留言
		if(ac.equals("addmsg")){
			String title = request.getParameter("title");
			String tname = request.getParameter("tname");
			String content = request.getParameter("content");
			String reply = "";
			String savetime = Info.getDateStr();
			String sql = "insert into msg (title,content,tname,reply,savetime) values ('"+title+"','"+content+"','"+tname+"','"+reply+"','"+savetime+"') ";
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/chat.jsp", request, response);
		}
		
		//留言回复
		if(ac.equals("msghf")){
			String id = request.getParameter("id");
			String reply = request.getParameter("mt");
			String sql = "update msg set reply='"+reply+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/admin/n-chathf.jsp", request, response);
		}
		
		//添加新闻
		if(ac.equals("addnotice")){
			
			try {
				String title="";
				String mt = "";
				String filename = "";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){
			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     
			     mt = ((FileItem) items.get(2)).getString();
			     mt = Info.getUTFStr(mt);		   
			     
			    FileItem fileItem = (FileItem) items.get(1);

			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    
			}
			String sql = "insert into info (title,content,type,savetime,img) values ('"+title+"','"+mt+"','1','"+Info.getDateStr()+"','"+filename+"') ";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/n-noticeadd.jsp", request, response);
			
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/n-noticeadd.jsp").forward(request, response);
			    }
			/*String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String savetime = Info.getDateStr();
			String type = "1";
			String sql = "insert into info (title,content,type,savetime) values ('"+title+"','"+content+"','"+type+"','"+savetime+"') ";
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/admin/n-noticeadd.jsp", request, response);*/
			
		}
		
		//编辑新闻
		if(ac.equals("editnotice")){
			
			String id = request.getParameter("id");
			HashMap map = dao.select("select * from info where id="+id).get(0);
			try {
				String title="";
				String mt = "";
				String filename=map.get("img").toString();
				String sql = "";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     mt = ((FileItem) items.get(2)).getString();
			     mt = Info.getUTFStr(mt);
			    FileItem fileItem = (FileItem) items.get(1);
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      sql = "update info set title='"+title+"',content='"+mt+"',img='"+filename+"' where id="+id ;
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			    	 sql = "update info set title='"+title+"',content='"+mt+"' where id="+id ;
			     }
			}
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/n-noticeadd.jsp?id="+id, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/n-noticeadd.jsp?id="+id).forward(request, response);
			    }
			/*String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String savetime = Info.getDateStr();
			String type = "1";
			String sql = "update info set title='"+title+"',content='"+content+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/admin/n-noticeadd.jsp", request, response);*/
			
		}
		
		
		//添加活动
		if(ac.equals("activeadd")){
			
			try {
				String title="";
				String mt = "";
				String type = "";
				String jt = "";
				String etime = "";
				String filename = "";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){
			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     type = ((FileItem) items.get(2)).getString();
			     type = Info.getUTFStr(type);
			     jt = ((FileItem) items.get(3)).getString();
			     jt = Info.getUTFStr(jt);
			     etime = ((FileItem) items.get(4)).getString();
			     etime = Info.getUTFStr(etime);
			     mt = ((FileItem) items.get(5)).getString();
			     mt = Info.getUTFStr(mt);
			     
			     
			    FileItem fileItem = (FileItem) items.get(1);

			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    
			}
			String sql = "insert into active (title,content,type,savetime,delstatus,saver,img,jt,etime) values ('"+title+"','"+mt+"','"+type+"','"+Info.getDateStr()+"','0','"+admin.get("id")+"','"+filename+"','"+jt+"','"+etime+"') ";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/activeadd.jsp", request, response);
			
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/activeadd.jsp").forward(request, response);
			    }
		}
		
		//编辑活动
		if(ac.equals("activeedit")){
			
			String id = request.getParameter("id");
			HashMap map = dao.select("select * from active where id="+id).get(0);
			try {
				String title="";
				String mt = "";
				String type="";
				String jt = "";
				String etime = "";
				String filename=map.get("img").toString();
				String sql = "";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     title = ((FileItem) items.get(0)).getString();
			     title = Info.getUTFStr(title);
			     type = ((FileItem) items.get(2)).getString();
			     jt = Info.getUTFStr(jt);
			     jt = ((FileItem) items.get(3)).getString();
			     type = Info.getUTFStr(type);
			     etime = ((FileItem) items.get(4)).getString();
			     etime = Info.getUTFStr(etime);
			     mt = ((FileItem) items.get(5)).getString();
			     mt = Info.getUTFStr(mt);
			    FileItem fileItem = (FileItem) items.get(1);
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      sql = "update active set title='"+title+"',content='"+mt+"',img='"+filename+"',type='"+type+"',jt='"+jt+"',etime='"+etime+"' where id="+id ;
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			    	 sql = "update active set title='"+title+"',content='"+mt+"',type='"+type+"',jt='"+jt+"',etime='"+etime+"' where id="+id ;
			     }
			}
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/activeadd.jsp?id="+id, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/activeadd.jsp?id="+id).forward(request, response);
			    }
		}
		
		//编辑联系我们
		if(ac.equals("editcontact")){
			String content = request.getParameter("mt");
			String sql = "update companyjj set content='"+content+"' where id=2 "; 
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/admin/n-contact.jsp", request, response);
		}
		
		//编辑网站简介
		if(ac.equals("editcompanyjj")){
			String content = request.getParameter("mt");
			String sql = "update companyjj set content='"+content+"' where id=1 "; 
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/admin/n-companyjj.jsp", request, response);
		}
		
		//添加工作类型
		if(ac.equals("addprotype")){
			String typename = request.getParameter("typename");
			String delstatus = "0";
			dao.commOper("insert into protype (typename,delstatus) values('"+typename+"','"+delstatus+"')");
			request.setAttribute("suc", "");
	    	go("/admin/n-protypeadd.jsp", request, response);
		}
		//编辑工作类型
		if(ac.equals("editprotype")){
			String id = request.getParameter("id");
			String typename = request.getParameter("typename");
			String sql = "update protype set typename='"+typename+"' where id="+id; 
			dao.commOper(sql);
			request.setAttribute("suc", "");
	    	go("/admin/n-protypeadd.jsp", request, response);
		}
		
		//添加
		if(ac.equals("addst"))
		{
			try {
				String pno="";
				String pname="";
				String type="";
				String mt = "";
				String filename = "";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){
			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     
			     pno = ((FileItem) items.get(0)).getString();
			     pno = Info.getUTFStr(pno);
			     
			     pname = ((FileItem) items.get(1)).getString();
			     pname = Info.getUTFStr(pname);
			     
			     type = ((FileItem) items.get(2)).getString();
			     type = Info.getUTFStr(type);
			     
			     mt = ((FileItem) items.get(4)).getString();
			     mt = Info.getUTFStr(mt);		   
			     
			    FileItem fileItem = (FileItem) items.get(3);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}

			String sql = "insert into st (pno,pname,type,pinfo,img,delstatus) values('"+pno+"','"+pname+"','"+type+"','"+mt+"','"+filename+"','0')" ;
			System.out.println(sql);
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/n-stadd.jsp", request, response);
			
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/n-stadd.jsp").forward(request, response);
			    }
		}
		//修改
		if(ac.equals("editst"))
		{
			String id = request.getParameter("id");
			HashMap map = dao.select("select * from st where id="+id).get(0);
			try {
				String pno="";
				String pname="";
				String type="";
				String mt = "";
				String filename=map.get("img").toString();
				String sql = "";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			     items = upload.parseRequest(request);
			     pno = ((FileItem) items.get(0)).getString();
			     pno = Info.getUTFStr(pno);
			     
			     pname = ((FileItem) items.get(1)).getString();
			     pname = Info.getUTFStr(pname);
			     
			     type = ((FileItem) items.get(2)).getString();
			     type = Info.getUTFStr(type);
			     
			     mt = ((FileItem) items.get(4)).getString();
			     mt = Info.getUTFStr(mt);
			     
			    FileItem fileItem = (FileItem) items.get(3);
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      sql = "update st set pno='"+pno+"',pname='"+pname+"',type='"+type+"',img='"+filename+"',pinfo='"+mt+"' where id="+id ;
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			    	 sql = "update st set pno='"+pno+"',pname='"+pname+"',type='"+type+"',pinfo='"+mt+"' where id="+id ;
			     }
			}
			
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/n-stadd.jsp?id="+id, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
				request.setAttribute("error", "");
			     request.getRequestDispatcher("/admin/n-stadd.jsp?id="+id).forward(request, response);
			    }
		}
		
		//学生注册
		if(ac.equals("reg")){
			String uname  = request.getParameter("uname");
			String upass  = request.getParameter("upass");
			String tname  = request.getParameter("tname");
			String tel  = request.getParameter("tel");
			String bj  = request.getParameter("bj");
			String xy  = request.getParameter("xy");
			String delstatus = "0";
			ArrayList cklist = (ArrayList)dao.select("select * from sysuser where uname='"+uname+"' and delstatus='0'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/reg.jsp", request, response);
			}else{
				dao.commOper("insert into sysuser (uname,upass,tname,tel,bj,delstatus,utype,xy)" +
						" values ('"+uname+"','"+upass+"','"+tname+"','"+tel+"','"+bj+"','"+delstatus+"','学生','"+xy+"')");
				request.setAttribute("suc", "");
		    	go("/reg.jsp", request, response);
			}
		}
		//学生修改个人信息
		if(ac.equals("upmyinfo")){
			String upass  = request.getParameter("upass");
			String tname  = request.getParameter("tname");
			String tel  = request.getParameter("tel");
			String bj  = request.getParameter("bj");
			String xy  = request.getParameter("xy");
			String id  = request.getParameter("id");
			dao.commOper("update sysuser set upass='"+upass+"',tname='"+tname+"',tel='"+tel+"',bj='"+bj+"',xy='"+xy+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/myinfo.jsp", request, response);
		}
		//学生退出
		if(ac.equals("studentexit")){
			 session.removeAttribute("user");
		    	gor("./index.jsp", request, response);
		}
		
		//管理员添加学生
		if(ac.equals("zyzadd")){
			String uname  = request.getParameter("uname");
			String upass  = request.getParameter("upass");
			String tname  = request.getParameter("tname");
			String tel  = request.getParameter("tel");
			String bj  = request.getParameter("bj");
			String xy  = request.getParameter("xy");
			String delstatus = "0";
			ArrayList cklist = (ArrayList)dao.select("select * from sysuser where uname='"+uname+"' and delstatus='0'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/admin/useradd.jsp", request, response);
			}else{
				dao.commOper("insert into sysuser (uname,upass,tname,tel,bj,delstatus,utype,xy)" +
						" values ('"+uname+"','"+upass+"','"+tname+"','"+tel+"','"+bj+"','"+delstatus+"','学生','"+xy+"')");
				request.setAttribute("suc", "");
		    	go("/admin/useradd.jsp", request, response);
			}
		}
		
		//个人健康管理 用户管理 -添加用户
		if(ac.equals("adduser_safe")){
			String user_name = request.getParameter("user_name");
			String user_pwd = request.getParameter("user_pwd");
			String user_sex = request.getParameter("user_sex");
			String user_height = request.getParameter("user_height");
			String user_weight = request.getParameter("user_weight");
			String user_status = request.getParameter("user_status");
			
			ArrayList cklist = (ArrayList)dao.select("select * from user_info_safemanager where user_name='"+user_name+"'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/admin/adduser_safe.jsp", request, response);
			}else{
				dao.commOper("insert into user_info_safemanager (user_name,user_password,user_sex,user_height,user_weight,user_status)" +
						" values ('"+user_name+"','"+user_pwd+"','"+user_sex+"','"+user_height+"','"+user_weight+"','"+user_status+"')");
				request.setAttribute("suc", "");
		    	go("/admin/adduser_safe.jsp", request, response);
			}
		}
		
		//管理员修改学生个人信息
		if(ac.equals("updateuser_safe")){
			String user_id  = request.getParameter("user_id");
			String user_password  = request.getParameter("user_password");
			String user_sex  = request.getParameter("user_sex");
			String user_height  = request.getParameter("user_height");
			String user_weight  = request.getParameter("user_weight");
			System.out.println(user_weight+user_height);
			String user_status  = request.getParameter("user_status");
			dao.commOper("update user_info_safemanager set user_password='"+user_password+"',user_sex='"+user_sex+"',user_height='"+user_height+"',user_weight='"+user_weight+"',user_status='"+user_status+"' where user_id="+user_id);
			request.setAttribute("suc", "");
	    	go("/admin/edituser_safe.jsp", request, response);
		}
		
		//企业注册
		if(ac.equals("regqy")){
			String uname  = request.getParameter("uname");
			String upass  = request.getParameter("upass");
			String tname  = request.getParameter("tname");
			String tel  = request.getParameter("tel");
			String addr  = request.getParameter("addr");
			String delstatus = "0";
			ArrayList cklist = (ArrayList)dao.select("select * from sysuser where uname='"+uname+"' and delstatus='0'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/regqy.jsp", request, response);
			}else{
				dao.commOper("insert into sysuser (uname,upass,tname,tel,addr,delstatus,utype)" +
						" values ('"+uname+"','"+upass+"','"+tname+"','"+tel+"','"+addr+"','"+delstatus+"','企业')");
				request.setAttribute("suc", "");
		    	go("/regqy.jsp", request, response);
			}
		}
		//管理员添加运动数据
		if(ac.equals("addsportdata_safe")){
			String username = request.getParameter("username");
			String sportadddate = request.getParameter("date");
			String step = request.getParameter("step");
			String energy = request.getParameter("energy");
			String distance = request.getParameter("distance");
			
			ArrayList cklist = (ArrayList)dao.select("select * from sportdata where username='"+username+"'"+"' and date='"+sportadddate+"'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/admin/addsportdata_safe.jsp", request, response);
			}else{
				dao.commOper("insert into sportdata (username,date,step,energy,distance)" +
						" values ('"+username+"','"+sportadddate+"','"+step+"','"+energy+"','"+distance+"')");
				request.setAttribute("suc", "");
		    	go("/admin/addsportdata_safe.jsp", request, response);
			}
		}
		//管理员添加食物数据
		if(ac.equals("addfood_safe")){
			String foodname = request.getParameter("foodname");
			String foodenergy = request.getParameter("foodenergy");
			String foodcount = request.getParameter("foodcount");
			String foodtype = request.getParameter("foodtype");
			String foodeattime = request.getParameter("foodeattime");
			String foodstatus = request.getParameter("foodstatus");
			
			ArrayList cklist = (ArrayList)dao.select("select * from foodmanager where foodname='"+foodname+"'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/admin/addfood_safe.jsp", request, response);
			}else{
				dao.commOper("insert into foodmanager (foodname,foodenergy,foodcount,foodtype,foodeattime,foodstatus)" +
						" values ('"+foodname+"','"+foodenergy+"','"+foodcount+"','"+foodtype+"','"+foodeattime+"','"+foodstatus+"')");
				request.setAttribute("suc", "");
		    	go("/admin/addfood_safe.jsp", request, response);
			}
		}
		//管理员添加健康数据
		if(ac.equals("addhealth_safe")){
			String username = request.getParameter("username");
			String userhealthnumber = request.getParameter("userhealthnumber");
			String userssy = request.getParameter("userssy");
			String userszy = request.getParameter("userszy");
			String userxl = request.getParameter("userxl");
			String userdate = request.getParameter("userdate");
			
			ArrayList cklist = (ArrayList)dao.select("select * from healthmanager where username='"+username+"'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/admin/addhealth_safe.jsp", request, response);
			}else{
				dao.commOper("insert into healthmanager (username,userhealthnumber,userssy,userszy,userxl,date)" +
						" values ('"+username+"','"+userhealthnumber+"','"+userssy+"','"+userszy+"','"+userxl+"','"+userdate+"')");
				request.setAttribute("suc", "");
		    	go("/admin/addhealth_safe.jsp", request, response);
			}
		}
		
		//管理员添加医师数据
		if(ac.equals("adddoctorconsult")){
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String work = request.getParameter("work");
			String phone = request.getParameter("phone");
			
			ArrayList cklist = (ArrayList)dao.select("select * from doctorconsult where name='"+name+"'");
			if(cklist.size()!=0){
				request.setAttribute("no", "");
		    	go("/admin/adddoctorconsult.jsp", request, response);
			}else{
				dao.commOper("insert into doctorconsult (name,sex,age,work,phone,status)" +
						" values ('"+name+"','"+sex+"','"+age+"','"+work+"','"+phone+"','0')");
				request.setAttribute("suc", "");
		    	go("/admin/adddoctorconsult.jsp", request, response);
			}
		}
		
		//编辑医师数据
		if(ac.equals("editdoctorconsult")){
			String id  = request.getParameter("id");
			String name  = request.getParameter("name");
			String age  = request.getParameter("age");
			String sex  = request.getParameter("sex");
			String work  = request.getParameter("work");
			String phone  = request.getParameter("phone");
			dao.commOper("update doctorconsult set name='"+name+"',age='"+age+"',sex='"+sex+"',work='"+work+"',phone='"+phone+"',status='"+"0"+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/admin/editdoctorconsult.jsp", request, response);
		}
		
		//编辑运动数据
		if(ac.equals("editdatamanager_safe")){
			String id  = request.getParameter("id");
			String newDate  = request.getParameter("date");
			String step  = request.getParameter("step");
			String energy  = request.getParameter("energy");
			String distance  = request.getParameter("distance");
			dao.commOper("update sportdata set date='"+newDate+"',step='"+step+"',energy='"+energy+"',distance='"+distance+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/admin/editdatamanager_safe.jsp", request, response);
		}
		
		//编辑食物数据
		if(ac.equals("editfoodmanager_safe")){
			String id  = request.getParameter("id");
			String foodname  = request.getParameter("foodname");
			String foodenergy  = request.getParameter("foodenergy");
			String foodcount  = request.getParameter("foodcount");
			String foodtype  = request.getParameter("foodtype");
			String foodeattime  = request.getParameter("foodeattime");
			String foodstatus  = request.getParameter("foodstatus");
			dao.commOper("update foodmanager set foodname='"+foodname+"',foodenergy='"+foodenergy+"',foodcount='"+foodcount+"',foodtype='"+foodtype+"',foodeattime='"+foodeattime+"',foodstatus='"+foodstatus+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/admin/editfoodmanager_safe.jsp", request, response);
		}
		//编辑健康数据
		if(ac.equals("edithealthmanager_safe")){
			String id=request.getParameter("id");
			String username  = request.getParameter("username");
			String userhealthnumber  = request.getParameter("userhealthnumber");
			String userssy  = request.getParameter("userssy");
			String userszy  = request.getParameter("userszy");
			String userxl  = request.getParameter("userxl");
			String userdate  = request.getParameter("date");
			dao.commOper("update healthmanager set userhealthnumber='"+userhealthnumber+"',userssy='"+userssy+"',userszy='"+userszy+"',userxl='"+userxl+"',date='"+userdate+"' where id="+id);
			request.setAttribute("suc", "");
	    	go("/admin/edithealthmanager_safe.jsp", request, response);
		}
		
		if(ac.equals("druser")){
			String uname  = "";
			String upass  = "";
			String tname  = "";
			String tel  = "";
			String bj  = "";
			String xy  = "";
			String delstatus = "0";
			 try {
					String filename="";  
				request.setCharacterEncoding("utf-8");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){
				   DiskFileItemFactory factory = new DiskFileItemFactory();
				   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
				   ServletFileUpload upload = new ServletFileUpload(factory);
				   upload.setSizeMax(100*1024*1024);
				   List items = new ArrayList();
				     items = upload.parseRequest(request);
				    FileItem fileItem = (FileItem) items.get(0);
				     if(fileItem.getName()!=null && fileItem.getSize()!=0){
				      File fullFile = new File(fileItem.getName());
				      filename = Info.generalFileName(fullFile.getName());
				      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
				      try {
				       fileItem.write(newFile);
				      } catch (Exception e) {
				       e.printStackTrace();
				      }
				     }else{
				     }
				    }
				  List   result   =   new   ArrayList();   
				  File   uploadFileName   =   new   File(request.getRealPath("/upfile/")+"/" + filename);   
				  InputStream   is   =   new   FileInputStream(uploadFileName);   
				  jxl.Workbook   excel   =   Workbook.getWorkbook(is);    
				  Sheet   sheet   =   excel.getSheet(0);  
				  int   rows   =   sheet.getRows();   
				  int   columns   =   sheet.getColumns();   
				  for   (int   r   =   0;   r   <   rows;   r++)   {   
				  String[]   rowDates   =   new   String[columns];  
				  if(r>0)
				  {
					  System.out.println("这是第"+r+"行");
					  uname = sheet.getCell(0,   r).getContents();
					  upass = sheet.getCell(1,   r).getContents();
					  tname = sheet.getCell(2,   r).getContents();
					  tel = sheet.getCell(3,   r).getContents();
					  bj = sheet.getCell(4,   r).getContents();
					  xy = sheet.getCell(5,   r).getContents();
					  ArrayList<HashMap> lll = (ArrayList)dao.select("select * from sysuser where uname='"+uname+"' and delstatus='0'");
					  if(lll.size()==0){
						  String sql = "insert into sysuser (uname,upass,tname,tel,bj,delstatus,utype,xy)" +
							" values ('"+uname+"','"+upass+"','"+tname+"','"+tel+"','"+bj+"','"+delstatus+"','学生','"+xy+"')";
							 System.out.println(sql);
							  dao.commOper(sql);
							  
					  }
					  //else{
					 // request.setAttribute("no", "");
				    //	go("/addjspl.jsp", request, response);
					 // }
				  }
				  for   (int   c   =   0;   c   <   columns;   c++)   {   
				  Cell   cell   =   sheet.getCell(c,   r);   
				  String   cellValue   =   cell.getContents();   
				  rowDates[c]   =   cellValue;  
				  }   
				  result.add(rowDates);   
				  }   
				  excel.close();   
				  }   catch   (Exception   e)   {   
				  System.out.println(e.getMessage());   
				  }   
			/*String sql = "insert into kq values (null,'"+sno+"','"+kcname+"','"+remark+"','"+time+"','"+tid+"')";
			*/
				  request.setAttribute("suc", "");
			    	go("/admin/druser.jsp", request, response);
		    }
		if(ac.equals("exporttj")){
			String aid = request.getParameter("aid");
			String sql = "select * from joininfo where shstatus='通过' and overtime is not null  ";
			if(aid!=null&&!aid.equals("")){
				sql+=" and (stid ='"+aid+"' ) ";
			}else{
				sql += "and stid in (select id from active where saver='"+admin.get("id")+"')";
			}
			ArrayList<HashMap> list = (ArrayList)dao.select(sql); 
			List<List> list1  = new ArrayList();
			if(list.size()!=0){
				for(HashMap m:list){
					List mlist  = new ArrayList();
					HashMap mm = dao.select("select * from sysuser where id="+m.get("studentid")).get(0);
					mlist.add(mm.get("uname"));
		      		mlist.add(mm.get("tname"));
					mlist.add(mm.get("tel"));
					mlist.add(mm.get("bj"));
					mlist.add(mm.get("xy"));
					HashMap mmm = dao.select("select * from active where id='"+m.get("stid")+"'").get(0);
					mlist.add(mmm.get("title"));
					mlist.add(m.get("jointime"));
					mlist.add(m.get("overtime"));
					Double zje = 0.0;
				    int sjc = 0;
				    if(m.get("overtime")!=null){
				    	sjc = Info.dayToday(m.get("jointime").toString().substring(0,11),m.get("overtime").toString().substring(0,11));
				    	zje = sjc * Double.valueOf(mmm.get("jt").toString());
				    }
				    mlist.add(sjc);
				    //mlist.add(zje);
					list1.add(mlist);
				}
			}
			String[] pros = {"学号","姓名","电话","班级","学院","参与活动","加入时间","离开时间","天数"};
			Info.writeExcel(request.getRealPath("/upfile/")+"/exporttj.xls", pros, list1, request, response);
		}
		
		if(ac.equals("xskaoqadd")){
			String id = request.getParameter("id");
			String xs = request.getParameter("xs");
			String aid = request.getParameter("aid");
			String rq = request.getParameter("rq");
			String hournum = request.getParameter("hournum");
			ArrayList cklist = (ArrayList)dao.select("select * from xskaoq where rq='"+rq+"' and xs='"+xs+"' and aid='"+aid+"'");
			if(cklist.size()==0){
				dao.commOper("insert into xskaoq (xs,aid,rq,hournum) values ('"+xs+"','"+aid+"','"+rq+"','"+hournum+"')");
				request.setAttribute("suc", "");
			}else{
				request.setAttribute("no", "");
			}
	    	go("/admin/xskaoqadd.jsp?id="+id, request, response);
		}
		
		if(ac.equals("workpj")){
			String content = request.getParameter("content1");
			String aid = request.getParameter("id");
			dao.commOper("insert into workpj (aid,xs,content,savetime) values ('"+aid+"','"+user.get("id")+"','"+content+"','"+Info.getDateStr()+"')");
			request.setAttribute("suc", "");
			go("/activex.jsp?id="+aid, request, response);
		}
		
	dao.close();
	out.flush();
	out.close();
}


	public void init() throws ServletException {
		// Put your code here
	}
	
	

}
