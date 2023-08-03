<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 메인</title>
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
.mb-3 {
	font-size: 70px;
	font-family: 'Times New Roman';
}

.a {
	position: relative;
	top: -100px;
}

.search {
	position: relative;
	text-align: center;
	width: 400px;
	margin: 0 auto;
}

input {
	width: 100%;
	border-radius: 20px;
	border: 1px solid #bbb;
	margin: 10px 0;
	padding: 10px 12px;
}

.fa-search {
	position: absolute;
	left: 370px;
	top: 25px;
	margin: 0;
}

.fa-keyboard {
	position: absolute;
	right: 35px;
	top: 20px;
}

.fa-microphone {
	position: absolute;
	right: 15px;
	top: 20px;
	color: blue;
}

.img-button {
	background: no-repeat;
	border: none;
	width: 32px;
	height: 32px;
	cursor: pointer;
	position: absolute;
	left: 350px;
	top: 16px;
	margin: 0;
}

.img {
	width: 35px;
	height: 35px;
	border-radius: 50px;
}
</style>
</head>
<body>
	<%@include file="nav1.jsp"%>
	<form method="post" action="/phonebook/search">
		<div class="p-5 text-center bg-image"
			style="background-image: url('/images/main.jpeg'); height: 750px;">
			<div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
				<div class="d-flex justify-content-center align-items-center h-100">
					<div class="text-white">
						<div class=a>
							<div class="mb-3">PHONE BOOK</div>
							<div class="container">
								<div class="d-flex justify-content-center">
									<div class="search">
										<input class="search_input" type="text" name="searchbyname"
											placeholder="이름 검색" required>
										<button type="submit" class="img-button">
											<img class="img"
												src="htt
									ps://png.pngtree.com/png-vector/20190501/ourlarge/pngtree-vector-search-icon-png-image_1015369.jpg">
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	${msg}
<!-- Footer -->
<%@include file="footer.jsp"%>
</body>
</html>