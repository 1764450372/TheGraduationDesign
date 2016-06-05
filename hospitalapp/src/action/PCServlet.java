package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import tools.SearchResult;
import dao.DoctorDao;
import dao.ResultDao;
import dao.SubscribeDao;
import domain.Doctor;
import domain.Result;
import domain.Subscribe;
import domain.Department;
import dao.DepartmentDao;

@SuppressWarnings("serial")
public class PCServlet extends HttpServlet {
	private Doctor ud;

	public PCServlet() {
		ud = new Doctor();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		;
		String action = request.getParameter("action");
		if (action.equals("login"))// 登陆
		{
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");

			DoctorDao doctorDao = new DoctorDao();
			boolean loginSuccess = doctorDao.login(id, pwd);

			if (loginSuccess == true) {
				
				SubscribeDao SubscribeDao = new SubscribeDao();
			    DepartmentDao departmentDao = new DepartmentDao();
				
				String strpage = request.getParameter("page");
				int page = 0;
				try {
					page = Integer.parseInt(strpage);
				} catch (NumberFormatException e) {
					page = 1;
				}
				Date nowTime = new Date(System.currentTimeMillis());
				  SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd");
				  String retStrFormatNowDate = sdFormatter.format(nowTime);
				
				if(id.equals("super")){
					DepartmentDao DepartmentDao = new DepartmentDao();
 					SearchResult<Department> sr = DepartmentDao.queryAll(
							page, 1000);
 					request.setAttribute("sr", sr);
					request.getRequestDispatcher("../Super.jsp").forward(request,
							response);
				}else{
					SearchResult<Subscribe> sr = null;
					sr = SubscribeDao.queryAll(page, id, retStrFormatNowDate);
					
					request.setAttribute("sr", sr);
					request.getRequestDispatcher("../main.jsp").forward(request,
							response);
				}
			} else {
				request.setAttribute("error", "用户名或密码错误");
				request.setAttribute("id", id);
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);// mainframe.jsp
			}

		}else if(action.equals("modify"))
		{
			String id = request.getParameter("id");
			
			Subscribe Subscribe =  new Subscribe();
			
			SubscribeDao SubscribeDao = new SubscribeDao();
			Subscribe = SubscribeDao.queryById(id);
			request.setAttribute("sr", Subscribe);
			request.getRequestDispatcher("/modify.jsp").forward(request,
					response);// mainframe.jsp
		}
		else if(action.equals("modifyResult"))
		{
			response.setContentType("application/x-javascript;charset=UTF-8");
			
			String id = request.getParameter("id");
			String result = request.getParameter("result");
			Subscribe Subscribe =  new Subscribe();
			SubscribeDao SubscribeDao = new SubscribeDao();
			Subscribe = SubscribeDao.queryById(id);
			
			SubscribeDao.update(id);
			
			Result Result =  new Result();
			ResultDao ResultDao = new ResultDao();
			Result.setUser_id(Subscribe.getUser_id());
			Result.setDoctor_id(Subscribe.getDoctor_id());
			Result.setResult(result);
			Result.setDatetime(Subscribe.getDatetime());
			ResultDao.insert(Result);
			PrintWriter pw = response.getWriter();
			pw.println("{\"message\":\"结果已保存\"}");
			pw.close();
			
		}
		else if(action.equals("delectDpartment"))
		{
			response.setContentType("application/x-javascript;charset=UTF-8");
			
			String id = request.getParameter("id");
 			DepartmentDao departmentDao = new DepartmentDao();
 		     departmentDao.delectById(id);
 			PrintWriter pw = response.getWriter();
 				pw.println("{\"message\":\"删除成功\"}");
			pw.close();
		}
	}

}
