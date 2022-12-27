<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="card-body">
                    <h4 class="card-title">회원정보수정</h4>
                    <form class="forms-sample">
                    <input type="hidden" name="type" value="fix">
                      <div class="form-group">
                        <label for="아이디">기존아이디</label><br/><br/>
                       <input type="text" class="form-control" id="id" name="u_id" value="${sessionScope.svo.u_id}" readonly>
                      </div>
                      <div class="form-group">
                        <label for="비밀번호">기존비밀번호</label>
                        <input type="password" class="form-control" id="pwd" name="u_pwd" value="${sessionScope.svo.u_pwd }">
                      </div>
                      <div class="form-group">
                        <label for="이름">기존이름</label><br/><br/>
                       <input type="text" class="form-control" id="id" name="u_name" value="${sessionScope.svo.u_name}" readonly>
                      </div> 
                      <div class="form-group">
                        <label for="생년월일">기존생년월일</label><br/><br/>
                        <input type="text" class="form-control" id="id" name="birth_date" value="${sessionScope.svo.birth_date}" readonly>
                      </div>
                      <div class="form-group">
                        <label for="이메일">기존이메일</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.svo.email }">
                      </div>
                      <div class="form-group">
                        <label for="핸드폰">기존핸드폰</label>
                        <input type="text" class="form-control" id="cellPhone" name="cellPhone" value="${sessionScope.svo.cellPhone }">
                      </div>
                      <button type="button" class="btn btn-primary mr-2" onclick="sendData(this.form)"> 수정 </button>
                    </form>
                  </div>
                  <script>
                  	function sendData(frm){
                  		let str = frm.u_pwd.value;
                  		if(str.trim().length < 1){
            				alert("비밀번호를 입력하세요");
            				frm.u_pwd.value="";
            				frm.u_pwd.focus();
            				return;
            			}
                  		frm.submit();
                  	}
                  </script>