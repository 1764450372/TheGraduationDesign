package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public static int getTotalCount(String sql){
		Connection conn=DBUtil.getConnection();
		Statement st=null;
		ResultSet rs=null;
		try {
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn, st, rs);
		}
		return 0;
	}
	public static Connection getConnection(){
		Connection conn=null;
		try{
			//本地数据库
//			Class.forName("com.mysql.jdbc.Driver");
//			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalApp","root","123456");
			//服务器数据库
			Class.forName("com.mysql.jdbc.Driver");
	        String URL="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_hospitalapp";
	        conn=DriverManager.getConnection(URL,"00n24zlo12","0z12liw11xl5mh5hyjxlm545hyxiiwi3hwl50wy3");

			return conn;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public static void close(Connection conn,Statement st,ResultSet rs){
		try {
			if(rs!=null)
				rs.close();
			if(st!=null)
				st.close();
			if(conn!=null)
				 conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
