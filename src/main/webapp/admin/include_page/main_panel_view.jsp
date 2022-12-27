<%@page import="mybatis.vo.AuthorVO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//파라미터 받기
	String cPage = request.getParameter("cPage"); // 다시 목록으로 돌아갈 때 필요함
	String b_idx = request.getParameter("b_idx"); // 해당 글의 기본키 - DB에서 검색할 조건
	
	Object obj = request.getAttribute("vo");
	
	
	
	if(obj != null){
	
	BookVO vo = (BookVO)obj;
	
	if(vo != null){
%>
<div class="main-panel">
          <div class="content-wrapper">
			<div class="card-body">
                    <h2 class="card-title">게시물</h2>
                  <form class="forms-sample" method="post" action="Controller?type=changeview&b_idx=<%= vo.getB_idx()%>">
                  	
                      <div class="form-group">
                        <label>제목:  </label>
                        <label><%=vo.getB_name() %></label>
                      </div>
                      <div class="form-group">
                        <label>작가:  </label>
                        <label><%=vo.getB_writer() %></label>
                      </div>
                      <div class="form-group">
                        <label>작성날짜:  </label>
                        <label><%=vo.getWrite_date()%></label>
                      </div>
                      <div class="form-group">
                        <label>금액:  </label>
                        <label><%=vo.getPrice() %></label>
                      </div>
                      <div class="form-group">
                        <label>내용</label>
                        <label><%=vo.getContent() %></label>
                      </div>
                      <input type="hidden" name="type" value="changeview">
                      <input type="button" class="file-upload-browse btn btn-primary" value="수정" onclick="changeList(this.form)"/>
						<input type="button" class="file-upload-browse btn btn-primary" value="목록" onclick="backList()"/>
						<input type="button" class="file-upload-browse btn btn-primary" value="댓글등록" onclick="javascript:location.href='Controller?type=addaut&b_idx=<%=vo.getB_idx()%>'"/>
                    </form>
						<%
							List<AuthorVO> a_list = vo.getA_list();
							for(AuthorVO avo : a_list){
						%>
						<div>
							제목:<%=avo.getMain() %>
							이름:<%=avo.getWriter() %> &nbsp;&nbsp;
							날짜:<%=avo.getWrite_date() %><br/>
							내용:<%=avo.getContent() %>
						</div>
						
<%
		}
%>
							<form name="frm" method="post" action="Controller">
								<input type="hidden" name="type" />
								<input type="hidden" name="cPage" value="${cPage}"/>
								<input type="hidden" name="b_idx" value="<%=vo.getB_idx() %>"/>
								<input type="hidden" name="f_name" />
							</form>
                      
                      <%
	}
                      %>
               <%
              
	}
               %>
                  </div>
                  </div>
                  </div>
	<script>
		function backList(){
			location.href="Controller?type=list";
		}
		function changeList(frm){
			frm.submit();
		}
	</script>