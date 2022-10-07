<
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>시작하기</title>
	<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
	<!-- Font Awesome icons (free version)-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
</head>
<style>
	html {
		height: 100%;
	}
	body {
		margin:0;
		padding:0;
		font-family: sans-serif;
		background: linear-gradient(#141e30, #243b55);
	}

	.login-box {
		position: absolute;
		top: 50%;
		left: 50%;
		width: 500px;
		padding: 40px;
		transform: translate(-50%, -50%);
		background: rgba(0,0,0,.5);
		box-sizing: border-box;
		box-shadow: 0 15px 25px rgba(0,0,0,.6);
		border-radius: 10px;
	}

	.login-box h2 {
		margin: 0 0 30px;
		padding: 0;
		color: #fff;
		text-align: center;
	}

	.login-box .user-box {
		position: relative;
	}

	.login-box .user-box input {
		width: 100%;
		padding: 10px 0;
		font-size: 16px;
		color: #fff;
		margin-bottom: 30px;
		border: none;
		border-bottom: 1px solid #fff;
		outline: none;
		background: transparent;
	}
	.login-box .user-box label {
		position: absolute;
		top:0;
		left: 0;
		padding: 10px 0;
		font-size: 16px;
		color: #fff;
		pointer-events: none;
		transition: .5s;
	}

	.login-box .user-box input:focus ~ label,
	.login-box .user-box input:valid ~ label {
		top: -20px;
		left: 0;
		color: #03e9f4;
		font-size: 12px;
	}

	.login-box form a {
		position: relative;
		display: inline-block;
		padding: 10px 20px;
		color: #03e9f4;
		font-size: 16px;
		text-decoration: none;
		text-transform: uppercase;
		overflow: hidden;
		transition: .5s;
		margin-top: 40px;
		letter-spacing: 4px
	}

	.login-box a:hover {
		background: #03e9f4;
		color: #fff;
		border-radius: 5px;
		box-shadow: 0 0 5px #03e9f4,
		0 0 25px #03e9f4,
		0 0 50px #03e9f4,
		0 0 100px #03e9f4;
	}

	.login-box a span {
		position: absolute;
		display: block;
	}

	.login-box a span:nth-child(1) {
		top: 0;
		left: -100%;
		width: 100%;
		height: 2px;
		background: linear-gradient(90deg, transparent, #03e9f4);
		animation: btn-anim1 1s linear infinite;
	}

	@keyframes btn-anim1 {
		0% {
			left: -100%;
		}
		50%,100% {
			left: 100%;
		}
	}

	.login-box a span:nth-child(2) {
		top: -100%;
		right: 0;
		width: 2px;
		height: 100%;
		background: linear-gradient(180deg, transparent, #03e9f4);
		animation: btn-anim2 1s linear infinite;
		animation-delay: .25s
	}

	@keyframes btn-anim2 {
		0% {
			top: -100%;
		}
		50%,100% {
			top: 100%;
		}
	}

	.login-box a span:nth-child(3) {
		bottom: 0;
		right: -100%;
		width: 100%;
		height: 2px;
		background: linear-gradient(270deg, transparent, #03e9f4);
		animation: btn-anim3 1s linear infinite;
		animation-delay: .5s
	}

	@keyframes btn-anim3 {
		0% {
			right: -100%;
		}
		50%,100% {
			right: 100%;
		}
	}

	.login-box a span:nth-child(4) {
		bottom: -100%;
		left: 0;
		width: 2px;
		height: 100%;
		background: linear-gradient(360deg, transparent, #03e9f4);
		animation: btn-anim4 1s linear infinite;
		animation-delay: .75s
	}

	@keyframes btn-anim4 {
		0% {
			bottom: -100%;
		}
		50%,100% {
			bottom: 100%;
		}
	}
	/* 유효성 검사 문구 */

	.final_id_ck{
		display: none;
		color : red;
	}
	.final_email_ck{
		display: none;
		color : red;
	}
	.final_pw_ck{
		display: none;
		color : red;
	}
	.final_pwck_ck{
		display: none;
		color : red;
	}
	.final_name_ck{
		display: none;
		color : red;
	}
	.final_mail_ck{
		display: none;
		color : red;
	}
	.final_addr_ck{
		display: none;
		color : red;
	}

	/* 비밀번호 확인 일치 유효성검사 */
	.pwck_input_re_1{
		color : green;
		display : none;
	}
	.pwck_input_re_2{
		color : red;
		display : none;
	}

	/* float 속성 해제 */
	.clearfix{
		clear: both;
	}

</style>
<body>
<!-- Background Video-->
<video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop"><source src="assets/mp4/bg.mp4" type="video/mp4" /></video>
<!-- Masthead-->
<div class="masthead">
	<div class="masthead-content text-white">
		<div class="container-fluid px-4 px-lg-0">
			<div class="login-box">
				<h2>Login</h2>
				<form id="login_form" method="post" action="/userlogin.do">
					<div class="id_wrap">
						<div class="id_name">아이디</div>
						<div class="id_input_box user-box">
							<input type="text" class="id_input" name="userid" id="userid">
						</div>
						<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
						<span class="final_id_ck">아이디를 입력해주세요.</span>
					</div>
					<div class="user-box pw_input_box">
						<input type="password" class="pw_input" name="memberPw" id="memberPw">
						<label>Password</label>
						<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
					</div>

					<div class="d-flex justify-content-center" style="margin: auto;">

						<a href="/join1">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							Sign up
						</a>
					</div>



					<div class="join_button_wrap">
						<input type="button" class="join_button" value="가입하기">
					</div>

				</form>
			</div>
		</div>
	</div>
</div>
<script>
	var code = "";				//이메일전송 인증번호 저장위한 코드
	/* 유효성 검사 통과유무 변수 */
	var idCheck = false;			// 아이디
	var idckCheck = false;			// 아이디 중복 검사
	var pwCheck = false;			// 비번
	var pwckCheck = false;			// 비번 확인
	var pwckcorCheck = false;		// 비번 확인 일치 확인
	var mailCheck = false;			// 이메일
	var mailnumCheck = false;		// 이메일 인증번호 확인
	var addressCheck = false 		// 주소

	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		$(".join_button").click(function(){

			/* 입력값 변수 */
			var id = $('.id_input').val(); 				// id 입력란
			var pw = $('.pw_input').val();				// 비밀번호 입력란
			var pwck = $('.pwck_input').val();			// 비밀번호 확인 입력란
			var mail = $('.mail_input').val();			// 이메일 입력란
			var addr = $('.address_input_3').val();		// 주소 입력란

			/* 아이디 유효성검사 */
			if(id == ""){
				$('.final_id_ck').css('display','block');
				idCheck = false;
				alert("아이디칸이 비어있습니다");
				return
			}else{
				$('.final_id_ck').css('display', 'none');
				idCheck = true;
			}

			/* 비밀번호 유효성 검사 */
			if(pw == ""){
				$('.final_pw_ck').css('display','block');
				pwCheck = false;
				alert("비밀번호칸이 비어있습니다");
				return
			}else{
				$('.final_pw_ck').css('display', 'none');
				pwCheck = true;
			}

			/* 비밀번호 확인 유효성 검사 */
			if(pwck == ""){
				$('.final_pwck_ck').css('display','block');
				pwckCheck = false;
				alert("비밀번호확인칸이 비어있습니다");
				return
			}else{
				$('.final_pwck_ck').css('display', 'none');
				pwckCheck = true;
			}

			/* 이름 유효성 검사 */

			/* 이메일 유효성 검사 */
			if(mail == ""){
				$('.final_mail_ck').css('display','block');
				mailCheck = false;
				alert("이메일칸이 비어있습니다");
				return
			}else{
				$('.final_mail_ck').css('display', 'none');
				mailCheck = true;
			}

			/* 주소 유효성 검사 */
			if(addr == ""){
				$('.final_addr_ck').css('display','block');
				addressCheck = false;
				alert("주소칸이 비어있습니다");
				return
			}else{
				$('.final_addr_ck').css('display', 'none');
				addressCheck = true;
			}

			/* 최종 유효성 검사 */
			if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&mailCheck&&mailnumCheck&&addressCheck ){

				$("#join_form").attr("action", "/join1");
				$("#join_form").submit();

			}

			return false;
		});
	});
	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){
		/* console.log("keyup 테스트");*/

		var userid = $('.id_input').val();			// .id_input에 입력되는 값
		var data = {user_id : userid}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

		$.ajax({
			type : "post",
			url : "/memberIdChk",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
					idckCheck = false;
				}
			}// success 종료
		}); // ajax 종료
	});// function 종료
	//email 중복검사
	$('.mail_input').on("propertychange change keyup paste input", function(){
		/* console.log("keyup 테스트");*/

		var memberMail = $('.mail_input').val();			// .id_input에 입력되는 값
		var data = {user_email : memberMail}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

		$.ajax({
			type : "post",
			url : "/emailck",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.email_input_re_1').css("display","inline-block");
					$('.email_input_re_2').css("display", "none");
					emailck = true;
				} else {
					$('.email_input_re_2').css("display","inline-block");
					$('.email_input_re_1').css("display", "none");
					emailck = false;
				}
			}// success 종료
		}); // ajax 종료
	});// function 종료
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function(){

		var email = $(".mail_input").val();			// 입력한 이메일
		var cehckBox = $(".mail_check_input");		// 인증번호 입력란
		var boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
		var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글

		/* 이메일 형식 유효성 검사 */
		if(mailFormCheck(email)){
			warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
			warnMsg.css("display", "inline-block");
		} else {
			alert("올바르지 못한 이메일 형식입니다.");
			warnMsg.html("올바르지 못한 이메일 형식입니다.");
			warnMsg.css("display", "inline-block" ,);
			return false;
		}

		$.ajax({

			type:"GET",
			url:"mailCheck?email=" + email,
			success:function(data){

				//console.log("data : " + data);
				cehckBox.attr("disabled",false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;

			}

		});

	});
	/* 인증번호 비교 */
	$(".mail_check_input").blur(function(){

		var inputCode = $(".mail_check_input").val();		// 입력코드
		var checkResult = $("#mail_check_input_box_warn");	// 비교 결과

		if(inputCode == code){							// 일치할 경우
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class", "correct");
			mailnumCheck = true;
		} else {											// 일치하지 않을 경우
			checkResult.html("인증번호를 다시 확인해주세요.");
			checkResult.attr("class", "incorrect");
			mailnumCheck = false;
		}

	});
	/* 다음 주소 연동 */
	function execution_daum_address(){

		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraAddr !== ''){
						extraAddr = ' (' + extraAddr + ')';
					}
					// 주소변수 문자열과 참고항목 문자열 합치기
					addr += extraAddr;

				} else {
					addr += ' ';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(".address_input_1").val(data.zonecode);
				//$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
				$(".address_input_2").val(addr);
				//$("[name=memberAddr2]").val(addr);			// 대체가능
				// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
				$(".address_input_3").attr("readonly",false);
				$(".address_input_3").focus();

			}
		}).open();

	}
	/* 비밀번호 확인 일치 유효성 검사 */
	$('.pwck_input').on("propertychange change keyup paste input", function(){

		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('.final_pwck_ck').css('display', 'none');

		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}


	});
	/* 입력 이메일 형식 유효성 검사 */
	function mailFormCheck(email){
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

		return form.test(email);
	}
</script>



<!-- Social Icons-->
<!-- For more icon options, visit https://fontawesome.com/icons?d=gallery&p=2&s=brands-->

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>