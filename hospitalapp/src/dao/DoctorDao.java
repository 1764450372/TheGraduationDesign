package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tools.DBUtil;
import tools.SearchResult;
import domain.Doctor;
import domain.User;

public class DoctorDao {

	
	public SearchResult<Doctor> queryAll(String departmentNum ,int page,int NumPerPage) {//查询所有用户
		int totalcount=DBUtil.getTotalCount("select count(id) from Doctor where departmentNum ='"+departmentNum+"'");
		SearchResult<Doctor> sr=new SearchResult<Doctor>();
		sr.setTotalcount(totalcount);
		sr.setNumPerPage(NumPerPage);
		page=page>sr.getTotalPage()?sr.getTotalPage():page;
		sr.setNowpage(page);
		String sql="select * from Doctor   where departmentNum ='"+departmentNum+"' limit "+(page-1)*NumPerPage+","+NumPerPage+" ";
		
		List<Doctor> list=this.getList(sql);
		sr.setList(list);
		return sr;
	}
	// 获得用户List
	private List<Doctor> getList(String sql) { 
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		List<Doctor> list = new ArrayList<Doctor>();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Doctor Doctor = new Doctor();
				Doctor.setId(rs.getString("id"));
				Doctor.setName(rs.getString("name"));
				Doctor.setPwd(rs.getString("pwd"));
				Doctor.setSex(rs.getString("sex"));
				Doctor.setDifferent(rs.getString("different"));
				Doctor.setDepartmentNum(rs.getString("departmentNum"));
				Doctor.setPeopleNum(rs.getString("peopleNum"));
				Doctor.setOrderNum(rs.getString("orderNum"));
				list.add(Doctor);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, st, rs);
		}
		return null;
	}
	public void update(Doctor doctor){  //修改用户
		Connection conn = DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			StringBuffer sql=new StringBuffer("update doctor set peopleNum='");
			sql.append(doctor.getPeopleNum())
			.append("'where id='").append(doctor.getId()).append("'");
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
