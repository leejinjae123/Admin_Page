<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mybatis.vo.BookVO"%>
<%
	String cPage = request.getParameter("cPage");
	String b_idx = request.getParameter("b_idx");
	
	Object obj =  session.getAttribute("vo");
	
	BookVO vo= (BookVO)obj;
	
	if(cPage==null)
		cPage="1";
%>
<link rel="stylesheet" href="css/summernote-lite.css"/>
	<div class="main-panel">
          <div class="content-wrapper">
			<form action="Controller?type=change" method="post" 
			encType="multipart/form-data">
				<table>
				<thead>
					<h2>게시판 글 수정</h2>
				</thead>
					<tbody>
						<tr>
							<th>제목:</th>
							<td><input type="text" name="b_name" size="15" value="<%=vo.getB_name()%>"></td>
						</tr>
						<tr>
							<th>이름:</th>
							<td><input type="text" name="b_writer" size="12"  value="<%=vo.getB_writer() %>" readonly></td>
						</tr>
						<tr>
							<th>금액:</th>
							<td><input type="text" name="price" size="12" value="<%=vo.getPrice() %>"></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td><textarea id="content" name="content"  cols="50" 
									rows="8"><%=vo.getContent()%></textarea></td>
						</tr>
						<tr>
							<th>첨부파일:</th>
							<td><input type="file" id="file" name="file" />
								<span style="colorL:#00f; font-weight:bold;">
									첨부파일
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="hidden" name="cPage" value="<%=cPage%>"/> 
								<input type="hidden" name="b_idx" value="<%=b_idx%>"/> 
								<input type="button" value="수정" onclick="sendData()"/>
								<input type="button" value="목록" onclick="baclkList()"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="js/summernote-lite.js"></script>
	<script src="js/lang/summernote-ko-KR.js"></script>
	<script>
		$(function(){
			
			$("#content").summernote({
				height: 200,
				lang: "ko-KR",
				focus: true,/* 커서를 미리 가져다 놓는다. */
				callbacks:{
					onImageUpload: function(files, editor){
						// 이미지가 에디터에 추가될 때마다 수행하는 곳!
						// ( 추가되는 이미지들은 배열로 인식함! )
						for(let i=0; i<files.length; i++)
							sendImage(files[i], editor);// 서버로 비동기식 통신으로
									// 이미지를 서버로 업로드 시킨다. -- editor_img폴더 저장!
					}
				}
			});
			
			$("#content").summernote("lineHeight", 0.4);
			
		});
		
		function sendImage(file, editor){
			// 에디터에 이미지가 들어왔을 때 수행하는 곳이다.
			// 이미지도 파일이므로 Multipart/form-data형식을 따라야 한다.
			let frm = new FormData();
			
			// 보내고자 하는 파일을 위해 만든 FormData에 파라미터를 넣어주자
			frm.append("s_file", file);
			
			//비동기식 통신
			$.ajax({
				url: "Controller?type=saveImg",
				data: frm,
				type: "post",
				contentType: false,
				processData: false,
				cache: false,
				dataType: "json",//서버로부터 받을 데이터 형식
			}).done(function(data){
				$("#content").summernote("editor.insertImage", data.url);
			});
		}
		
		function baclkList(){
			location.href="Controller?type=list&cPage=<%=cPage%>";
		}
		function sendData(){
			let b_name = document.forms[0].b_name.value;
			let b_writer = document.forms[0].b_writer.value;
			
			if(b_name.trim().length<1){
				alert("제목을 입력하세요");
				document.forms[0].b_name.value="";
				document.forms[0].b_name.focus();
				return;
			}
			if(b_writer.trim().length<1){
				alert("글쓴이를 입력하세요");
				document.forms[0].b_writer.value="";
				document.forms[0].b_writer.focus();
				return;
			}
			document.forms[0].submit();
		}
		
	</script>