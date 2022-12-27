package pro.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.ListDAO;

public class addaut_submit_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cPage = request.getParameter("cPage");
		String main = request.getParameter("main");
		String writer=request.getParameter("writer");
		String content=request.getParameter("content");
		String b_idx=request.getParameter("b_idx");
		String ip=request.getParameter("ip");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("writer", writer);
		map.put("content", content);
		map.put("b_idx", b_idx);
		map.put("ip", ip);
		map.put("main", main);
		
		ListDAO.addaut(map);
		
		return "Controller?type=view&b_idx="+b_idx+"&cPage="+cPage;
		
	}

}
