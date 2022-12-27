package pro.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class saveImg_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				ServletContext application = request.getServletContext();
				
				String realPath = application.getRealPath("/admin/book_upload");
				MultipartRequest mr = new MultipartRequest(request, realPath, 
						1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		
				File f = mr.getFile("s_file");
				String o_name  = mr.getOriginalFileName("s_file");
				String f_name = null;
				if(f != null)
					f_name = f.getName();
				
				String url = request.getContextPath()+"/admin"+"/book_upload"+"/"+f_name;
					
				request.setAttribute("url", url);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		return "admin/include_page/saveImg.jsp";
	}
}
