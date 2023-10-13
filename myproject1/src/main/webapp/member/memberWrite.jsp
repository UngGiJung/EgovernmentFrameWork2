<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원가입화면</title>
 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="/css/main.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>


</style>
</head>

<script>

$(function(){ 
	
	$("#birth").datepicker();
	
	$("#userid").keyup(function(){
		
		let msg = "";
		let userid = $("#userid").val();		
		if( userid.length < 6 || userid.length > 12) {
			msg = "아이디는 6자~12자로 입력해주세요.";
			$("#userid_msg").html(msg);
		} else {
			$.ajax({
				type: "post",
				url : "/useridChk.do",
				data: "userid="+userid,
				datatype : "text",
				success: function(msg1) {
					if(msg1 == 0) {
						msg = "사용가능한 아이디 입니다."
					} else if( msg1 == 1 ) {
						msg = "이미 사용중인 아이디 입니다.";
					} else if ( msg1 == 2 ) {
						msg = "아이디는 영문+숫자 만 가능합니다."
					} else { }
					$("#userid_msg").html(msg);					
				},
				error : function() {
					$("#userid_msg").html("아이디는 영문+숫자 만 가능합니다.");
				}
			});
					
			$("#userid_msg").html(msg);	
		}		
	});
	
	$("#btn_save").click(function() {
		
		let userid = $.trim$("#userid").val();
		let pass  = $.trim($("pass").val());
		
		$("#userid").val(userid);
		$("#userid").val(pass);
		// 6 ~ 12 자 사이로 입력해야되는 조건 걸기
		if( userid.length < 6 || userid.length > 12 ) {
			alert("아이디는 6자~12자 사이로 입력해주세요.")
			$("#userid").focus();
			return false;
		}
		if( pass == "") {
			alert("암호를 입력해주세요.")
			$("#pass").focus();
			return false;
		}
		
		if( $("input:radio[name=gender]").is(":checked") == false ) {
			alert("성별을 입력해주세요.");
			return false;
		}
		
		var form = $("#frm").serialize();
		$.ajax({
			type: "post",
			url : "/memberWriterSave.do",
			data: form,
			datatype : "text",
			success: function(msg1) {
				alert(msg1);
				if(msg1 == "ok") {
					alert("저장완료");
					location = "/loginWrite.do"
				} else {
				
				}
			},
			error : function() {	}
		});
	});
});


</script>



<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>

	<%@ include file="../include/nav.jsp" %>

    </nav>
	<aside>
	
	<%@ include file="../include/aside.jsp" %>
	
	</aside>
    <section>
    
       <article>
       <form>
		<table>
		<caption> 회원가입 폼 </caption>
		<colgroup>
			 <col width="30%"/>
			 <col width="*"/>
		 </colgroup>
		 <tbody>
			 <tr>
				  <th>아이디</th>
				  <td>
				  <input type="text" name="userid" id="userid">
				  <span id="userid_msg"></span>
				  </td>
				  
			 </tr>
			 <tr>
				  <th>암호</th>
				  <td><input type="password" name="pass" id="pass"></td>
			 </tr>
			 <tr>
				  <th>이름</th>
				  <td><input type="text" name="name" id="name"></td>
			 </tr>
			 <tr>
				  <th>생일</th>
				  <td><input type="text" name="birth" id="birth"></td>
			 </tr>
			 <tr>
				  <th>성별</th>
				  <td>
				  <input type="radio" name="gender" id="gender" value="M">남
				  <input type="radio" name="gender" id="gender" value="F">여
				  </td>
			 </tr>
			 <tr>
				  <th>핸드폰</th>
				  <td><input type="text" name="mobile" id="mobile"></td>
			 </tr>
			 <tr>
				  <th>주소</th>
				  <td>
				  <input type="text" name="zipcode" id="zipcode"> 
				  <br>
				  <input type="text" name="addr" id="addr">
				  </td>
			 </tr>

		 </tbody>
		</table>
		

		<div style="width:600px; text-align:center; margin-top:10px;">
		
			<button type="submit" id="btn_save">저장</button>
			<button type="reset">취소</button>
		
		</div>

		</form>

       </article>
    </section>
    
    <footer>
        
	<%@ include file="../include/footer.jsp" %>
	        
    </footer>


</div>
</body>
</html>