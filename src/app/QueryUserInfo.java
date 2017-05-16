package app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import bean.UserInfoBean;

public class QueryUserInfo extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doget doget");
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("text/html");
        //定义字符输出流，将结果输出
        PrintWriter out = resp.getWriter();
        
		String user_name = req.getParameter("user_name");
		String user_pwd = req.getParameter("user_pwd");
		System.out.println(user_name+user_pwd);
		SafeManagerDao dao = new SafeManagerDao();
		UserInfoBean userinfoBean =dao.queryUserInfo(user_name,user_pwd);
		JSONObject jsonObject = new JSONObject();
		if (userinfoBean==null) {
			jsonObject.put("code", 400);
			jsonObject.put("msg", "账号不存在！");
		}else {
			System.out.println(userinfoBean.getUser_name()+"22222222"+userinfoBean.getUser_password());
			if (user_pwd.equals(userinfoBean.getUser_password())) {
				JSONObject data= new JSONObject();
				data.put("username", userinfoBean.getUser_name());
				data.put("userpwd", userinfoBean.getUser_password());
				data.put("usersex", userinfoBean.getUser_sex());
				data.put("userheight", userinfoBean.getUser_height());
				data.put("userweight", userinfoBean.getUser_weight());
				data.put("userstatus", userinfoBean.getUser_status());
				jsonObject.put("code", 200);
				jsonObject.put("msg", "操作成功");
				jsonObject.put("data", data);
			}else {
				jsonObject.put("code", 400);
				jsonObject.put("msg", "密码错误！");
			}
			
		}
		String s1 =  jsonObject.toString();
		System.out.println(jsonObject.toString());
        out.print(s1);
        out.flush();
        out.close();
	}
	
	
	
	

}
