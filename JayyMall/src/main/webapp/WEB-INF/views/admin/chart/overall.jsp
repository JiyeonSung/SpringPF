<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/plugin_js.jsp"%>
<%@include file="/WEB-INF/views/include/header2.jsp"%>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/js/admin/order_list.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 예시 차트 -->
<script type="text/javascript">

	// 1차 카테고리 파이차트
	google.charts.load('current', {'packages':['corechart']});
	
	google.charts.setOnLoadCallback(draw_prime_chart);
	
	function draw_prime_chart(){
		
		var data = google.visualization.arrayToDataTable(${str_p});
		
		//var options = {title: '1차 카테고리별 매출 현황'}
		
		var chart = new google.visualization.PieChart(document.getElementById('prime_chart'));
		
		chart.draw(data);
	}
	
	// 2차 카테고리 파이차트 
     google.charts.setOnLoadCallback(draw_second_chart);
     
     function draw_second_chart() {
    	 var data = google.visualization.arrayToDataTable(${str_s});
     
    	 var chart = new google.visualization.PieChart(document.getElementById('second_chart'));
    	 
    	 chart.draw(data);
     }
     
     // 연도별 바 차트(히스토그램)
     google.charts.setOnLoadCallback(draw_yearly_chart);
     
     function draw_yearly_chart(){
    	 var data = google.visualization.arrayToDataTable(${str_y});
    	 
    	 var chart = new google.visualization.ColumnChart(document.getElementById('yearly_sales'));
    	 
    	 chart.draw(data);
     }
     
   
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
					Admin Page <small>Order Chart</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 주문 관리</a></li>
					<li class="active">주문 통계</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="col-sm-10">	
				<div class="box" style="border: none;">
					<div class="box-body">
					<div class="col-sm-12">
						<table class="table table-striped text-center" id="dateTable">
							<tr>
								<td style="float:right;font-weight:bold;margin: 8px 20px;font-size:16px;text-align:right;">
									<a href="/admin/chart/monthlyOrder" style="color:blue;">
										월별 차트 보러가기 >>
									</a><br>
									<a href="/admin/order/orderStat" style="color:red;">
										월별 매출 통계표 보러가기 >>
									</a>
								</td>
							</tr>
						</table>
					</div>
					<br>
						<div class="col-xs-6">
							<div style="color:green;"><b>&#9660; 1차 카테고리별 매출통계</div>
							<!-- 파이차트 -->
							<div id="prime_chart" style="width:600px;height:333px;"></div>
							
							
							<!-- 예시 차트 
							<div id="piechart" style="width: 900px; height: 500px;"></div>
							-->
							
						</div>
						<div class="col-xs-6">
							<div style="color:green;"><b>&#9660; 2차 카테고리별 매출통계</div>
							<!-- 파이차트 -->
							<div id="second_chart" style="width:600px;height:333px;"></div>
							
							
						</div>

						<div class="col-xs-12">
							<div style="color:green;"><b>&#9660; 연도별 매출통계</div>
							<!-- 컬럼차트(vertical bar) -->
     						<div id="yearly_sales" style="width:100%;height:500px;"></div>
						</div>
					</div>
				</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>

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