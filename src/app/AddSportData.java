package app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class AddSportData extends HttpServlet{

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
        
		String username = req.getParameter("username");
		String date = req.getParameter("date");
		String step = req.getParameter("step");
		String energy = req.getParameter("energy");
		String distance = req.getParameter("distance");
		SafeManagerDao dao = new SafeManagerDao();
		dao.addSportData(username,date,step,energy,distance);
		JSONObject jsonObject = new JSONObject();
		if(dao.addSportData(username,date,step,energy,distance)){
			jsonObject.put("code", 200);
			jsonObject.put("msg", "添加成功！");
		}else{
			jsonObject.put("code", 400);
			jsonObject.put("msg", "操作失败！");
		}
		String s1 =  jsonObject.toString();
		System.out.println(jsonObject.toString());
        out.print(s1);
        out.flush();
        out.close();
	}
	
}
