<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연락처 추가</title>
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

.pn_ok {
	color: #ff0000;
	display: none;
}

.nm_ok {
	color: #008000;
	display: none;
}

.nm_already {
	color: #6A82FB;
	display: none;
}

.add_ok {
	color: #008000;
	display: none;
}

.add_already {
	color: #6A82FB;
	display: none;
}
</style>
</head>
<body>
	<%@include file="nav1.jsp"%>
	<!-- Section: Design Block -->
	<section class="text-center">
		<!-- Background image -->
		<div class="p-5 bg-image"
			style="background-image: url('/images/addMember.jpeg'); height: 300px;"></div>
		<!-- Background image -->

		<div class="card mx-4 mx-md-5 shadow-5-strong"
			style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.8); backdrop-filter: blur(30px);">
			<div class="card-body py-5 px-md-5">

				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h2 class="fw-bold mb-5">연락처 등록</h2>
						<form method="post" action="/phonebook/add">

							<div class="form-outline mb-4">
								<input type="text" id="membernm" name="membernm"
									class="form-control" oninput="namecheck(membernm.value)"
									minlength="2" maxlength="20" required /> <label
									class="form-label" for="form3Example1">이름</label>
							</div>
							<p class="nm_ok">바르게 입력하셨습니다.</p>
							<p class="nm_already">2글자 이상 20글자 미만으로 입력하세요.</p>

							<div class="form-outline mb-4">
								<input type="text" maxlength="11" id="form3Example2" name="phonenumber"
									class="form-control" oninput="pncheck(phonenumber.value)"
									 onKeyup="onlyNumber(this)" required /> <label
									class="form-label" for="form3Example3">전화번호</label>
							</div>
							<p class="pn_ok">전화번호가 중복됩니다.</p>

							<div class="form-outline mb-4">
								<input type="text" id="form3Example3" name="address"
									class="form-control" oninput="addresscheck(address.value)"
									minlength="2" required /> <label class="form-label"
									for="form3Example4">주소</label>
							</div>
							<p class="add_ok">바르게 입력하셨습니다.</p>
							<p class="add_already">2글자 이상 입력하세요.</p>

							<div class="form-outline mb-4">
								<select class="form-select" name="groupno"
									aria-label="Default select example" required>
									<option disabled>그룹 선택</option>
									<option selected value="10">가족</option>
									<option value="20">친구</option>
									<option value="30">기타</option>
								</select>
							</div>
							<button type="submit"
								class="btn btn-primary btn-block mb-4">연락처 추가</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/js/check.js"></script>
</body>
</html>