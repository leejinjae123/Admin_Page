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

public class change_action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cPage=request.getParameter("cPage");
		String b_idx=request.getParameter("b_idx");
	
		
		String C_type  = request.getContentType();
			
		if(C_type!=null) {
			//MultipartReqeust생성하여 첨부파일 업로드
			try {
				//cos라이브러리에 있는 MultipartReqeust객체를 생성하기 위해
				//첨부된 파일이 저장될 위치를 절대경로화 시킨다.
				ServletContext application = request.getServletContext();
				
				String realPath= application.getRealPath("/admin/file_upload");
				
				MultipartRequest mr = new MultipartRequest(request, realPath,1024*1024*5,
						
								"utf-8",new DefaultFileRenamePolicy());
				
				String b_name = mr.getParameter("b_name");
				String content = mr.getParameter("content"); 
				String price = mr.getParameter("price");
				String b_idx2 = mr.getParameter("b_idx");
				String cPage2 = mr.getParameter("cPage2");
				//저장된 파일명을 얻기위해 업로드된 파일객체를 얻어내자!
				File f = mr.getFile("file");
				
				String fname = "";
				String oname = "";
				if(f != null){
					//파일첨부가 된 경우
					fname = f.getName();//현재 저장된 파일명
					oname = mr.getOriginalFileName("file");
					//만약 파일명이 변경되지 않았다면 fname과 oname은 같다.
				}
				
				
				Map<String, String> map =new HashMap<String, String>();
				
				map.put("b_name", b_name);
				map.put("content", content);
				map.put("price", price);
				map.put("file_name", fname);
				map.put("ori_name", oname);
				map.put("b_idx", b_idx2);
				
				//DB에 저장!!!
				boolean change = ListDAO.Change(map);
	
				if(change) {
					return "Controller?type=view&cPage="+cPage2+"&b_idx="+b_idx2;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "admin/jsp/art-table?cPage="+cPage;
	}

}
