package pro.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.ListDAO;
import mybatis.vo.BookVO;

public class view_action implements Action {
	List<BookVO> r_list;  //세션에 저장된 목록(한번이라도 읽은 게시물들이 저장됨)
	
	//현재 읽기한 게시물이 읽었던 게시물인지 아닌지를 판단하는 기능
	public boolean checkBbs(BookVO vo) {
		boolean val =  true;
		
		for(BookVO bvo :r_list) {
			if(vo.getB_idx().equals(bvo.getB_idx())) {
				val = false;
				break;
			}
		}
		
		return val;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("read_list");
		if(obj==null) {
			r_list= new ArrayList<BookVO>();
			session.setAttribute("read_list", r_list);
		}else
			r_list = (ArrayList<BookVO>)obj;
		
		BookVO vo =  ListDAO.view(b_idx);
		
		if(checkBbs(vo)) {
			boolean value =	ListDAO.Hit(b_idx);
			r_list.add(vo);
		}
		
		
		request.setAttribute("vo", vo);
		
		return"admin/jsp/view.jsp?b_idx="+b_idx+"&cPage="+cPage;
	}

}
