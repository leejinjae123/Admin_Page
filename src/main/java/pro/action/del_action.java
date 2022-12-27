package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.ListDAO;

public class del_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String b_idx = request.getParameter("b_idx");
		ListDAO.Del(b_idx);
		
		return "Controller?type=list";
	}

}
