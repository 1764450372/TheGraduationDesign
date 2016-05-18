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

import dao.UserDao;
import domain.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class UserServlet extends HttpServlet {

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

		if (action.equals("login"))// 登陆
		{
			String tel = request.getParameter("tel");
			String pwd = request.getParameter("pwd");

			UserDao userDao = new UserDao();
			boolean loginSuccess = userDao.login(tel, pwd);

			System.out.println(loginSuccess);
			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			try {
				if (loginSuccess == true) {
					obj.put("loginSuccess", "yes");
				} else {
					obj.put("isExist", "no");
				}
				obj.put("information", "yes登陆成功,no登陆失败");

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("userInformation"))// 用户个人信息
		{
			String tel = request.getParameter("tel");
			String pwd = request.getParameter("pwd");

			UserDao userDao = new UserDao();
			User user1 = new User();
			user1 = userDao.queryById(tel, pwd);
			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			try {

				obj.put("tel", user1.getTel());
				obj.put("name", user1.getName());
				obj.put("pwd", user1.getPwd());
				obj.put("email", user1.getEmail());
				obj.put("gender", user1.getGender());
				obj.put("sex", user1.getSex());

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("registVerify"))// 注册用户检测是否手机号已经注册
		{
			String tel = request.getParameter("tel");
			UserDao userDao = new UserDao();
			boolean isExist = userDao.registVerify(tel);

			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			try {
				if (isExist == true) {
					obj.put("isExist", "yes");
				} else {
					obj.put("isExist", "no");
				}
				obj.put("information", "yes该用户已经被注册,no该用户没有注册");

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("regist"))// 注册用户
		{
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");

			UserDao userDao = new UserDao();
			boolean isExist = userDao.registVerify(tel);

			if (isExist == false) {
				User user = new User();
				user.setName(name);
				user.setPwd(pwd);
				user.setGender(gender);
				user.setEmail(email);
				user.setSex(sex);
				user.setTel(tel);
				userDao.insert(user);
			}
			JSONArray array = new JSONArray();
			JSONObject obj = new JSONObject();
			try {
				if (isExist == true) {
					obj.put("Successed", "no");
				} else {
					obj.put("Successed", "yes");
				}
				obj.put("information", "yes注册成功,no注册失败");

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("updateUser"))// 修改用户资料
		{
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			UserDao userDao = new UserDao();
			User user = new User();
			user.setName(name);
			user.setPwd(pwd);
			user.setGender(gender);
			user.setEmail(email);
			user.setSex(sex);
			user.setTel(tel);
			userDao.update(user);
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
