package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.ListDAO;
import mybatis.vo.BookVO;
import pro.paging.Paging;

public class search_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Paging page = new Paging();
		
		String search = request.getParameter("search");
		
		int total_count = ListDAO.getSearchCount(search);
		page.setTotalCount(total_count);
		
		String cPage = request.getParameter("cPage");
		
		if(cPage != null) {
			int p = Integer.parseInt(cPage);
			page.setNowPage(p);
		}else {
			page.setNowPage(page.getNowPage());
		}
		
		
		BookVO[] bvo = ListDAO.Search(page.getBegin(), page.getEnd(), search);
		
		request.setAttribute("bvo", bvo);
		request.setAttribute("page", page);
		
		
		return "admin/jsp/search.jsp";

}
}
