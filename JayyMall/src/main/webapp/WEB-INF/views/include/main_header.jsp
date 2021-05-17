<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
.bgGradient{
	background: linear-gradient(90deg, #2BC0E4,  #EAECC6) fixed;
}
#modify_dropdown {  
	display:none; /* 평상시에는 서브메뉴가 안보이게 하기 */ 
	height:auto; 
	padding:10px 0px; 
	margin:0px; 
	border:0px; 
	position:absolute; 
	width:130px; 
	z-index:200; 
}

#modify:hover #modify_dropdown{
	display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

</style>


<header class="main-header">
	<!-- Logo -->
	<a href="/" class="logo" style="background-color: #2BC0E4" >
			<span class="logo-mini"></span> <!-- logo for regular state and mobile devices --> 
		<span class="logo-lg">
			<b>SSO</b>MALL
		</span>
	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top bgGradient" role="navigation"  >
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
			
				<!-- User Account Menu -->
				<%-- 로그인 안 한 상태 --%>
				<c:if test="${sessionScope.user == null}">
					<li class="dropdown user user-menu">
						<!-- Menu Toggle Button -->
						<a href="/member/join"> <!-- class="dropdown-toggle" data-toggle="dropdown" --> 
							<span class="hidden-xs">회원가입</span>
						</a>
					</li>
					<li class="dropdown user user-menu">
						<a href="/member/login"> 
							<span class="hidden-xs">로그인</span>
						</a>
					</li>
				</c:if>
				
				<%-- 로그인 한 상태 --%>
				<c:if test="${sessionScope.user != null}"> 
					<li class="dropdown user user-menu"> 
						<p class="hidden-xs" style="color:white; margin-top:14px;">
							최근 접속 시간: 
							<fmt:formatDate value="${sessionScope.user.mem_date_last}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</p>
					</li>
					<li class="dropdown user user-menu"> 
						<p class="hidden-xs" style="color:white; margin-top:14px; margin-left:15px; margin-right:15px;">
							${sessionScope.user.mem_name}님
						</p>
					</li>
					<li class="dropdown user user-menu">
						<a href="/member/logout"> 
							<span class="hidden-xs">로그아웃</span>
						</a>
					</li>
					<li class="dropdown user user-menu" id="modify">
						<a href="#">
							<span>회원정보 관리</span>
						</a>
						<ul class="dropdown-menu" id= "modify_dropdown">
							<li><a href="/member/checkPw?url=modify">회원정보 수정</a></li>
							<li><a href="/member/checkPw?url=changePw">비밀번호 변경</a></li>
							<li><a href="/member/checkPw?url=delete">회원 탈퇴</a></li>
						</ul>
					</li>	
					<li class="dropdown user user-menu">
						<a href="/cart/list"> 
							<span class="hidden-xs">장바구니</span>
						</a>
					</li>		
					<li class="dropdown user user-menu">
						<a href="/order/list">
							<span class="hidden-xs">주문조회</span>
						</a>
					</li>		
				</c:if>
				
				<!-- Control Sidebar Toggle Button -->
				<li>
					<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
				</li>
			</ul>
		</div>
	</nav>
</header>