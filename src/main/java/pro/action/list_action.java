package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.ListDAO;
import mybatis.vo.BookVO;
import pro.paging.Paging;

public class list_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Paging page = new Paging();
		
		int total_count = ListDAO.getTotalCount();
		page.setTotalCount(total_count);
		
		String cPage = request.getParameter("cPage");
		
		if(cPage != null) {
			int p = Integer.parseInt(cPage);
			page.setNowPage(p);
		}else {
			page.setNowPage(page.getNowPage());
		}
		
		
		
		BookVO[] bvo = ListDAO.getList(page.getBegin(), page.getEnd());
		
		request.setAttribute("bvo", bvo);
		request.setAttribute("page", page);
		
		return "admin/jsp/art-table.jsp";
	}

}
