<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<!-- Offcanvas Menu Begin -->
<%@ include file="/WEB-INF/views/common/offcanvas.jsp" %>
<!-- Offcanvas Menu End -->
<%@include file="/WEB-INF/views/include/header.jsp"%>

<head>
<script type="text/javascript" src="/resources/js/member/changePw.js"></script>

<meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JayyMall | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <%@ include file="/WEB-INF/views/common/bootcss.jsp" %>
    
</head>
<body>
	<div class="wrapper">
		<!-- Main Header -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					비밀번호 변경
				</h1>
				<%-- realPath 주석 
				<%= application.getRealPath("/") %>
				--%>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> 회원 정보 관리</a>
					</li>
					<li>비밀번호 변경</li>
				</ol>
			</section>

			
			<%-- MAIN CONTENT --%> 
			<section class="content container-fluid">
				<div style="background-color: white; width:80%; padding: 5% 5%;">
					<form id="changePwForm" method="post" action="/member/changePw">
						<div class="form-group">
							<input type= "hidden" name="mem_id" value="${sessionScope.user.mem_id}" />
							<input type="password" class="form-control" id="mem_pw" class="form-control"
								placeholder="현재 비밀번호를 입력해주세요" style="max-width: 630px;">
							<input type="password" class="form-control" id="mem_pw_change" name="mem_pw" class="form-control"
								placeholder="변경할 비밀번호를 입력해주세요" style="max-width: 630px; margin: 7px 0px;">
							<input type="password" class="form-control" id="mem_pw_check" class="form-control"
								placeholder="변경할 비밀번호를 다시 입력해주세요" style="max-width: 630px;">
						</div>
						<div class="form-group">
							<input type="button" id="btn_submit" class="btn btn-primary" value="확인">
						</div>
					</form>
				</div>
			</section>
			<!-- /.content -->
		</div>
	</div>

	<!-- Footer Section Begin -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <%@ include file="/WEB-INF/views/common/search.jsp" %>
    <!-- Search End -->

<!-- Js Plugins -->
<script src="/resources/js/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/js/bootstrap.min.js"></script>
<script src="/resources/js/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/js/jquery.nicescroll.min.js"></script>
<script src="/resources/js/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/js/jquery.countdown.min.js"></script>
<script src="/resources/js/js/jquery.slicknav.js"></script>
<script src="/resources/js/js/mixitup.min.js"></script>
<script src="/resources/js/js/owl.carousel.min.js"></script>
<script src="/resources/js/js/main.js"></script>

</body>
</html>