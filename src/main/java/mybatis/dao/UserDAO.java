package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.UserVO;

public class UserDAO {
	
	public static UserVO login(String u_id, String u_pwd) {
		UserVO vo = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pwd", u_pwd);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		UserVO uvo = ss.selectOne("book.login", map);
		
		
		ss.close();
		return uvo;
		
	}
	public static int fix(String u_id, String u_pwd, String cellPhone, String email) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pwd", u_pwd);
		map.put("cellPhone", cellPhone);
		map.put("email", email);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("book.fix", map);
		
		if(cnt>0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		return cnt;
		
	}
	public static boolean join(String u_id,String u_pwd,String u_name,String cellPhone,String email,String birth_date) {
		
		boolean value= false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pwd", u_pwd);
		map.put("u_name", u_name);
		map.put("cellPhone", cellPhone);
		map.put("email", email);
		map.put("birth_date", birth_date);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("book.signup", map);
		if(cnt > 0) {
			value = true;
			ss.commit();
		}else {
			ss.rollback();
}
		ss.close();
		
		return value;
	}
	public static int idchk(String u_id) {	
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.selectOne("book.chkid", u_id);
		
		return cnt;
	}
}
