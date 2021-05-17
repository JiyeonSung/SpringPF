<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<head>
<script type="text/javascript">
$(function(){
	// 날짜 검색 버튼
		/* 
		// ajax 시도
	$("#btnSearch").click(function(){

		var form = $("#dateForm");
		
		if($("#year").val() != thisYear) {
			var year = $("#year").val();
		}
		if($("#month").val() != thisMonth){
			var month = $("#month").val():
		}
		form.submit();
		
		
		
		var year = $("#year").val();
		var month = $("#month").val();
		
		$.ajax({
			type	: "post",
			url		: "/admin/order/statByDate",
			dataType: "Date",
			date	: {year:year, month:month},
			success	: function(data){
				alert(year + "-" + month);
				self.location="/admin/order/orderStat";
			}
		});
	});
		*/
	
});
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header -->
		<%@include file="/WEB-INF/views/include/main_header_admin.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="/WEB-INF/views/include/left_admin.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Order Stat <small>주문통계</small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="/admin/menu"><i class="fa fa-dashboard"></i> Admin</a>
					</li>
					<li>
						Order
					</li>
					<li>
						Stat
					</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid">
				<div class="col-sm-10">	
				<div class="box" style="border: none;">
					<div class="box-body">
						<div style="color:green;"><b>&#9660; 매출통계</b> &nbsp; <small>월별 주문,입금,배송을 조회합니다.</small></div>
						<!-- 기간설정 -->
						<div class="col-sm-12">
						<form id="dateForm" action="/admin/order/statByDate" method="post">
							<table class="table table-striped text-center" id="dateTable">
								<tr>
									<td class="col-sm-1" style="font-weight:bold;padding-top:15px;">기간설정</td>
									<td style="float:left;">
										<jsp:useBean id="selectDate" class="java.util.Date" />
										<!-- 현재 연도 뽑아오기 - 현재 연도까지 dropdown에 표시해야 하므로 정보 필요 -->
										<fmt:formatDate value="${selectDate}" pattern="yyyy-MM-dd" var="selectDateStr"/>
										<fmt:parseNumber value="${selectDateStr.toString().substring(0,4)}" type="NUMBER" var="thisYear" />
										<!-- 선택 창 -->
										<select class="form-control" id="year" name="year" style="width: 110px; display: inline-block; float:left; margin-right:3px;">
											<c:forEach begin="2018" end="${thisYear}" var="i">
												<!--  옵션 조건의 year와 month는 컨트롤러 모델로 넘어온 값 -->
											 	<option value="${i}" <c:out value="${i == year ? 'selected' : '' }" />>${i}</option>
											 
											</c:forEach>
										</select>
										<select class="form-control" id="month" name="month" style="width: 70px; display: inline-block; float:left;">
											<c:forEach begin="1" end="12" var="i">
													<option value="${i}" <c:out value="${i == month ? 'selected' : '' }" />>${i}</option>
											</c:forEach>
										</select>
										<button type="submit" id="btnSearch" class="btn btn-default" style="float:left;margin-left:5px;">검색</button>
									</td>
									<td>
										<a href="/admin/chart/monthlyOrder" style="float:right;font-weight:bold;margin: 8px 20px;font-size:16px;color:blue;">
											월별 차트 보러가기 >>
										</a>
									</td>
								</tr>
							</table>
						</form>
						</div>
						
						<!-- 주문통계 테이블 -->
						<table class="table table-striped text-center" id="stat">
							<tr>
								<th class="col-md-2">일별통계</th>
								<th class="col-md-1">주문건수</th>
								<th class="col-md-2">주문금액</th>
								<th class="col-md-1">결제건수</th>
								<th class="col-md-1">결제금액</th>
								<th class="col-md-1">발송건수</th>
								<th class="col-md-1">배송건수</th>
								<th class="col-md-1">매입금액</th>
								<th class="col-md-2">순매출액</th>
							</tr>
						  
						  <c:if test="${empty stat }">
								<tr>
									<td colspan="9" style="font-size:15px;">
										<br>
										해당 날짜의 주문 건이 존재하지 않습니다.
										<br><br>
									</td>		  
						  		</tr>
						  </c:if>
						  
						  <c:if test="${!empty stat }">
						  <c:forEach items="${stat }" var="stat" varStatus="i" >
						  	<c:set var="total_count" value="${total_count + stat.order_count }" />
						  	<c:set var="total_sales" value="${total_sales + stat.total_sales }" />
						  	<c:set var="total_shipped" value="${total_shipped + stat.shipped }" />
						  	<c:set var="total_delivered" value="${total_delivered + stat.delivered }" />
						  	  <tr>
								<td>${stat.order_date }(${stat.day.substring(0,1)})</td>
								<td>${stat.order_count }</td>
								<td style="font-weight:bold;color:brown;"><fmt:formatNumber value="${stat.total_sales }" pattern="###,###,###,###" />원 </td>
								<td>0</td>
								<td>0</td>
								<td>${stat.shipped }</td>
								<td>${stat.delivered }</td>
								<td>0</td>
								<td style="font-weight:bold;">0</td>
							</tr>

						  </c:forEach>
							  <tr style="font-weight:bold; font-size:16px;">
							  	<td>합계</td>
							  	<td>${total_count }</td>
							  	<td class="col-md-2" style="color:red;"><fmt:formatNumber value="${total_sales }" pattern="###,###,###,###" />원 </td>
							  	<td>0</td>
							  	<td>0</td>
							  	<td>${total_shipped }</td>
							  	<td>${total_delivered }</td>
							  	<td>0</td>
							  	<td>0</td>
							  </tr>
						  </c:if>
						</table>
					</div>
				</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp" %>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

</body>
</html>