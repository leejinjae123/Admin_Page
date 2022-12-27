package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import mybatis.dao.UserDAO;
import mybatis.vo.UserVO;

public class login_submit_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String u_id = request.getParameter("u_id");
		String u_pwd = request.getParameter("u_pwd");
		
		UserVO uvo = UserDAO.login(u_id, u_pwd);
		
		HttpSession session = request.getSession();
		if(uvo != null) {
			session.setAttribute("svo", uvo);
			return "admin/jsp/index_login.jsp";
		}else {
			return "admin/include_page/error.jsp";
		}
	}

}
