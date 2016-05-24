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
import domain.Subscribe;
import domain.User;

public class SubscribeDao {

	public Subscribe queryById(String id){  
		String sql="select subscribe.*,doctor.name from subscribe,doctor where  subscribe.id='"+id+"'  and subscribe.doctor_id=doctor.id ";
		List<Subscribe> list=this.getList(sql);
		return list.size()==1?list.get(0):null;
	}
	
	
	public SearchResult<Subscribe> queryAll(int page ,String doctor_id ,String datetime) {//查询所有用户
		int totalcount=DBUtil.getTotalCount("select count(subscribe.id) from subscribe,doctor where doctor_id='"+doctor_id+"' and  datetime like '"+datetime+"%' and subscribe.doctor_id=doctor.id order by doctor.id desc");
		SearchResult<Subscribe> sr=new SearchResult<Subscribe>();
		sr.setTotalcount(totalcount);
		sr.setNumPerPage(10);
		page=page>sr.getTotalPage()?sr.getTotalPage():page;
		sr.setNowpage(page);
		String sql="select subscribe.*,doctor.name from subscribe,doctor where doctor_id='"+doctor_id+"' and  datetime like '"+datetime+"%' and subscribe.doctor_id=doctor.id limit "+(page-1)*10+",10";
		List<Subscribe> list=this.getList(sql);
		sr.setList(list);
		return sr;
	}
	
	
	public List<Subscribe> queryByUserId(String userId,String different){  
		String sql="select subscribe.*,doctor.name from subscribe,doctor  where user_id='"+userId+"' and subscribe.different='"+different+"'  and subscribe.doctor_id=doctor.id";

		
		List<Subscribe> list=this.getList(sql);
		return list;
	}
	
	public int queryByIdAndDatetime(String doctor_id,String datetime){  
		String sql="select subscribe.*,doctor.name from subscribe,doctor  where doctor_id='"+doctor_id+"' and datetime='"+datetime+"' and subscribe.doctor_id=doctor.id";
		
		List<Subscribe> list=this.getList(sql);
		return list.size();
	}
	
	public int queryByIdCount(){  
	
	
		int totalcount=DBUtil.getTotalCount("select count(id) from subscribe ");
		
		return totalcount;
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
				Subscribe.setName(rs.getString("name"));
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
			String sql="insert into subscribe(id,user_id,doctor_id,different,datetime) values ('"+Subscribe.getId()+"','"+Subscribe.getUser_id()+"','"+Subscribe.getDoctor_id()+"','"+Subscribe.getDifferent()+"','"+Subscribe.getDatetime()+"')";
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
	
	public void update(String id){  //修改用户
		Connection conn = DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try{
			st=conn.createStatement();
			StringBuffer sql=new StringBuffer("update subscribe set different='");
			sql.append("1")
			.append("'where id='").append(id).append("'");
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
