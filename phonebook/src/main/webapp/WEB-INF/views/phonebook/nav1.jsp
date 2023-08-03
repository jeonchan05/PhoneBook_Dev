<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rounded-circle{
    width: 35px;
    height:35px;
    border-radius: 50px;
} 
.mainlogo {
	width:120px;

}
.username {
float: right;
margin-right: 20px;
}
</style>
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <!-- Container wrapper -->
  <div class="container-fluid">
    <!-- Toggle button -->
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Navbar brand -->
      <a class="navbar-brand mt-2 mt-lg-0"  href="/phonebook/login/afterlogin">
        <!-- <img
          src="https://image-cdn.hypb.st/https%3A%2F%2Fkr.hypebeast.com%2Ffiles%2F2020%2F09%2FBrand-first-logo-design-02.jpg?w=1600&cbr=1&q=90&fit=max"
          height="15"
          alt="MDB Logo"
          loading="lazy"
        /> -->
       <img class = "mainlogo" src = "/images/coollogo_com-5998304.png"
       alt = "PHONEBOOK"
       />
      </a>
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/phonebook/login/add">연락처 등록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/phonebook/login/searchall">연락처 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
      </ul>
      <!-- Left links -->
    </div>
	<div class = "username">${username}님 환영합니다</div>
    <!-- Collapsible wrapper -->
    <!-- Right elements -->
    <div class="d-flex align-items-center">
      <!-- Avatar -->
      <div class="dropdown">
        <a
          class="dropdown-toggle d-flex align-items-center hidden-arrow"
          href="#"
          id="navbarDropdownMenuAvatar"
          role="button"
          data-mdb-toggle="dropdown"
          aria-expanded="false"
        >
          <img
            src="${image.imgnm}"
            class="rounded-circle"
            height="25"
            alt="프로필 사진"
            loading="lazy"
          />
        </a>
        <ul
          class="dropdown-menu dropdown-menu-end"
          aria-labelledby="navbarDropdownMenuAvatar"
        >
        <li><a class="dropdown-item">${username}</a></li>
         <li>
            <a class="dropdown-item" href="/phonebook/login/updateprofile">${username}님의 정보 수정</a>
          </li>
          <li>
            <a class="dropdown-item" href="/phonebook/removesession">로그아웃</a>
          </li>
        </ul>
      </div>
    </div>
    <!-- Right elements -->
  </div>
  <!-- Container wrapper -->
</nav>
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
</html>
