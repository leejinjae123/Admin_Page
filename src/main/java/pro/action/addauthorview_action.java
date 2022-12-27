package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.ListDAO;
import mybatis.vo.BookVO;

public class addauthorview_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		BookVO vo =  ListDAO.view(b_idx);
		
		HttpSession session = request.getSession();

		session.setAttribute("vo", vo);
		
		return "admin/jsp/addauthor.jsp?b_idx="+b_idx+"&cPage="+cPage;
	}

}
