package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.UserDAO;

public class join_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String u_id = request.getParameter("u_id");
		String u_pwd = request.getParameter("u_pwd");
		String u_name = request.getParameter("u_name");
		String cellPhone = request.getParameter("cellPhone");
		String email = request.getParameter("email");
		String birth_date = request.getParameter("birth_date");
		
		UserDAO.join(u_id, u_pwd, u_name, cellPhone, email, birth_date);
		
		return null;
	}

}
