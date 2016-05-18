package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tools.DBUtil;
import domain.Subscribe;
import domain.Subscribe;

public class SubscribeDao {

	public List<Subscribe> queryByUserId(String userId,String different){  
		String sql="select * from Subscribe  where user_id='"+userId+"' and different='"+different+"'";
		
		List<Subscribe> list=this.getList(sql);
		return list;
	}
	// 获得用户List
	private List<Subscribe> getList(String sql) { 
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<Subscribe> list = new ArrayList<Subscribe>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Subscribe Subscribe=new Subscribe();
				Subscribe.setId(rs.getString("id"));
				Subscribe.setUser_id(rs.getString("user_id"));
				Subscribe.setDoctor_id(rs.getString("doctor_id"));
				Subscribe.setDifferent(rs.getString("different"));
				Subscribe.setDatetime(rs.getString("datetime"));
				list.add(Subscribe);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return null;
	}
	
	public void insert(Subscribe Subscribe){  
		Connection conn = DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			String sql="insert into Subscribe(id,user_id,doctor_id,different,datetime) values ('"+Subscribe.getId()+"','"+Subscribe.getUser_id()+"','"+Subscribe.getDoctor_id()+"','"+Subscribe.getDifferent()+"','"+Subscribe.getDatetime()+"')";
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
}
