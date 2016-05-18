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

		if (action.equals("login"))// ��½
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
				obj.put("information", "yes��½�ɹ�,no��½ʧ��");

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("userInformation"))// �û�������Ϣ
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
		} else if (action.equals("registVerify"))// ע���û�����Ƿ��ֻ����Ѿ�ע��
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
				obj.put("information", "yes���û��Ѿ���ע��,no���û�û��ע��");

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("regist"))// ע���û�
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
				obj.put("information", "yesע��ɹ�,noע��ʧ��");

			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());
		} else if (action.equals("updateUser"))// �޸��û�����
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

				obj.put("information", "����û����ӿ�");
			} catch (Exception e) {
			}
			array.add(obj);
			out.write(array.toString());

		}
		out.flush();
		out.close();

	}
}
