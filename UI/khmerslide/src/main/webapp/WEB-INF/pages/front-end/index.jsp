<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- including style from include/front-end/css-include.jsp -->
<jsp:include page="../include/front-end/css-include.jsp"></jsp:include>
<style>
		#upload{
		cursor: pointer;
	}
</style>
</head>
<body data-ng-app="homePage">

	<div id="loader">
		<div class="loader-container">
			<img
				src="${pageContext.request.contextPath}/resources/static/front-end/img/site.gif"
				alt="" class="loader-site">
		</div>
	</div>

	<div id="wrapper">
		<!-- including header from include/front-end/header-include.jsp -->
		<jsp:include page="../include/front-end/header-include.jsp"></jsp:include>

		<section class="slider-section">
			<div class="tp-banner-container">
				<div class="tp-banner" data-ng-controller="documentListCtrl">
					<ul style="height: 500px;">
						<li data-transition="fade" data-slotamount="1"
							data-masterspeed="500"
							data-thumb="${pageContext.request.contextPath}/resources/static/front-end/upload/yourstory-education.jpg"
							data-saveperformance="off" data-title="Slide"><img
							src="${pageContext.request.contextPath}/resources/static/front-end/upload/yourstory-education.jpg" style="height: 80%;"
							alt="fullslide1" data-bgposition="center top" data-bgfit="cover"
							data-bgrepeat="no-repeat">
							<div
								class="tp-caption slider_layer_01 text-center lft tp-resizeme"
								data-x="center" data-y="220" data-speed="1000" data-start="600"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.1"
								data-endelementdelay="0.1" data-endspeed="1000"
								style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
								<i class="fa fa-graduation-cap"></i> Khmer<strong>SLIDE</strong><br>
								<form class="search-form pull-left hidden-xs">
									<div class="form-group has-feedback mb-0">
										<input type="search"  aria-describedby="inputSearchFor" ng-keyup="$event.keyCode == 13 && searchToPage(document.DOC.DOC_TITLE)"
											placeholder="ស្វែងរក..." style="width: 500px; height: 40px;"
											class="form-control rounded" ng-model="document.DOC" data-typeahead="d as d.DOC_TITLE for d in document | filter:$viewValue | limitTo:8"><span aria-hidden="true"
											class="fa fa-search form-control-feedback"></span><span
											id="inputSearchFor" class="sr-only">(default)</span>
									</div>
								</form><br>
								
								<p style="font-size: 16px;">គេហទំព័រចែករំលែកឯកសារល្អផ្តាច់គេនៅប្រទេសកម្ពុជា</p>
								<a class="btn btn-default" href="/signup"> <i
									class="fa fa-sign-in"></i> ចូលរួមជាមួយពួកយើងឥលូវនេះ
								</a>
							</div>
<!-- 							<div class="tp-caption slider_layer_01 text-center lft tp-resizeme"
								data-x="center" data-y="220" data-speed="1000" data-start="600"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.1"
								data-endelementdelay="0.1" data-endspeed="1000"
								style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
												
							</div> -->
							<div class="tp-caption text-center lft tp-resizeme"
								data-x="center" data-y="390" data-speed="1000" data-start="800"
								data-easing="Power3.easeInOut" data-splitin="none"
								data-splitout="none" data-elementdelay="0.1"
								data-endelementdelay="0.1" data-endspeed="1000"
								style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
								
							</div></li>
					</ul>
				</div>
			</div>
		</section>

		<section class="white section nopaddingbottom card" style="padding: 40px 0;">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title text-center">
							<h4>មីនុយ</h4>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<div class="row" data-ng-controller="categoryCtrl">
					<div class="col-md-12">
						<div class="owl-featured">
							<data-owl-carousel class="owl-carousel"
								data-options="{navigation: false, pagination: true, rewindNav : false}">
							<div owl-carousel-item="" ng-repeat="i in categoryLength"
								class="item"
								ng-init="i = $parent.start; $parent.start=$parent.start+2;">
								<span ng-init="i=(i==null)?0:i"></span>
								<a href="/category/?cat={{ category[i].CAT_ID }}" title="{{ category[i].CAT_NAME }}">
									<div class="feature-list">
										<i class="{{ category[i].ICON }} alignleft"></i>
										<p>
											<a href="/category/?cat={{ category[i].CAT_ID }}" title="{{ category[i].CAT_NAME }}">
											<strong>{{ category[i].CAT_NAME }}</strong>
											</a>
										</p>
										<p>{{ category[i].DESCRIPTION }}</p>
									</div>
								</a>
								<a href="/category/?cat={{ category[i+1].CAT_ID }}" title="{{ category[i+1].CAT_NAME }}">
									<div class="feature-list">
										<i class="{{ category[i+1].ICON }} alignleft"></i>
										<p>
											<a href="/category/?cat={{ category[i+1].CAT_ID }}" title="{{ category[i+1].CAT_NAME }}">
												<strong>{{ category[i+1].CAT_NAME }}</strong>
											</a>
										</p>
										<p>{{ category[i+1].DESCRIPTION }}</p>
									</div>
								</a>
								<hr class="invis">
							</div>
							</data-owl-carousel>
						</div>
					</div>
				</div>
			</div>
			<!-- end row -->
			<br>
		</section>
	</div>
	<!-- end container -->
	<section></section>
	<!-- end section -->



	<section class="grey section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center">
						<h4>អត្ថបទចុងក្រោយ</h4>
						<p>ខាងក្រោមនេះជាអត្ថបទចុងក្រោយរបស់យើង</p>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
			<div class="row" data-ng-controller="latestDocumentCtrl">
				<data-owl-carousel-latest-doc class="owl-carousel"
					data-options="{navigation: false, pagination: true, rewindNav : false}">
				<div owl-carousel-latest-document="" ng-repeat="ld in latestDocument"
					class="item">
					<a href="/view/?doc={{ ld.DOC_ID }}&cat={{ ld.CATEGORY.CAT_ID }}" title="{{ld.DOC_TITLE}}"><div class="shop-item-list entry"
						style="margin-right: 10px; margin-left: 10px;">
						<div class="">
							<img
								src="{{ thumb }}{{ ld.THUMBNAIL }}"
								alt="">
							<div class="magnifier"></div>
						</div>
						<div class="shop-item-title clearfix">
							<h4 class="text-center" id="subStr">
								<a href="/view/?doc={{ ld.DOC_ID }}&cat={{ ld.CATEGORY.CAT_ID }}" title="{{ld.DOC_TITLE}}">{{ ld.DOC_TITLE }}</a>
							</h4>
							<div class="shopmeta">
								<span class="pull-left">ចូលអាន: {{ ld.VIEWED }} ដង</span>
								<div class="pull-right">
									<span class="pull-left">ពេញចិត្ត: {{ ld.LIKED }} <i
										class="fa fa-thumbs-o-up fa-lg text-primary"></i></span>
								</div>
							</div>
						</div>
						<div class="visible-buttons">
							<a href="/view/?doc={{ ld.DOC_ID }}&cat={{ ld.CATEGORY.CAT_ID }}"><span class="fa fa-eye" title="ចូលមើលអត្ថបទនេះ"></span></a>
							<a href="#"><span class="fa fa-share"
								title="ចែករំលែកបន្តនូវអត្ថបទមួយនេះ"></span></a>
						</div>
					</div></a>
					<hr class="invis">
				</div>
				</data-owl-carousel-latest-doc>
			</div>
			<!-- end latest topics -->
