<%@page import="mybatis.vo.BookVO"%>
<%@page import="pro.paging.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%
    String cPage = request.getParameter("cPage");
    if(cPage==null)
		cPage="1";
    %>
 <style type="text/css">
 	tfoot ol.page {
	    list-style:none;
	}
	
	tfoot ol.page li {
	    float:left;
	    margin-right:8px;
	}
	
	tfoot ol.page li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	    text-decoration: none;
	}
	
	tfoot ol.page li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
 </style>
	<div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h1>상품 정보</h1>
            </div>
            <div class="row">
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                  	<div>
                    <h2 style="float:left">상품 목록</h2>
                    <button type="button" class="btn btn-danger btn-icon-text"style="margin-left:18px; float:right; display:inline-block;" onclick="addlist()">
                            <i class="mdi mdi-upload btn-icon-prepend"></i> 상품 등록 </button>
                  	</div>
                    <div class="table-responsive">
                   <form class="nav-link form-inline mt-2 mt-md-0">
                    <input type="hidden" name="type" value="search">
	                  <div class="input-group">
	                    <input type="hidden" name="cPage" value="<%=cPage%>"/>	
	                    <input type="text" class="form-control" name="search" placeholder="상품 검색">
	                      <button type="button" class="input-group-text" onclick="sendData(this.form)">
	                        <i class="mdi mdi-magnify"></i>
	                      </button>
	                  </div>
                	</form>
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th style="text-align:center;">제목</th>
                            <th>미리보기</th>
                            <th>글쓴이</th>
                            <th>금액</th>
                            <th>날짜</th>
                            <th>조회수</th>
                            <th>삭제</th>
                          </tr>
                        </thead>
                        <tfoot>
 						<tr>
                         	<td>
                         		<ol class="page">
<%
	Object obj2 = request.getAttribute("page");
	Paging pvo = null;
	if(obj2 != null){
			pvo = (Paging)obj2;
			
			if(pvo.getStartPage() < pvo.getPagePerBlock()){
%>		
		<li class="disable">&lt;</li>
<%		
		}else{ 
%>        		                        
		<li><a href="Controller?cPage=<%=pvo.getStartPage()-pvo.getPagePerBlock()%>&type=list">&lt;</a></li>
<%
		}
%>
<%
		for(int i=pvo.getStartPage(); i<=pvo.getEndPage(); i++){
		
		if(pvo.getNowPage() == i){ //i가 현재페이지 값과 같을 때
%>
			<li class="now"><%=i %></li>
<%			
		}else{  //i가 현재페이지 값과 다를 때
%>         
			<li><a href="Controller?cPage=<%=i%>&type=list"><%=i%></a></li>
<%
		}
	}
%>	

<% 	
		if(pvo.getEndPage() == pvo.getTotalPage()){
%>
			<li class="disable">&gt;</li>

<% 
		}else{
%>
		<li><a href="Controller?type=list&cPage=<%=pvo.getStartPage()+pvo.getPagePerBlock()%>">&gt;</a></li>

<%
		}
%>
<%		
		}
%>	
                             </ol>
						  		
                      </tr>
                    </tfoot>
            <tbody>
 <% 
	Object obj = request.getAttribute("bvo");
 
	BookVO[] bvo = null;
	
	if(obj != null){
		bvo = (BookVO[])obj;
	}

  			for(BookVO vo : bvo){
  %>
                          <tr >
                            <td style="text-align:center;">
                            <a href="Controller?type=view&b_idx=<%=vo.getB_idx()%>&cPage=<%=pvo.getNowPage()%>">
                              <%=vo.getB_name() %>
                              <%
                              if(vo.getA_list() !=null && vo.getA_list().size()>0){
                              %>
                              	(<%=vo.getA_list().size() %>)
                              <%
                              }
                              %>
                            </a></td> 
                            <%
                            	if(vo.getFile_name() != null){
                            %>
                            <td>
                            <img src="${request.getContextPath }/admin/file_upload/<%=vo.getFile_name()%>">
                            </td>
                            <%
                            	}else{
                            %>
                            <td>
                          	이미지없음
                          	</td>
                          	<%
                            	}
                          	%>
                            <td><%=vo.getB_writer() %></td>
                            <td>
                              <%=vo.getPrice() %>
                            </td>
                            <td><%=vo.getWrite_date() %></td>
                            <td><%=vo.getHit() %></td>
                            <td><input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>"/><button type="button" class="btn btn-dark btn-icon-text" onclick="javascript:location.href='Controller?type=del&b_idx=<%=vo.getB_idx()%>'"><i class="mdi mdi-delete"> 삭제 </i></button>
                            </td>
                          </tr>
<%
  			}
%>
                        </tbody>                       
                      </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Â© bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
            </div>
           </div>
<script>
	function addlist(){
		location.href="Controller?type=add";
	}
	function sendData(frm){
		frm.submit();
	}
</script>
             