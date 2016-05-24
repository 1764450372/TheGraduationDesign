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

	//���
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
	//����ID��ѯ ����ID��ѯ �����ض���
	public User queryById(String tel,String pwd){  
		String sql="select * from user where tel='"+tel+"' and pwd='"+pwd+"'";
		List<User> list=this.getList(sql);
		return list.size()==1?list.get(0):null;
	}
	//����name��ѯ �����ض���
	public User queryByName(String name){  
		String sql="select * from user where name='"+name+"'";
		List<User> list=this.getList(sql);
		return list.size()==1?list.get(0):null;
	}
	
	// ����û�List
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
	//ע���ж��Ƿ���û��ѱ�ע��
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
	
	public void insert(User user){  //ע�����û�
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
	public void update(User user){  //�޸��û�
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
