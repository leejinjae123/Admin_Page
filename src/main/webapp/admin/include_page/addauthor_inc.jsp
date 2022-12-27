<%@page import="java.util.List"%>
<%@page import="mybatis.vo.AuthorVO"%>
<%@page import="mybatis.vo.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String b_idx = request.getParameter("b_idx");
    	String cPage = request.getParameter("cPage");
    	
    	Object obj = session.getAttribute("vo");
    	
    	if(obj != null){
    		
    		BookVO vo = (BookVO)obj;
    		
    	if(vo != null){
    %>
				<div class="card-body">
                    <h4 class="card-title">댓글 수정</h4>
                    <form class="forms-sample" method="post" action="Controller?type=addaut_submit&b_idx=<%=b_idx%>&cPage=<%=cPage%>">
                    <input type="hidden" name="type" value="addaut_submit">
                      <div class="form-group">
                        <label for="아이디">제목</label><br/><br/>
                       <input type="text" class="form-control" id="main" name="main" >
                      </div> 
                       <div class="form-group">
                        <label for="작성자">작성자</label><br/><br/>
                      	<input type="text" id="writer" name="writer" value="${sessionScope.svo.u_name }" readonly>
                      </div> 
                      <%
						}
    	}
    	
                      %>
                      <div class="form-group">
                        <label for="이름">글 작성</label><br/><br/>
                       	<textarea id="content" name="content"  cols="50" rows="8" ></textarea>
                      </div> 
                      <input type="hidden" name="cPage" value="<%=cPage%>">
                      <input type="hidden" name="b_idx" value="<%=b_idx%>"/>
                      <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"/>
                      <button type="button" class="btn btn-dark btn-icon-text" onclick="sendData(this.form)">저장하기</button>
                    </form>
                  </div>
                  <script>
                  	function sendData(frm){
                  		let str = frm.main.value;
                  		let str2 = frm.content.value;
                  		if(str.trim().length < 1){
            				alert("제목을 입력하세요");
            				frm.u_pwd.value="";
            				frm.u_pwd.focus();
            				return;
            			}
                  		if(str2.trim().length < 1){
            				alert("내용을 입력하세요");
            				frm.u_pwd.value="";
            				frm.u_pwd.focus();
            				return;
            			}
                  		frm.submit();
                  	}
                  	
                  </script>
                  