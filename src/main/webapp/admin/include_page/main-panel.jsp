<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="card-body">
                <h4 class="card-title">로그인</h4>
                    <form class="forms-sample" method="post">
                      <input type="hidden" name="type" value="loginsubmit"/>
                      <div class="form-group">
                        <label for="LoginID">아이디</label>
                        <input type="text" class="form-control" id="exampleInputUsername1" name="u_id" placeholder="ID">
                      </div>
                      <div class="form-group">
                        <label for="Password1">Password</label>
                        <input type="password" class="form-control" id="Password" name="u_pwd" placeholder="Password">
                      </div>
                      <div class="form-group">
                        <label for="ConfirmPassword1">Confirm Password</label>
                        <input type="password" class="form-control" id="ConfirmPassword1" name="a_pwd" placeholder="Password">
                      </div>
                      <button type="button" class="btn btn-primary mr-2" onclick="sendData(this.form)"> 로그인 </button>
                      <button type="button" class="btn btn-primary mr-2" onclick="signup()">회원가입</button>
                      </form>
                    
                  </div>
                 <script>
                 	function sendData(frm){
                 		let str = frm.u_id.value;
                 		let str2 = frm.u_pwd.value;
                 		let str3 = frm.a_pwd.value;
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
            			if(str3 != str2){
            				alert("비밀번호가 같지 않습니다");
            				frm.a_pwd.value="";
            				frm.a_pwd.focus();
            				return;
            			}
                 		frm.submit();
                 	};
                 	function signup(){
                 		location.href="Controller?type=signup"
                 	};
                 </script>