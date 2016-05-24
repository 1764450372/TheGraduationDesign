package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Object;

import tools.SearchResult;

import dao.DepartmentDao;
import dao.UserDao;
import dao.ResultDao;
import dao.DoctorDao;
import dao.SubscribeDao;

import domain.Department;
import domain.User;

import domain.Doctor;
import domain.Result;
import domain.Subscribe;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class OtherServlet extends HttpServlet {

	public List<Department> DepartmentList;
	public List<Doctor> DoctortList;
	public List<Result> ResultList;
	public List<Subscribe> SubscribeList;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		PrapareData(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		;

		request.getRequestDispatcher("index.jsp").forward(request, response);
		super.doGet(request, response);

	}

	private void PrapareData(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if (action.equals("departmentSearch")) {
			// http://localhost:8080/text2015/share/ShareServlet?action=gerShare&page=1&count=5
			DepartmentDao DepartmentDao = new DepartmentDao();
			String page = request.getParameter("page");
			String count = request.getParameter("count");
			SearchResult<Department> sr = DepartmentDao.queryAll(
					Integer.parseInt(page), Integer.parseInt(count));
			DepartmentList = sr.getList();

			JSONArray array = new JSONArray();
			// 有问题

			for (Department bean : DepartmentList) {
				JSONObject obj = new JSONObject();
				try {
					obj.put("id", bean.getId());
					obj.put("name", bean.getName());

				} catch (Exception e) {

				}
				array.add(obj);
			}
			// 有问题
			out.write(array.toString());

		} else if (action.equals("doctorSearch")) {
			DoctorDao DoctorDao = new DoctorDao();

			String departmentNum = request.getParameter("departmentNum");
			String page = request.getParameter("page");
			String count = request.getParameter("count");
			SearchResult<Doctor> sr = DoctorDao.queryAll(departmentNum,
					Integer.parseInt(page), Integer.parseInt(count));
			DoctortList = sr.getList();
			// System.out.println(DepartmentList.size());

			JSONArray array = new JSONArray();
			for (Doctor bean : DoctortList) {
				JSONObject obj = new JSONObject();
				try {

					obj.put("id", bean.getId());
					obj.put("name", bean.getName());

					obj.put("pwd", bean.getPwd());
					obj.put("sex", bean.getSex());
					obj.put("different", bean.getDifferent());
					obj.put("departmentNum", bean.getDepartmentNum());
					obj.put("peopleNum", bean.getPeopleNum());
					obj.put("orderNum", bean.getOrderNum());
					// Share share = new Share();

				} catch (Exception e) {

				}
				array.add(obj);

			}
			out.write(array.toString());
		} else if (action.equals("doctorAllSearch")) {
			DoctorDao DoctorDao = new DoctorDao();

			List<Doctor> sr = DoctorDao.queryAllDoctor();
	
			// System.out.println(DepartmentList.size());

			JSONArray array = new JSONArray();
			for (Doctor bean : sr) {
				JSONObject obj = new JSONObject();
				try {

					obj.put("id", bean.getId());
					obj.put("name", bean.getName());

					obj.put("pwd", bean.getPwd());
					obj.put("sex", bean.getSex());
					obj.put("different", bean.getDifferent());
					obj.put("departmentNum", bean.getDepartmentNum());
					obj.put("peopleNum", bean.getPeopleNum());
					obj.put("orderNum", bean.getOrderNum());
					// Share share = new Share();

				} catch (Exception e) {

				}
				array.add(obj);

			}
			out.write(array.toString());
		}else if (action.equals("doctorSearchById")) {
			DoctorDao DoctorDao = new DoctorDao();

			String id = request.getParameter("id");
			String page = request.getParameter("page");
			String count = request.getParameter("count");
			SearchResult<Doctor> sr = DoctorDao.queryById(id, Integer.parseInt(page), Integer.parseInt(count));
			DoctortList = sr.getList();
			// System.out.println(DepartmentList.size());

			JSONArray array = new JSONArray();
			for (Doctor bean : DoctortList) {
				JSONObject obj = new JSONObject();
				try {

					obj.put("id", bean.getId());
					obj.put("name", bean.getName());

					obj.put("pwd", bean.getPwd());
					obj.put("sex", bean.getSex());
					obj.put("different", bean.getDifferent());
					obj.put("departmentNum", bean.getDepartmentNum());
					obj.put("peopleNum", bean.getPeopleNum());
					obj.put("orderNum", bean.getOrderNum());
					// Share share = new Share();

				} catch (Exception e) {

				}
				array.add(obj);

			}
			out.write(array.toString());
		}  
		else if (action.equals("updateDoctor")) {
			String id = request.getParameter("id");
			String peopleNum = request.getParameter("peopleNum");
			DoctorDao DoctorDao = new DoctorDao();
			Doctor doctor = new Doctor();
			doctor.setId(id);
			doctor.setPeopleNum(peopleNum);
			DoctorDao.update(doctor);
		} else if (action.equals("reslutSearch")) {

			ResultDao ResultDao = new ResultDao();
			String userId = request.getParameter("user_id");
			ResultList = ResultDao.queryByUserId(userId);
			JSONArray array = new JSONArray();
			for (Result bean : ResultList) {
				JSONObject obj = new JSONObject();
				try {

					obj.put("id", bean.getId());
					obj.put("user_id", bean.getUser_id());
					obj.put("name", bean.getName());
					obj.put("doctor_id", bean.getDoctor_id());
					obj.put("result", bean.getResult());
					obj.put("datetime", bean.getDatetime());
					// Share share = new Share();
				} catch (Exception e) {

				}
				array.add(obj);

			}
			out.write(array.toString());

		} else if (action.equals("subscribeSearch")) {

			SubscribeDao SubscribeDao = new SubscribeDao();
			String userId = request.getParameter("user_id");
			String different = request.getParameter("different");

			SubscribeList = SubscribeDao.queryByUserId(userId, different);
			JSONArray array = new JSONArray();
			for (Subscribe bean : SubscribeList) {
				JSONObject obj = new JSONObject();
				try {

					obj.put("id", bean.getId());
					obj.put("user_id", bean.getUser_id());
					obj.put("name", bean.getName());
					obj.put("doctor_id", bean.getDoctor_id());
					obj.put("different", bean.getDifferent());
					obj.put("datetime", bean.getDatetime());
					// Share share = new Share();
				} catch (Exception e) {

				}
				array.add(obj);

			}
			out.write(array.toString());

		} else if (action.equals("subscribeCount")) {
			
			String doctor_id = request.getParameter("doctor_id");
			String datetime = request.getParameter("datetime");
			SubscribeDao SubscribeDao = new SubscribeDao();
			int count = SubscribeDao.queryByIdAndDatetime(doctor_id, datetime);
			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("count", count);
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("subscribeCountForId")) {
			
			SubscribeDao SubscribeDao = new SubscribeDao();
			int count = SubscribeDao.queryByIdCount();
			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("count", count);
			array.add(obj);
			out.write(array.toString());

		}
		else if (action.equals("subscribeInsert")) {

			SubscribeDao SubscribeDao = new SubscribeDao();
			String id = request.getParameter("id");
			String user_id = request.getParameter("user_id");
			String doctor_id = request.getParameter("doctor_id");
			String different = request.getParameter("different");
			String datetime = request.getParameter("datetime");

			Subscribe Subscribe = new Subscribe();
			Subscribe.setId(id);
			Subscribe.setUser_id(user_id);
			Subscribe.setDoctor_id(doctor_id);
			Subscribe.setDifferent(different);
			Subscribe.setDatetime(datetime);
			SubscribeDao.insert(Subscribe);

		} else {
			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			try {

				obj.put("information", "逗比没这个接口");
			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		}
		out.flush();
		out.close();

	}
}