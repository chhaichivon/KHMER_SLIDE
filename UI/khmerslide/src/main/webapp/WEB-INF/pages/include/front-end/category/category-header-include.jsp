<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<%@page import="org.khmerslide.entities.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>

<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.id" var="logId"/>
</sec:authorize>
<header class="header">
	<div class="container">
		<div class="hovermenu ttmenu">
			<div class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="fa fa-bars"></span>
					</button>
					<div class="logo">
						<a class="navbar-brand" href="/index.ks"><img style="height: 30px;"
							src="${pageContext.request.contextPath}/resources/static/front-end/img/Khmer-slide-with-logo.png"
							alt=""></a>
					</div>
				</div>

				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/index.ks"><i class="fa fa-home"></i>ទំព័រដើម</a></li>
						<li><a href="/aboutus"><i class="fa fa-info-circle"></i> អំពីយើង</a></li>
						<li><a href="/contactus"><i class="fa fa-mobile"></i> ទំនាក់ទំនង</a></li>
					<!-- 	<li><a href="/login"><i class="fa fa-sign-in"></i> គណនី</a></li> -->
												<li id="login"><a href="/login"><i class="fa fa-sign-in"></i> គណនី</a></li>
						<li id="logout"><a href="/logout"><i class="fa fa-sign-out"></i> ចាកចេញ</a></li>
						<li id="profile">
					
					<div class="media avatar" style="padding-bottom:10px;padding-left:50px;" ng-controller="sessoinCtrl">
					<div ng-if="role=='1'">
								<a href="/admin/index"><img
									src="{{urls}}{{photo}}"
									alt="" class="media-object img-circle" style="width: 40px; height:40px;"><span
									class="status bg-success"></span></a>
							</div>
							<div ng-if="role=='2'">
								<a href="/user/index"><img
									src="{{urls}}{{photo}}"
									alt="" class="media-object img-circle" style="width: 40px; height:40px;"><span
									class="status bg-success"></span></a>
							</div>
					</div>	
						</li>
					</ul>
					<!-- end nav navbar-nav -->
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- end navbar navbar-default clearfix -->
		</div>
		<!-- end menu 1 -->
	</div>
	<!-- end container -->
</header>
<!-- end header -->

<section class="page-section -theme-themeforest"
	data-view="parallaxBackground" data-ng-controller="documentByCatCtrl">
	<div class="page-section__content">
		<div class="grid-container"​>
			<div class="h-text-align-center"​​​​​​ data-ng-controller="catCtrl">
				<h2 class="t-heading -size-xxl -color-light is-hidden-phone">
					{{ count }} អត្ថបទមាននៅក្នុង: {{ txtMainCategory  }}</h2>

				<h2
					class="t-heading -size-l -color-light is-hidden-tablet-and-above">
					{{ txtMainCategory  }}: {{ count }} អត្ថបទ</h2>

				<h3
					class="t-heading -size-s -color-light -weight-normal h-mb3 is-hidden-phone">
					អាចស្វែងរកគ្រប់អត្ថបទទាំងអស់ដែលផ្អែកលើទិន្នន័យរបស់មីនុយមួយនេះ</h3>
				<h3
					class="t-heading -size-s -color-light -weight-normal h-mb2 is-hidden-tablet-and-above">
					អាចស្វែងរកអត្ថបទទាំងអស់ដែលផ្អែកលើទិន្នន័យ</h3>
				<div class="home-search__search">
					<input type="hidden" id="keyword" value="${param.term}"/>
					<form accept-charset="UTF-8" action="#" autocomplete="off"
						class="search-field -size-xl -border-none" id="search"
						method="get">
						<!-- <div style="margin: 0; padding: 0; display: inline">
							<input name="utf8" type="hidden" value="✓">
						</div> -->

						<div class="search-field__input">
							<input class="js-term search-field__input-field" name="term" 
								placeholder="ឧទាហរណ៍: ភាសាខ្មែរ" type="search" ng-model="document.DOC" data-typeahead="d as d.DOC_TITLE for d in document | filter:$viewValue | limitTo:8">
						</div>

						<button class="search-field__button" type="submit">
							<i class="e-icon -icon-search"><span class="e-icon__alt">Search</span></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="js- page-section__background"
		style="transform: translate3d(0px, 142px, 0px);"></div>
</section>

<div class="card">
<section class="white section nopaddingbottom card-block">
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
						<span ng-init="i=(i==null)?0:i"></span> <a
							href="/category/?cat={{ category[i].CAT_ID }}"
							title="{{ category[i].CAT_NAME }}">
							<div class="feature-list">
								<i class="{{ category[i].ICON }} alignleft"></i>
								<p>
									<a href="/category/?cat={{ category[i].CAT_ID }}"
										title="{{ category[i].CAT_NAME }}"> <strong>{{
											category[i].CAT_NAME }}</strong>
									</a>
								</p>
								<p>{{ category[i].DESCRIPTION }}</p>
							</div>
						</a> <a href="/category/?cat={{ category[i+1].CAT_ID }}"
							title="{{ category[i+1].CAT_NAME }}">
							<div class="feature-list">
								<i class="{{ category[i+1].ICON }} alignleft"></i>
								<p>
									<a href="/category/?cat={{ category[i+1].CAT_ID }}"
										title="{{ category[i+1].CAT_NAME }}"> <strong>{{
											category[i+1].CAT_NAME }}</strong>
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
		<!-- end row -->
		<br>
	</div>
	<!-- end container -->
</section>
</div>
<!-- end section -->


<script type="text/javascript">
      	var logId = '${logId}';

      	
      </script>
