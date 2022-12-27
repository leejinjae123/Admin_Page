package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.UserDAO;

public class idchk_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("u_id");
		
		int cnt = UserDAO.idchk(id);
		request.setAttribute("cnt", cnt);
		
		return "admin/include_page/ajax_idchk.jsp";
		
	}

}
