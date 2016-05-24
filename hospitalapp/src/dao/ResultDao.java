package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tools.DBUtil;
import tools.SearchResult;
import domain.Result;
import domain.Subscribe;

public class ResultDao {


	
	public List<Result> queryByUserId(String userId){  
		String sql="select result.*,doctor.name from result,doctor  where user_id='"+userId+"' and result.doctor_id=doctor.id  order by id desc";
		
		List<Result> list=this.getList(sql);
		return list;
	}
	// 获得用户List
	private List<Result> getList(String sql) { 
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<Result> list = new ArrayList<Result>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Result result=new Result();
				result.setId(rs.getInt("id"));
				result.setName(rs.getString("name"));
				result.setUser_id(rs.getString("user_id"));
				result.setDoctor_id(rs.getString("doctor_id"));
				result.setResult(rs.getString("result"));
				result.setDatetime(rs.getString("datetime"));
				list.add(result);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return null;
	}
	public void insert(Result Result){  
		Connection conn = DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			String sql="insert into result(user_id,doctor_id,result,datetime) values ('"+Result.getUser_id()+"','"+Result.getDoctor_id()+"','"+Result.getResult()+"','"+Result.getDatetime()+"')";
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
