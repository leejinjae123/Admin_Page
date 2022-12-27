package pro.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class set_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/jsp/account.jsp";
	}

}
