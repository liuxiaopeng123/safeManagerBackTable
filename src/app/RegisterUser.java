package app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class RegisterUser extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
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
		String user_sex = req.getParameter("user_sex");
		String user_height = req.getParameter("user_height");
		String user_weight = req.getParameter("user_weight");
		String user_status = req.getParameter("user_status");
		System.out.println(user_name+user_pwd);
		SafeManagerDao dao = new SafeManagerDao();
		JSONObject jsonObject = new JSONObject();
		if(dao.registerUser(user_name,user_pwd,user_sex,user_height,user_weight,user_status)){
			jsonObject.put("code", 200);
			jsonObject.put("msg", "注册成功！");
		}else{
			jsonObject.put("code", 400);
			jsonObject.put("msg", "账号已存在！");
		}
		String s1 =  jsonObject.toString();
		System.out.println(jsonObject.toString());
        out.print(s1);
        out.flush();
        out.close();
	}
	
}
