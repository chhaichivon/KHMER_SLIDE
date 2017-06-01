<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row" ng-controller="documentCount" ng-init="getAllDoc()">
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
				<h5 class="mb-5">ចំនួន Slide</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{DocS}} ច្បាប់ </div>
				<div id="esp-comment" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{DocPS}}%</span>
					<i class="fa fa-file-powerpoint-o text-muted"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="(DocTD_S > DocTY_S) ? 'text-success': 
							(( DocTD_S == DocTY_S ) ? 'text-warning':'text-danger')">
							{{DocTD_S}} ច្បាប់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="( DocTD_S < DocTY_S ) ? 'text-success': 
							(( DocTD_S == DocTY_S ) ? 'text-warning':'text-danger')">
							{{DocTY_S}} ច្បាប់</div>
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
				<h5 class="mb-5">ចំនួន Ms-Word</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{DocW}} ច្បាប់</div>
				<div id="esp-photo" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{DocPW}}%</span>
					<i class="fa fa-file-word-o text-muted"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="(DocTD_W > DocTY_W) ? 'text-success': 
							(( DocTD_W == DocTY_W ) ? 'text-warning':'text-danger')">
							{{DocTD_W}} ច្បាប់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="(DocTD_S < DocTY_S) ? 'text-success': 
							(( DocTD_S == DocTY_S ) ? 'text-warning':'text-danger')">
							{{DocTY_S}} ច្បាប់</div>
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
				<h5 class="mb-5">ចំនួន Ebooks</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{DocP}} ច្បាប់</div>
				<div id="esp-feedback" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{DocPP}}%</span>
					<i class="fa fa-file-pdf-o text-muted"></i>
				</div>
			<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="(DocTD_P > DocTY_P) ? 'text-success': 
							(( DocTD_P == DocTY_P ) ? 'text-warning':'text-danger')">
							{{DocTD_P}} ច្បាប់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="(DocTD_P < DocTY_P) ? 'text-success': 
							(( DocTD_P == DocTY_P ) ? 'text-warning':'text-danger')">
							{{DocTY_P}} ច្បាប់</div>
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
				<h5 class="mb-5">ចំនួនឯកសារសរុប</h5>
				<div class="fs-36 fw-600 mb-20 counter">{{DocA}} ច្បាប់</div>
				<div id="total-doc" data-percent="100"
					style="height: 140px; width: 140px; line-height: 120px; padding: 10px;"
					class="easy-pie-chart fs-36">
					<span style="font-size: 21px !important; color: #aaaaaa;">{{DocPP}}%</span>
					<i class="ti-bookmark-alt"></i>
				</div>
				<div class="clearfix mt-20">
					<div class="pull-left">
						<div class="fs-12">ថ្ងៃនេះ</div>
						<div class="text-center"
							ng-class="(DocTD_A > DocTY_A) ? 'text-success': 
							(( DocTD_A == DocTY_A ) ? 'text-warning':'text-danger' )">
							{{DocTD_A}} ច្បាប់</div>
					</div>
					<div class="pull-right">
						<div class="fs-12">ថ្ងៃម្សិលមិញ</div>
						<div class="text-center"
							ng-class="(DocTD_A < DocTY_A) ? 'text-success': 
							(( DocTD_A == DocTY_A ) ? 'text-warning' : 'text-danger' )">
							{{DocTY_A}} ច្បាប់</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>