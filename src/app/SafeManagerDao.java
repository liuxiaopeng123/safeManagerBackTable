package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.DoctorDataBean;
import bean.FoodDataBean;
import bean.HealthDataBean;
import bean.SportDataBean;
import bean.UserInfoBean;

public class SafeManagerDao {

	Connection conn = null;

	public SafeManagerDao() {
		conn = this.connect();
	}

	//连接数据库
	public Connection connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String dburl = "jdbc:sqlserver://127.0.0.1:1433;databaseName=qgzxmis_db";
			conn = DriverManager.getConnection(dburl, "sa", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	//用户注册
	public boolean registerUser(String userName, String userPwd, String userSex,
			String userHeight, String userWeight, String userStatus) {
		try {
			Statement stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from user_info_safemanager where user_name='"+userName+"'"); 
			boolean user_is_register=false;
			while (rs.next()) {
				user_is_register=true;
			}
			if (user_is_register) {
				rs.close();  
				stmt.close();
				return false;
			}else {
				stmt.executeUpdate("insert into user_info_safemanager (user_name,user_password,user_sex,user_height,user_weight,user_status)" +
						" values ('"+userName+"','"+userPwd+"','"+userSex+"','"+userHeight+"','"+userWeight+"','"+userStatus+"')"); 
				stmt.executeUpdate("insert into healthmanager (username,userhealthnumber,userssy,userszy,userxl,date)" +
						" values ('"+userName+"','"+"88"+"','"+"70"+"','"+"120"+"','"+"65"+"','"+"0"+"')"); 
				rs.close();  
				stmt.close();
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//用户登录
	public UserInfoBean queryUserInfo(String user_name,String user_password){
		UserInfoBean userInfoBean = null;
		try {
			Statement stmt=conn.createStatement();  
			//第四步，执行SQL语句，增加，删除，修改记录  
//			stmt.executeUpdate("增加，删除，修改记录的SQL语句");  
			//或者查询记录  
			ResultSet rs = stmt.executeQuery("select * from user_info_safemanager where user_name='"+user_name+"'");  
			System.out.println("xiaopeng"+rs.getMetaData());
			//获得数据
			ResultSetMetaData resultSetMetaDate=rs.getMetaData();
			//获得列数
			int colimnCount=resultSetMetaDate.getColumnCount();
			//第五步，对查询的结果进行处理  
			while(rs.next()){ 
				userInfoBean = new UserInfoBean();
				for (int i = 1; i <= colimnCount; i++) {
					if ("user_name".equals(resultSetMetaDate.getColumnName(i))) {
						userInfoBean.setUser_name(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("user_password".equals(resultSetMetaDate.getColumnName(i))) {
						userInfoBean.setUser_password(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("user_sex".equals(resultSetMetaDate.getColumnName(i))) {
						userInfoBean.setUser_sex(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("user_height".equals(resultSetMetaDate.getColumnName(i))) {
						userInfoBean.setUser_height(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("user_weight".equals(resultSetMetaDate.getColumnName(i))) {
						userInfoBean.setUser_weight(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("user_status".equals(resultSetMetaDate.getColumnName(i))) {
						userInfoBean.setUser_status(rs.getString(i));
						System.out.println(rs.getString(i));
					}
				}
			//对记录的操作  
			}  
			//第六步，关闭连接  
			rs.close();  
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userInfoBean;  
		
	}


	//查询用户运动信息
	public List<SportDataBean> querySportData(String userName) {
		List<SportDataBean> beans=new ArrayList<SportDataBean>();
		try {
			Statement stmt=conn.createStatement();  
			//或者查询记录  
			ResultSet rs = stmt.executeQuery("select * from sportdata where username='"+userName+"'");  
			//获得数据
			ResultSetMetaData resultSetMetaDate=rs.getMetaData();
			//获得列数
			int colimnCount=resultSetMetaDate.getColumnCount();
			//第五步，对查询的结果进行处理  
			while(rs.next()){ 
				SportDataBean bean = new SportDataBean();
				for (int i = 1; i <= colimnCount; i++) {
					if ("username".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setUserName(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("date".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setDate(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("step".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setStep(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("energy".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setEnergy(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("distance".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setDistance(rs.getString(i));
						System.out.println(rs.getString(i));
					}
				}
				beans.add(bean);
			//对记录的操作  
			}  
			//第六步，关闭连接  
			rs.close();  
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return beans;
		
	}
	
	
	//添加用户数据
	public boolean addSportData(String username, String date, String step,
			String energy, String distance) {
		try {
			Statement stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from sportdata where username='"+username+"' and date='"+date+"'"); 
			boolean date_is_exist=false;
			while (rs.next()) {
				date_is_exist=true;
			}
			if (date_is_exist) {
				rs.close();  
				stmt.close();
				return true;
			}else {
				stmt.executeUpdate("insert into sportdata (username,date,step,energy,distance)" +
						" values ('"+username+"','"+date+"','"+step+"','"+energy+"','"+distance+"')"); 
				rs.close();  
				stmt.close();
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	//查询饮食数据
	public List<FoodDataBean> queryFoodData(String foodType,String foodstatus) {
		List<FoodDataBean> beans=new ArrayList<FoodDataBean>();
		try {
			Statement stmt=conn.createStatement();  
			//或者查询记录  
			ResultSet rs = stmt.executeQuery("select * from foodmanager where foodType='"+foodType+"'");  
			//获得数据
			ResultSetMetaData resultSetMetaDate=rs.getMetaData();
			//获得列数
			int colimnCount=resultSetMetaDate.getColumnCount();
			//第五步，对查询的结果进行处理  
			while(rs.next()){ 
				FoodDataBean bean = new FoodDataBean();
				for (int i = 1; i <= colimnCount; i++) {
					if ("foodname".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setFoodName(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("foodenergy".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setFoodEnergy(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("foodcount".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setFoodCount(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("foodtype".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setFoodType(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("foodeattime".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setFoodEatTime(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("foodstatus".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setFoodStatus(rs.getString(i));
						System.out.println(rs.getString(i));
					}
				}
				beans.add(bean);
			//对记录的操作  
			}  
			//第六步，关闭连接  
			rs.close();  
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return beans;
	}

	//获取健康数据
	public HealthDataBean queryHealthData(String userName) {
		HealthDataBean healthDataBean = null;
		// TODO Auto-generated method stub
		try {
			Statement stmt=conn.createStatement();  
			//第四步，执行SQL语句，增加，删除，修改记录  
//			stmt.executeUpdate("增加，删除，修改记录的SQL语句");  
			//或者查询记录  
			ResultSet rs = stmt.executeQuery("select * from healthmanager where username='"+userName+"'");  
			System.out.println("xiaopeng"+rs.getMetaData());
			//获得数据
			ResultSetMetaData resultSetMetaDate=rs.getMetaData();
			//获得列数
			int colimnCount=resultSetMetaDate.getColumnCount();
			//第五步，对查询的结果进行处理  
			while(rs.next()){ 
				healthDataBean = new HealthDataBean();
				for (int i = 1; i <= colimnCount; i++) {
					if ("username".equals(resultSetMetaDate.getColumnName(i))) {
						healthDataBean.setUserName(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("userhealthnumber".equals(resultSetMetaDate.getColumnName(i))) {
						healthDataBean.setUserHealthNumber(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("userssy".equals(resultSetMetaDate.getColumnName(i))) {
						healthDataBean.setUserSsy(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("userszy".equals(resultSetMetaDate.getColumnName(i))) {
						healthDataBean.setUserSzy(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("userxl".equals(resultSetMetaDate.getColumnName(i))) {
						healthDataBean.setUserXl(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("userdate".equals(resultSetMetaDate.getColumnName(i))) {
						healthDataBean.setUserDate(rs.getString(i));
						System.out.println(rs.getString(i));
					}
				}
			//对记录的操作  
			}  
			//第六步，关闭连接  
			rs.close();  
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return healthDataBean;
	}

	//更新健康数据
	public boolean updateHealthData(String username, String userhealthnumber,
			String userssy, String userszy, String userxl) {
		
		try {
			Statement stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from healthmanager where username='"+username+"'"); 
			while (rs.next()) {
				stmt.executeUpdate("update healthmanager set userhealthnumber='"+userhealthnumber+"',userssy='"+userssy+"',userszy='"+userszy+"',userxl='"+userxl+"' where username='"+username+"'"); 
				
				rs.close();  
				stmt.close();
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	//查询医师数据
	public List<DoctorDataBean> queryDoctorData(String name) {
		List<DoctorDataBean> beans=new ArrayList<DoctorDataBean>();
		try {
			Statement stmt=conn.createStatement();  
			//或者查询记录  
			ResultSet rs;
			if (name=="") {
				rs = stmt.executeQuery("select * from doctorconsult ");  
			}else {
				rs = stmt.executeQuery("select * from doctorconsult where name='"+name+"'");  
			}
			//获得数据
			ResultSetMetaData resultSetMetaDate=rs.getMetaData();
			//获得列数
			int colimnCount=resultSetMetaDate.getColumnCount();
			//第五步，对查询的结果进行处理  
			while(rs.next()){ 
				DoctorDataBean bean = new DoctorDataBean();
				for (int i = 1; i <= colimnCount; i++) {
					if ("name".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setName(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("age".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setAge(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("sex".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setSex(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("work".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setWork(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("phone".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setPhone(rs.getString(i));
						System.out.println(rs.getString(i));
					}
					if ("status".equals(resultSetMetaDate.getColumnName(i))) {
						bean.setStatus(rs.getString(i));
						System.out.println(rs.getString(i));
					}
				}
				beans.add(bean);
			//对记录的操作  
			}  
			//第六步，关闭连接  
			rs.close();  
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return beans;
	}

	//更新用户信息
	public boolean updateUserInfo(String name, String sex, String height,
			String weight,String status) {
		
		try {
			Statement stmt=conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from user_info_safemanager where user_name='"+name+"'"); 
			while (rs.next()) {
				stmt.executeUpdate("update user_info_safemanager set user_sex='"+sex+"',user_height='"+height+"',user_weight='"+weight+"',user_status='"+status+"' where user_name='"+name+"'"); 
				
				rs.close();  
				stmt.close();
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
