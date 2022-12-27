package pro.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pro.action.Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { "/Controller" }, 
		initParams = { 
			@WebInitParam(name = "myParam", value = "/WEB-INF/pro.properties")
		})
public class Controller extends HttpServlet {
	// action.properties에는 클래스의 경로를 가지고 있다.
		//이것을 가져와서 객체로 생성한 후 저장할 곳
		private Map<String, Action> actionMap;
		
	    public Controller() {
	        super();
	        actionMap = new HashMap<String, Action>();
	    }
		
		@Override
		public void init() throws ServletException {
			// 생성자 다음에 수행하는 함수
			// 첫 요청자에 의해 단 한번만 수행하는 곳
			
			String path = getInitParameter("myParam");// "/WEB-INF/emp.properties"
			
			//현재 서블릿이 생성될 때 멤버변수인 path를 가지고 절대경로화 시킨다.
			// 절대경로화 시키기 위해서 우린 jsp에서 application을 사용했다.
			// 여긴 jsp가 아니기 때문에 application 즉, ServletContext를 생성하면 된다.
			ServletContext application = getServletContext();
			
			String realPath = application.getRealPath(path);
			
			// 절대경로화 시킨 이유는
			// 해당 파일의 내용(클래스 경로)을 스트림을 이용하여 
			// 읽어와서 Properties객체에 담기 위함이다.
			Properties props = new Properties();
			
			// Properties객체의 load함수를 이용하여 내용들을 읽기한다. 이때
			// 필요한 것이 InputStream이 필요하다.
			FileInputStream fis = null;
			try {
				File f = new File(realPath);
				fis = new FileInputStream(f);
				
				props.load(fis); // action.properties파일의 내용들을 읽어서
							// 비어 있던 Properties객체에 키와 값을 쌍으로 저장한다.
							// 예) "greet" --> "ex2.GreetAction"
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			///////////////////////////////////////
			//// 생성할 객체들의 경로가 모두~
			////  Properties객체로 저장되었다. 하지만
			////  현재 컨트롤러 입자에서는 생성할 객체가 몇개이며,
			////  어떤 객체인지 알지 못한다. Properties에 저장된
			////  키들을 모두 가져와서 반복자로 수행해야 한다.
			///////////////////////////////////////
			
			Iterator<Object> it = props.keySet().iterator();
			// "greet", "hi"
			
			//키들을 모두 얻었으니 키에 연결된 값(클래스 경로)을 하나씩
			// 얻어내어 객체를 생성한 후 actionMap이라는 Map구조에 저장한다.
			while(it.hasNext()) {
				//먼저 키를 하나 가져와서 문자열로 변환!
				String key = (String)it.next();
				
				//위에서 얻어낸 키와 연결된 값(클래스 경로)을 얻자!
				String value = props.getProperty(key); // "ex2.GreetAction"
				
				try {
					Object obj = Class.forName(value).newInstance();
					//쉽게 말해서 Class를 통해 정확한 클래스의 경로가 있다면
					// 객체를 무조건 새롭게 생성하라는 것이다.
					
					//생성된 객체를 Action으로 형변환하여 actionMap에 저장!
					actionMap.put(key, (Action)obj);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}



		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 요청시 한글처리
			request.setCharacterEncoding("utf-8");
			
			// type이라는 파라미터 값 받기
			String type = request.getParameter("type");
			
			// type이 null이면 기본객체를 인식할 수 있도록 "greet"을 넣는다.
			if(type == null)
				type = "main";
			
			// type으로 받은 값이 actionMap의 key로 사용되고 있으므로
			// 원하는 객체를 얻어낸다.
			Action action = actionMap.get(type);// 만약! type의 값이 "hi"이면
							// Map에 저장된 HiAction객체의 주소가 action에 저장된다.
			
			String viewPath = action.execute(request, response);
			
			//만약! viewPath에 null이 들어올 경우는 현재 컨트롤러를 다시 호출한다.
			if(viewPath == null)
				response.sendRedirect("Controller");
			else {
				//viewPath에 뭔가가 들어왔다면 forward를 시킨다.
				RequestDispatcher disp = request.getRequestDispatcher(viewPath);
				disp.forward(request, response);
			}
				
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
