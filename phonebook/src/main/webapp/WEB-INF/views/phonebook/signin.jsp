<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
.a {
	float: left;
}
</style>
</head>
<body>
	<!-- Section: Design Block -->
	<section class="text-center">
		<!-- Background image -->
		<div class="p-5 bg-image"
			style="background-image: url('/images/signin.jpeg'); height: 350px;"></div>
		<!-- Background image -->

		<div class="card mx-4 mx-md-5 shadow-5-strong"
			style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">

				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h2 class="fw-bold mb-5">로그인</h2>
						<form method="post" action="/phonebook/in">
							<!-- Email input -->
							<div class="form-outline mb-4">
								<input type="text" name="userid" id="id"
									class="form-control" required /> <label class="form-label"
									for="form3Example3">아이디</label>
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4">
								<input type="password" name="userpassword" id="pw"
									class="form-control" required /> <label class="form-label"
									for="form3Example4">비밀번호</label>
							</div>

							<!-- Checkbox -->
							<div class="a">
								<div class="form-check d-flex justify-content-center mb-4">
									<input class="form-check-input me-2" type="checkbox" value=""
										id="form2Example33" checked /> <label
										class="form-check-label" for="form2Example33"> 로그인 정보
										저장 </label>
								</div>
							</div>

							<!-- Submit button -->
							<button type="submit" onclick="btn(); return false;" class="btn btn-primary btn-block mb-4">
								로그인</button>
							<div class="text-center">
								<p>
									회원이 아니십니까? <a href="/phonebook/signup">계정 만들기</a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	${msg}	
</body>
</html>