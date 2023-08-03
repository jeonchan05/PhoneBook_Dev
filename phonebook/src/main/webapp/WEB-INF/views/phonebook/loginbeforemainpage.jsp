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
.btn.blue {
	box-shadow: 0px 4px #74a3b0;
}

.btn.blue:active {
	box-shadow: 0 0 #74a3b0;
	background-color: #709CA8;
}

.btn.cyan {
	box-shadow: 0px 4px 0px #73B9C9;
}

.btn.cyan:active {
	box-shadow: 0 0 #73B9C9;
	background-color: #70B4C4;
}
.mainlogo {
	width:120px;

}
</style>
</head>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<!-- Container wrapper -->
	<div class="container-fluid">
		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Navbar brand -->
			<a class="navbar-brand mt-2 mt-lg-0" href="/phonebook/beforelogin">
				<img class ="mainlogo"
				src="/images/coollogo_com-5998304.png" alt="PHONEBOOK"/>
			</a>
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="">연락처 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="">연락처 목록</a></li>
			</ul>
			<!-- Left links -->
		</div>
		<!-- Collapsible wrapper -->

		<!-- Right elements -->
		<span> <a href="/phonebook/signin" class="btn blue">로그인</a> <a
			href="/phonebook/signup" class="btn cyan">회원가입</a>
		</span>


		<!-- Right elements -->
	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->
<body>
<div
    class="p-5 text-center bg-image"
    style="
      background-image: url('/images/main.jpeg');
      height: 750px;
    "
  >
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
      <div class="d-flex justify-content-center align-items-center h-100">
        <div class="text-white">
          <h1 class="mb-3">이용하시려면 로그인을 해주세요</h1>
          <a class="btn btn-outline-light btn-lg" href="/phonebook/signin" role="button"
          >로그인하기</a
          >
        </div>
      </div>
    </div>
  </div>

</body>
<!-- Footer -->
<%@include file ="footer.jsp" %>
<!-- Footer -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
<script type="text/javascript">
	$('a').click(function(event) {
		event.preventDefault();
	});
</script>
</html>