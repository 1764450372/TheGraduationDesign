package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import domain.User;
import tools.DBUtil;
import tools.SearchResult;

public class UserDao {

	//登陸
	public boolean login(String tel,String pwd){
		Connection conn=DBUtil.getConnection();
		String sql="select * from user where tel='"+tel+"' and pwd='"+pwd+"'";
		Statement st=null;
		ResultSet rs=null;
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn, st, rs);
		}
		return false;
	}
	//根据ID查询 更具ID查询 并返回对象
	public User queryById(String tel,String pwd){  
		String sql="select * from user where tel='"+tel+"' and pwd='"+pwd+"'";
		List<User> list=this.getList(sql);
		return list.size()==1?list.get(0):null;
	}
	//根据name查询 并返回对象
	public User queryByName(String name){  
		String sql="select * from user where name='"+name+"'";
		List<User> list=this.getList(sql);
		return list.size()==1?list.get(0):null;
	}
	
	// 获得用户List
	private List<User> getList(String sql) { 
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<User> list = new ArrayList<User>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				User user = new User();
				user.setTel(rs.getString("tel"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setGender(rs.getString("gender"));

				user.setEmail(rs.getString("email"));
				user.setSex(rs.getString("sex"));

				list.add(user);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return null;
	}
	//注册判断是否该用户已被注册
	public boolean registVerify(String tel){  
		Connection conn=DBUtil.getConnection();
		String sql="select *  from user where tel='"+tel+"'";
		Statement st=null;
		ResultSet rs=null;
		try {
			st=conn.createStatement();
	 		rs=st.executeQuery(sql);
			if(rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn, st, rs);
		}
		return false;
	}
	
	public void insert(User user){  //注册新用户
		Connection conn = DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			String sql="insert into user(name,pwd,email,gender,sex,tel) values ('"+user.getName()+"','"+user.getPwd()+"','"+user.getEmail()+"','"+user.getGender()+"','"+user.getSex()+"','"+user.getTel()+"')";
			st.execute(sql);	
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				st.close();
				DBUtil.close(conn, st, rs);	
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	public void update(User user){  //修改用户
		Connection conn = DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			StringBuffer sql=new StringBuffer("update user set name='");
			sql.append(user.getName())
			.append("', pwd='").append(user.getPwd())
			.append("', email='").append(user.getEmail())
			.append("', gender='").append(user.getGender())
			.append("', sex='").append(user.getSex())
			.append("'where tel='").append(user.getTel()).append("'");
			st.executeUpdate(sql.toString());				
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				st.close();
				DBUtil.close(conn, st, rs);	
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
