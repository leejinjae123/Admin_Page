package pro.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.ListDAO;

public class edit_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String C_type  = request.getContentType();
		if(C_type != null && C_type.startsWith("multipart")) {
			MultipartRequest mr;
		try {
			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/admin/file_upload");
			
			mr = new MultipartRequest(request, realPath, 1024*1024*5,
					"utf-8",new DefaultFileRenamePolicy());
			
			String b_name = mr.getParameter("b_name");
			String b_writer = mr.getParameter("b_writer");
			String pwd = mr.getParameter("pwd");
			String price = mr.getParameter("price");
			String content = mr.getParameter("content");
			
			File f = mr.getFile("flie");
			String fname = "";
			String oname = "";
			if(f != null) {
				fname = f.getName();
				oname = mr.getOriginalFileName("file");
			}
			
			Map<String, String> map = new HashMap<String, String>();
			System.out.println(fname);
			System.out.println(oname);
			map.put("b_name", b_name);
			map.put("b_writer", b_writer);
			map.put("pwd", pwd);
			map.put("price", price);
			map.put("content", content);
			map.put("file_name", fname);
			map.put("ori_name", oname);
			
			boolean val = ListDAO.add(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
		
		return "Controller?type=list";
	}
}
