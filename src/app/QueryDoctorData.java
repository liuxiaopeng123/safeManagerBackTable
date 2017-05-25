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
import bean.DoctorDataBean;
import bean.FoodDataBean;
import bean.SportDataBean;
import bean.UserInfoBean;

public class QueryDoctorData extends HttpServlet{

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
		String name = req.getParameter("name");
		System.out.println(name+name);
		SafeManagerDao dao = new SafeManagerDao();
		
		List<DoctorDataBean> doctorDatas =dao.queryDoctorData(name);
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		if (doctorDatas.size()<1) {
			jsonObject.put("code", 400);
			jsonObject.put("msg", "没有医师数据！");
		}else {
			for (int i = 0; i < doctorDatas.size(); i++) {
				JSONObject object = new JSONObject();
				object.put("name", doctorDatas.get(i).getName());
				object.put("sex", doctorDatas.get(i).getSex());
				object.put("age", doctorDatas.get(i).getAge());
				object.put("work", doctorDatas.get(i).getWork());
				object.put("phone", doctorDatas.get(i).getPhone());
				object.put("status", doctorDatas.get(i).getStatus());
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
