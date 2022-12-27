package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.AuthorVO;
import mybatis.vo.BookVO;

public class ListDAO {

		public static BookVO[] getList(int begin, int end) {
			BookVO[] bvo = null;
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("begin", begin);
			map.put("end", end);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			List<BookVO> list = ss.selectList("list.booklist", map);
			if(list != null && !list.isEmpty()) {
				bvo = new BookVO[list.size()];
				list.toArray(bvo);
			}
			ss.close();
			
			return bvo;
		}
		public static int getSearchCount(String search) {
			
			SqlSession ss = FactoryService.getFactory().openSession();
			
			int cnt = ss.selectOne("list.search_count", search);
			if(cnt>0) {
				ss.commit();
			}else
				ss.rollback();
			
			ss.close();
			return cnt;
		}
		public static int getTotalCount() {
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.selectOne("list.total_count");
			ss.close();
			
			return cnt;
		}
		
		public static boolean updateHit(String b_idx) {
			boolean value= false;
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.update("list.hit", b_idx);
			
			if(cnt > 0)
				ss.commit();
			else
				ss.rollback();
			ss.close();
			return value;
		}
		public static boolean add(Map<String, String> map) {
			boolean val = false;
			
			SqlSession ss= FactoryService.getFactory().openSession();
			
			int cnt = ss.insert("book.edit", map);
			
			if(cnt>0) {
				ss.commit();
				val= true;
			}else
				ss.rollback();
			
			ss.close();

			return val;
		}
		public static boolean Del(String b_idx) {
			
			boolean val = false;

			SqlSession ss =FactoryService.getFactory().openSession();
			
			int cnt = ss.insert("list.del",b_idx);
			
			if (cnt>0) {
				ss.commit();
				val= true;
			}
			
			ss.close();

			return val;

		}
		public static BookVO[] Search(int begin, int end, String search) {
			
			BookVO[] bvo = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("search", search);
			
			SqlSession ss =FactoryService.getFactory().openSession();
			
			List<BookVO> list = ss.selectList("list.search", map);
			if(list != null && !list.isEmpty()) {
				bvo = new BookVO[list.size()];
				list.toArray(bvo);
			}
			ss.close();
			
			return bvo;
		}
		public static boolean Hit(String b_idx) {
			
			boolean val=false;
			
			SqlSession ss =FactoryService.getFactory().openSession();
			
			int cnt = ss.update("list.hit", b_idx);
			
			if(cnt>0) {
				ss.commit();
				val=true;
			}else
				ss.rollback();
			return val;
			
		}
		public static BookVO view(String b_idx) {
			BookVO vo = null;
			
			SqlSession ss =FactoryService.getFactory().openSession();
			
			vo = ss.selectOne("list.view", b_idx);
			
			ss.close();
			
			return vo;
		}
		public static boolean Change(Map<String, String> map) {
			boolean val = false;
			
			SqlSession ss =FactoryService.getFactory().openSession();
			
			int cnt = ss.update("book.change",map);
			if(cnt>0) {
				val = true;
				ss.commit();
			}
			else {
				ss.rollback();
			}
			
			ss.close();
			
			
			
			return val;
		}
		public static int addaut(Map<String, String> map) {
			
			
			SqlSession ss =FactoryService.getFactory().openSession();
			
			int cnt = ss.insert("author.edit", map);
			if(cnt>0) 
				ss.commit();
			else
				ss.rollback();
			ss.close();
			return cnt;
		}
}
