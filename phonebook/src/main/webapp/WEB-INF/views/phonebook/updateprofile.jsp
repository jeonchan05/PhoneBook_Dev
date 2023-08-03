<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
	rel="stylesheet" />
<style type="text/css">
table {
	margin-left: auto;
	margin-right: auto;
}

.form-outline .form-control {
	border-radius: .25rem;
	box-shadow: inset 0 0 0 1px silver;
}

.form-control:focus {
	border-color: #3b71ca;
	box-shadow: inset 0 0 0 1px #3b71ca;
}

.input-group {
	height: 35px;
	width: 300px;
	float: right;
}

.pn_ok {
	color: #008000;
	display: none;
}

.pn_already {
	color: #6A82FB;
	display: none;
}

.nm_ok {
	color: #008000;
	display: none;
}

.nm_already {
	color: #ff0000;
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
	<%@include file="nav1.jsp"%>
	<header>
		<form method="post" action="/phonebook/search">
			<div>
				<table class="table align-middle mb-0 bg-white w-75">
					<thead class="bg-light">
						<tr>
							<th>프로필 수정</th>
							<th>&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;수정 버튼</th>
						</tr>
					</thead>
				</table>
			</div>
		</form>

		<c:forEach var="userinfo" items="${userinfo}" varStatus="status">
			<table class="table align-middle mb-0 bg-white w-75" id="table_id">
				<thead class="bg-light">
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<button type="button"
									class="btn btn-link btn-rounded btn-sm fw-bold"
									data-mdb-toggle="modal" data-mdb-target="#exampleModalimage"
									data-mdb-ripple-color="dark">
									<img src="${userinfo.imgnm}" alt=""
										style="width: 45px; height: 45px" class="rounded-circle" />
								</button>
								<div class="ms-3">
									<p class="fw-bold mb-1">프로필 이미지 수정</p>
								</div>
							</div>
						</td>
						<td></td>
						<td><button type="button"
								class="btn btn-link btn-rounded btn-sm fw-bold"
								data-mdb-toggle="modal" data-mdb-target="#exampleModalimage"
								data-mdb-ripple-color="dark">
								<i class="fas fa-pen-to-square"></i>
							</button>
							<div class="modal fade" id="exampleModalimage" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">${userinfo.username}의
												프로필 이미지 수정</h5>
											<button type="button" class="btn-close"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body mx-4">
											<form method=post action="/phonebook/login/updateprofileimg"
												enctype="multipart/form-data">
												<div class="form-outline mb-4">
													<input type="file" name="file" class="form-control"
														required>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-mdb-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-primary"
														id="form_submit">저장</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<div class="ms-3">
									<p class="fw-bold mb-1">이름 수정</p>
								</div>
							</div>
						</td>
						<td></td>
						<td>
							<button type="button"
								class="btn btn-link btn-rounded btn-sm fw-bold"
								data-mdb-toggle="modal"
								data-mdb-target="#exampleModalname"
								data-mdb-ripple-color="dark">
								<i class="fas fa-pen-to-square"></i>
							</button>
							<div class="modal fade" id="exampleModalname"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">${userinfo.username}의
												이름 수정</h5>
											<button type="button" class="btn-close"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body mx-4">
											<form method=post action="/phonebook/login/updateprofilename"
												enctype="multipart/form-data">
												<div class="form-outline mb-4">
													<input type="text" id="membernm" name="membernm"
														class="form-control" oninput="namecheck(membernm.value)"
														minlength="2" maxlength="20" required> <label
														class="form-label" for="form3Example1">이름</label>
												</div>
												<p class="nm_ok">바르게 입력하셨습니다.</p>
												<p class="nm_already">2글자 이상 20글자 미만으로 입력하세요.</p>
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckChecked" required /> <label
														class="form-check-label" for="flexCheckChecked">이름을
														수정하시겠습니까?</label>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-mdb-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-primary"
														id="form_submit">저장</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<div class="ms-3">
									<p class="fw-bold mb-1">비밀번호 수정</p>
								</div>
							</div>
						</td>
						<td></td>
						<td>
							<button type="button"
								class="btn btn-link btn-rounded btn-sm fw-bold"
								data-mdb-toggle="modal"
								data-mdb-target="#exampleModal${userinfo.userpassword}"
								data-mdb-ripple-color="dark">
								<i class="fas fa-pen-to-square"></i>
							</button>
							<div class="modal fade" id="exampleModal${userinfo.userpassword}"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">${userinfo.username}의
												비밀번호 수정</h5>
											<button type="button" class="btn-close"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body mx-4">
											<form method=post action="/phonebook/login/updateprofilepw"
												enctype="multipart/form-data">
												<div class="form-outline mb-4">
													<input type="password" minlength="6" maxlength="20"
														name="userpassword" id="pw" class="form-control"
														placeholder="비밀번호를 6자리 이상 입력해주세요"
														oninput="pwcheck(pw.value)" required /> <label
														class="form-label" for="form3Example4">비밀번호</label>
												</div>

												<div>
													<span class="pw_ok">바르게 입력하셨습니다.</span> <span
														class="pw_already">6글자 이상 20글자 미만으로 입력하세요.</span>
												</div>
												<div class="passwordmark">
													<label class="form-check-label mb-4" for="show-password">비밀번호
														표시:</label> <input class="form-check-input me-2" type="checkbox"
														id="show-password" onchange="showPassword()">
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-mdb-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-primary"
														id="form_submit">저장</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<div class="ms-3">
									<p class="fw-bold mb-1">회원 탈퇴</p>
								</div>
							</div>
						</td>
						<td></td>
						<td><button type="button"
								class="btn btn-link btn-rounded btn-sm fw-bold"
								data-mdb-toggle="modal" data-mdb-target="#exampleModaldelete"
								data-mdb-ripple-color="dark">
								<i class="fas fa-x"></i>
							</button>
							<div class="modal fade" id="exampleModaldelete" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
											<button type="button" class="btn-close"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body mx-4">
											<form method=post action="/phonebook/login/deleteprofile"
												enctype="multipart/form-data">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckChecked" required /> <label
														class="form-check-label" for="flexCheckChecked">회원
														탈퇴에 동의하십니까?</label>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-mdb-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-primary"
														id="form_submit">회원 탈퇴</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div></td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
		<!-- 수정 버튼 -->

		<!-- Modal -->

		${msg}
	</header>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/js/check.js"></script>
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
</body>
</html>