package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tools.DBUtil;
import domain.Result;

public class ResultDao {

	public List<Result> queryByUserId(String userId){  
		String sql="select * from Result  where user_id='"+userId+"' order by id desc";
		
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
}
