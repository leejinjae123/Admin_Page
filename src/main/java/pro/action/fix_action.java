package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.dao.UserDAO;
import mybatis.vo.UserVO;

public class fix_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String u_pwd = request.getParameter("u_pwd");
		String cellPhone = request.getParameter("cellPhone");
		String email = request.getParameter("email");
		String u_id = request.getParameter("u_id");
		
		int cnt = UserDAO.fix(u_id, u_pwd, cellPhone, email);
		
		HttpSession session = request.getSession();

		session.setAttribute("svo2", String.valueOf(cnt));
		
		return null;
	}

}