<br>

			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center">
						<h4>អត្ថបទពេញនិយម</h4>
						<p>ខាងក្រោមនេះជាអត្ថបទពេញនិយមរបស់យើង</p>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->

			<div class="row" data-ng-controller="documentCtrl">
				<data-owl-carousel-doc class="owl-carousel"
					data-options="{navigation: false, pagination: true, rewindNav : false}">
				<div owl-carousel-document="" ng-repeat="d in popularDocument"
					class="item">
					<a type="button" href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}" title="{{d.DOC_TITLE}}" data-ng-click="submit()">
					<div class="shop-item-list entry"
						style="margin-right: 10px; margin-left: 10px;">
						<div class="">
							<img
								src="{{ thumb }}{{ d.THUMBNAIL }}"
								alt="">
							<div class="magnifier"></div>
						</div>
						<div class="shop-item-title clearfix">
							<h4 class="text-center" id="subStr">
								<a href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}" title="{{d.DOC_TITLE}}" data-ng-click="submit()">{{ d.DOC_TITLE }}</a>
							</h4>
							<div class="shopmeta">
								<span class="pull-left" data-ng-model="view">ចូលអាន: {{ d.VIEWED }} ដង</span>
								<div class="pull-right">
									<span class="pull-left">ពេញចិត្ត: {{ d.LIKED }} <i
										class="fa fa-thumbs-o-up fa-lg text-primary"></i></span>
								</div>
							</div>
						</div>
						<div class="visible-buttons">
							<a type="button" href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}" data-ng-click="submit()"><span class="fa fa-eye" title="ចូលមើលអត្ថបទនេះ"></span></a>
							<a href="#"><span class="fa fa-share"
								title="ចែករំលែកបន្តនូវអត្ថបទមួយនេះ"></span></a>
						</div>
					</div>
					</a>
					<hr class="invis">
				</div>
				</data-owl-carousel-doc>
			</div>
			<!-- end popular topics -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->
	<!-- including footer from include/front-end/footer-include.jsp -->
	<jsp:include page="../include/front-end/footer-include.jsp"></jsp:include>


	<section class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-6 text-left">
					<p>
						© 2016 KhmerSLIDE. by <a href="index9.html#">Team 3 Siem Reap</a>
					</p>
				</div>
				<!-- end col -->
				<div class="col-md-6 text-right">
					<ul class="list-inline">
						<li><a href="index9.html#">Terms of Usage</a></li>
						<li><a href="index9.html#">Privacy Policy</a></li>
						<li><a href="index9.html#">Sitemap</a></li>

					</ul>
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->
	<div></div>
	<!-- end wrapper -->
	<!-- Upload Modal -->
			<jsp:include
						page="../include/front-end/modal/upload.jsp"></jsp:include>
	<!-- including js from include/front-end/js-include.jsp -->
	<jsp:include page="../include/front-end/js-include.jsp"></jsp:include>

</body>
</html>