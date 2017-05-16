package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import bean.SportDataBean;
import bean.UserInfoBean;

public class QuerySportData extends HttpServlet{

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
		String userName = req.getParameter("username");
		System.out.println(userName);
		SafeManagerDao dao = new SafeManagerDao();
		List<SportDataBean> sportDatas=dao.querySportData(userName);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		if (sportDatas.size()<1) {
			jsonObject.put("code", 400);
			jsonObject.put("msg", "没有运动数据！");
		}else {
			for (int i = 0; i < sportDatas.size(); i++) {
				JSONObject object = new JSONObject();
				object.put("userName", sportDatas.get(i).getUserName());
				object.put("date", sportDatas.get(i).getDate());
				object.put("step", sportDatas.get(i).getStep());
				object.put("energy", sportDatas.get(i).getEnergy());
				object.put("distance", sportDatas.get(i).getDistance());
				jsonArray.add(object);
			}
			jsonObject.put("code", 200);
			jsonObject.put("msg", "操作成功！");
			jsonObject.put("data", jsonArray);
			
			
		}
		String s1 =  jsonObject.toString();
		System.out.println(jsonObject.toString());
        out.print(s1);
        out.flush();
        out.close();
	}
	
	
	
	

}
