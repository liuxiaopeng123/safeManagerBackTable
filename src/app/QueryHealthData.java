package app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import bean.HealthDataBean;
import bean.UserInfoBean;

public class QueryHealthData extends HttpServlet{

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
        
		String userName = req.getParameter("username");
		System.out.println(userName+userName);
		SafeManagerDao dao = new SafeManagerDao();
		HealthDataBean healthDataBean =dao.queryHealthData(userName);
		JSONObject jsonObject = new JSONObject();
		if (healthDataBean==null) {
			jsonObject.put("code", 400);
			jsonObject.put("msg", "账号不存在！");
		}else {
				JSONObject data= new JSONObject();
				data.put("userName", healthDataBean.getUserName());
				data.put("userHealthNumber", healthDataBean.getUserHealthNumber());
				data.put("userSsy", healthDataBean.getUserSsy());
				data.put("userSzy", healthDataBean.getUserSzy());
				data.put("userXl", healthDataBean.getUserXl());
				data.put("userDate", healthDataBean.getUserDate());
				jsonObject.put("code", 200);
				jsonObject.put("msg", "操作成功");
				jsonObject.put("data", data);
			
			
		}
		String s1 =  jsonObject.toString();
		System.out.println(jsonObject.toString());
        out.print(s1);
        out.flush();
        out.close();
	}
	
	
	
	

}
