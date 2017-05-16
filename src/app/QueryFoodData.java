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
import bean.FoodDataBean;
import bean.SportDataBean;
import bean.UserInfoBean;

public class QueryFoodData extends HttpServlet{

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
		String foodStatus = req.getParameter("foodStatus");
		String foodType = req.getParameter("foodType");
		System.out.println(foodType+foodStatus);
		SafeManagerDao dao = new SafeManagerDao();
		List<FoodDataBean> sportDatas=dao.queryFoodData(foodType,foodStatus);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		if (sportDatas.size()<1) {
			jsonObject.put("code", 400);
			jsonObject.put("msg", "没有食物数据！");
		}else {
			for (int i = 0; i < sportDatas.size(); i++) {
				JSONObject object = new JSONObject();
				object.put("foodName", sportDatas.get(i).getFoodName());
				object.put("foodEnergy", sportDatas.get(i).getFoodEnergy());
				object.put("foodCount", sportDatas.get(i).getFoodCount());
				object.put("foodType", sportDatas.get(i).getFoodType());
				object.put("foodEatTime", sportDatas.get(i).getFoodEatTime());
				object.put("foodStatus", sportDatas.get(i).getFoodStatus());
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
