package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tools.DBUtil;
import tools.SearchResult;
import domain.Department;

public class DepartmentDao {

	public SearchResult<Department> queryAll(int page,int NumPerPage) {//查询所有用户
		int totalcount=DBUtil.getTotalCount("select count(id) from Department ");
		SearchResult<Department> sr=new SearchResult<Department>();
		sr.setTotalcount(totalcount);
		sr.setNumPerPage(NumPerPage);
		page=page>sr.getTotalPage()?sr.getTotalPage():page;
		sr.setNowpage(page);
		String sql="select * from Department  limit "+(page-1)*NumPerPage+","+NumPerPage+" ";
		
		List<Department> list=this.getList(sql);
		sr.setList(list);
		return sr;
	}
	// 获得用户List
	private List<Department> getList(String sql) { 
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<Department> list = new ArrayList<Department>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Department Department = new Department();
				Department.setId(rs.getString("id"));
				Department.setName(rs.getString("name"));

				list.add(Department);
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
