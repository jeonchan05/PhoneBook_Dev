<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
	rel="stylesheet" />
<style type="text/css">
.passwordmark {
	float: left;
}

.form-image {
	float: left;
	font-size: 20px;
}

.nm_ok {
	color: #008000;
	display: none;
}

.nm_already {
	color: #ff0000;
	display: none;
}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #ff0000;
	display: none;
}

.pw_ok {
	color: #008000;
	display: none;
}

.pw_already {
	color: #ff0000;
	display: none;
}
</style>
</head>
<body>
	<!-- Section: Design Block -->
	<section class="text-center">
		<!-- Background image -->
		<div class="p-5 bg-image"
			style="background-image: url('/images/signup.jpeg'); height: 300px;"></div>
		<!-- Background image -->

		<div class="card mx-4 mx-md-5 shadow-5-strong"
			style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">

				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h2 class="fw-bold mb-5">회원 가입</h2>
						<form method="post" action="/phonebook/up"
							enctype="multipart/form-data">

							<div class="mb-4 text-left">
								<span class="form-image">프로필 이미지</span> <input type="file"
									name="file" class="form-control" required>
							</div>

							<div class="form-outline mb-4">
								<input type="text" name="username" id="username"
									class="form-control" oninput="namecheck(username.value)"
									placeholder="이름을 2자리 이상 입력해주세요" required maxlength="20"
									minlength="2" /> <label class="form-label" for="form3Example1">이름</label>
							</div>
							<!-- Email input -->
							<span class="nm_ok">바르게 입력하셨습니다.</span> <span class="nm_already">2글자
								이상으로 20글자 미만으로 입력하세요.</span>

							<div class="form-outline mb-4">
								<input type="text" minlength="4" name="userid" id="userid"
									class="form-control" oninput="checkId(userid.value)"
									placeholder="아이디를 4자리 이상 입력해주세요" required /><label
									class="form-label" for="form3Example3">아이디</label>
							</div>
							<span class="id_ok">사용 가능한 아이디입니다.</span> <span
								class="id_already">이 아이디는 이미 사용중 입니다.</span>
							<!-- Password input -->
							<div class="form-outline mb-4">
								<input type="password" minlength="6" maxlength="20"
									name="userpassword" id="pw" class="form-control"
									placeholder="비밀번호를 6자리 이상 입력해주세요" oninput="pwcheck(pw.value)"
									required /> <label class="form-label" for="form3Example4">비밀번호</label>
							</div>

							<div>
								<span class="pw_ok">바르게 입력하셨습니다.</span> <span class="pw_already">6글자
									이상 20글자 미만으로 입력하세요.</span>
							</div>

							<div class="passwordmark">
								<label class="form-check-label mb-4" for="show-password">비밀번호
									표시:</label> <input class="form-check-input me-2" type="checkbox"
									id="show-password" onchange="showPassword()">
							</div>
							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-block mb-4">가입하기</button>
							<p>
								이미 계정이 있으십니까? <a href="/phonebook/signin">로그인하기</a>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	<script type="text/javascript">
		function showPassword() {
			var passwordInput = document.getElementById("pw");
			var showPasswordCheckbox = document.getElementById("show-password");
			if (showPasswordCheckbox.checked) {
				passwordInput.type = "text";
			} else {
				passwordInput.type = "password";
			}
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function checkId(userid) {
			$.ajax({
				url : '/phonebook/idcheck',
				type : 'post',
				data : {
					userid : userid
				},
				success : function(check) {
					if (check == 0) {
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
					} else {
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
						$('userid').val('');
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};
	</script>
	<script src="/js/check.js"></script>
</body>
</html>