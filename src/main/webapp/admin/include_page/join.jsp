<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="card-body">
         <h2 class="card-title">회원가입</h2>
	         <form class="forms-sample">
		         <input type="hidden" name="type" value="join">
		           <div class="form-group">
		             <label for="아이디">아이디</label>
		            <input type="text" class="form-control" id="u_id" name="u_id" placeholder="아이디">
		            <div><font id="id_chk"></font></div>
		           </div>
		           <div class="form-group">
		             <label for="비밀번호">비밀번호</label>
		             <input type="password" class="form-control" id="pwd" name="u_pwd" placeholder="">
		           </div>
		           <div class="form-group">
		             <label for="이름">이름</label>
		            <input type="text" class="form-control" id="id" name="u_name" placeholder="이름">
		           </div> 
		           <div class="form-group">
		             <label for="생년월일">생년월일</label>
		             <input type="text" class="form-control" id="id" name="birth_date" placeholder="생년월일">
		           </div>
		           <div class="form-group">
		             <label for="이메일">이메일</label>
		             <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
		           </div>
		           <div class="form-group">
		             <label for="핸드폰">핸드폰</label>
		             <input type="text" class="form-control" id="cellPhone" name="cellPhone" placeholder="핸드폰">
		           </div>
		           <button type="button" class="btn btn-primary mr-2" onclick="sendData(this.form)"> 회원가입 </button>
	         </form>
       </div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
		       	function sendData(frm){
		       		let str = frm.u_id.value;
		      		let str2 = frm.u_pwd.value;
		      		let str3 = frm.u_name.value;
		      		let str4 = frm.birth_date.value;
		 			if(str.trim().length < 1){
		 				alert("아이디를 입력하세요");
		 				frm.u_id.value="";
		 				frm.u_id.focus();
		 				return;
		 			}
		 			if(str2.trim().length < 1){
		 				alert("비밀번호를 입력하세요");
		 				frm.u_pwd.value="";
		 				frm.u_pwd.focus();
		 				return;
		 			}
		 			if(str3.trim().length < 1){
		 				alert("이름를 입력하세요");
		 				frm.u_pwd.value="";
		 				frm.u_pwd.focus();
		 				return;
		 			}
		     		if(str4.trim().length < 1){
		     			alert("생년월일를 입력하세요");
		     			frm.u_pwd.value="";
		     			frm.u_pwd.focus();
		     			return;
		     		}
		      		frm.submit();
		      	};
		     $("#u_id").keyup(function(){
		    	 let u_id = $("#u_id").val();
		    	 let param = "type=idchk&u_id="+encodeURIComponent(u_id);
		    	 $.ajax({
		    		 url : "Controller",
		    		 type : "post",
		    		 data : param,
		    		 dataType : "json"
		    	 }).done(function(res){
    			 	$("#id_chk").text(res.msg);
    			 	$("#id_chk").attr("color",res.color);
		    	 }).fail(function(err){
		    		 alert("서버 요청 실패");
		    	 });
		     });
		     
       </script>