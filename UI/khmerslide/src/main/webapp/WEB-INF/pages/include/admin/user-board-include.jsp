<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row" ng-controller="userCount" ng-init="getAllUser()">
	<div class="col-md-3 col-sm-6">
		<div class="widget text-center">
			<div class="widget-body">
				<div class="clearfix">
					<div class="pull-left">
						<a href="javascript:;" class="widget-reload"><i
							class="ti-control-record text-muted"></i></a>
					</div>
					<div class="pull-right">
						<a href="javascript:;" class="widget-remove"><i
							class="ti-trash text-muted"></i></a>
					</div>
				</div>
				<h5 class="mb-5">ចំនួនអ្នកគ្រប់គ្រងប្រព័ន្ធ</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{UserByRoleAdmin}}
					នាក់</div>
				<div id="admin" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{PercentAdmin}}%</span>
					<i class="fa fa-user-secret text-muted"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="(AdminDateToday > AdminDateYesterday) ? 'text-success': 
							((AdminDateToday == AdminDateYesterday) ? 'text-warning':'text-danger')">
							{{AdminDateToday}} នាក់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="(AdminDateToday > AdminDateYesterday) ? 'text-success': 
							((AdminDateToday == AdminDateYesterday) ? 'text-warning':'text-danger')">
							{{AdminDateYesterday}} នាក់</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-3 col-sm-6">
		<div class="widget text-center">
			<div class="widget-body">
				<div class="clearfix">
					<div class="pull-left">
						<a href="javascript:;" class="widget-reload"><i
							class="ti-control-record text-muted"></i></a>
					</div>
					<div class="pull-right">
						<a href="javascript:;" class="widget-remove"><i
							class="ti-trash text-muted"></i></a>
					</div>
				</div>
				<h5 class="mb-5">ចំនួនអ្នកប្រើប្រាស់ជាប្រុស</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{UserByGnderM}} នាក់</div>
				<div id="male-user" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{PercentMale}}%</span>
					<i class="fa fa-male text-muted"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="(MaleDateToday > MaleDateYesterday) ? 'text-success': 
							((MaleDateToday == MaleDateYesterday) ? 'text-warning':'text-danger')">{{MaleDateToday}}
							នាក់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="(MaleDateToday < MaleDateYesterday) ? 'text-success': 
							((MaleDateToday == MaleDateYesterday) ? 'text-warning':'text-danger')">{{MaleDateYesterday}}
							នាក់</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-3 col-sm-6">
		<div class="widget text-center">
			<div class="widget-body">
				<div class="clearfix">
					<div class="pull-left">
						<a href="javascript:;" class="widget-reload"><i
							class="ti-control-record text-muted"></i></a>
					</div>
					<div class="pull-right">
						<a href="javascript:;" class="widget-remove"><i
							class="ti-trash text-muted"></i></a>
					</div>
				</div>
				<h5 class="mb-5">ចំនួនអ្នកប្រើប្រាស់ជាស្រី</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{UserByGnderF}} នាក់</div>
				<div id="female-user" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{PercentFemale}}%</span>
					<i class="fa fa-female text-muted"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="( FemaleDateToday > FemaleDateYesterday ) ? 'text-success': 
							(( FemaleDateToday == FemaleDateYesterday )? 'text-warning':'text-danger')">{{FemaleDateToday}}
							នាក់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="( FemaleDateToday < FemaleDateYesterday ) ? 'text-success': 
							(( FemaleDateToday == FemaleDateYesterday ) ? 'text-warning':'text-danger')">{{FemaleDateYesterday}}
							នាក់</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-3 col-sm-6">
		<div class="widget text-center">
			<div class="widget-body">
				<div class="clearfix">
					<div class="pull-left">
						<a href="javascript:;" class="widget-reload"><i
							class="ti-control-record text-muted"></i></a>
					</div>
					<div class="pull-right">
						<a href="javascript:;" class="widget-remove"><i
							class="ti-trash text-muted"></i></a>
					</div>
				</div>
				<h5 class="mb-5">ចំនួនអ្នកប្រើប្រាស់សរុប</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{UserByGnderM +
					UserByGnderF}} នាក់</div>
				<div id="total-user" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{100}}%</span>
					<i class="fa fa-users text-muted"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="( TotalUserDateToday > TotalUserDateYesterday ) ? 'text-success': 
							(( TotalUserDateToday == TotalUserDateYesterday ) ? 'text-warning':'text-danger')">{{
							TotalUserDateToday }} នាក់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="( TotalUserDateToday < TotalUserDateYesterday ) ? 'text-success': 
							(( TotalUserDateToday == TotalUserDateYesterday ) ? 'text-warning':'text-danger')">{{
							TotalUserDateYesterday }}​​ នាក់</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</div>