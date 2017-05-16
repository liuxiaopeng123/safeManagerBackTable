package app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class UpdateHealthData extends HttpServlet{

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
        
		String username = req.getParameter("username");
		String userhealthnumber = req.getParameter("userhealthnumber");
		String userssy = req.getParameter("userssy");
		String userszy = req.getParameter("userszy");
		String userxl = req.getParameter("userxl");
		
		System.out.println(username+username);
		SafeManagerDao dao = new SafeManagerDao();
		boolean isOK =(boolean) dao.updateHealthData(username,userhealthnumber,userssy,userszy,userxl);
		JSONObject jsonObject = new JSONObject();
		if (!isOK) {
			jsonObject.put("code", 400);
			jsonObject.put("msg", "账号不存在！");
		}else {
			JSONObject data= new JSONObject();
			jsonObject.put("code", 200);
			jsonObject.put("msg", "操作成功");
			
		}
		String s1 =  jsonObject.toString();
		System.out.println(jsonObject.toString());
        out.print(s1);
        out.flush();
        out.close();
	}
	
	
	
	

}
