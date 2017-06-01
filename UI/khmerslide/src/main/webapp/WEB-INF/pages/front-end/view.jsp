<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- including style from include/front-end/css-include.jsp -->
<jsp:include page="../include/front-end/css-include.jsp"></jsp:include>
<style>
	.section{
		padding: 40px 0;
	}
	#upload, #list{
		cursor: pointer;
	}
	.fb_iframe_widget{
		padding-bottom: 5px;
	}
</style>
</head>
<body ng-app="homePage">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
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

		<div class="grey section" ng-controller="viewCtrl">
								
			<div class="container">
				<div class="row">
					<div id="course-content" class="col-md-8">
						<div class="course-description">
							<div class="blog-image card">
								<div
									class='embed-responsive embed-responsive-4by3'>
									<iframe
										data-ng-src="{{ urls }}"
										frameborder="0"
										allowfullscreen="true" mozallowfullscreen="true" 
										webkitallowfullscreen="true" allowprint="true"></iframe>
										<!-- <iframe src="https://drive.google.com/file/d/0B2WJOSpqcAkyLW1wWFBuNm1FNTA/preview"></iframe> -->
								</div>
							</div>
							<!-- end blog-image -->
							<input type="hidden" value="${param.doc}" id="doc-id">
							<input type="hidden" value="${param.sub}" id="sub-id">
							<div class="card" style="padding: 15px;">
								<h3 class="course-title" data-ng-bind="txtTitle"></h3>
								<div class="row">
									<div class="col-md-6">
										<div class="media">
											<div class="media-left">
												<a href="#"> <img class="media-object"
													src="{{thumb}}{{ uploaderPhoto }}"
													alt="Generic placeholder image">
												</a>
											</div>
	
											<div class="media-body">
												<h4 class="media-heading">អត្ថបទដោយ: {{ uploadBy }}</h4>
												<div class="rating">
													<h5>កាលបរិច្ឆេទបញ្ចូល: {{ date }}</h5>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 text-right">
										<span><strong class="ng-binding"><i
												class="fa fa-eye"></i> {{ view }}&nbsp;បានអាន</strong></span>
												<hr>
										<span><i id="like"
											class="fa fa-thumbs-o-up fa-2x"
											style="padding: 0px 10px; color: #333333; cursor: pointer;"
											ng-click="updateLike()" title="ពេញចិត្ត"></i><strong> ចំនួន​ &nbsp;<b
												style="color: #e34b11;">{{ like }}</b></strong> ពេញចិត្ត</span> |
										<!-- <span>
										<a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fkhmerslide.org%2F&amp;src=sdkpreparse"><i class="fa fa-share-alt-square fa-2x"  id="share_button"
											style="padding: 0px 10px; color: #333333; cursor: pointer;"
											onclick="#" title="ចែកចាយបន្ត" data-href="http://khmerslide.org">
										</i></a> ចំនួន <strong><b
												style="color: #e34b11;">{{ share }}</b></strong> ចែកចាយបន្ត</span> -->
											<span>
												<div id="share" class="fb-share-button" data-href="http://khmerslide.org/view/?doc=${param.doc}&cat=${param.cat}" data-layout="button_count" data-size="small" data-mobile-iframe="true">
													<a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fkhmerslide.org%2F&amp;src=sdkpreparse">
														Share
													</a>
												</div>
											</span>
										<div class="btn-group">
	
											<button type="button" id="btnSaveList" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												<i class="fa  fa-plus"></i> រក្សាទុក
											</button>
	
											<ul class="dropdown-menu" role="menu"
												style="max-height: 400px; overflow: auto; padding: 15px">
												<li><a>បញ្ជីរក្សាឯកសាររបស់អ្នក:</a></li>
												<li class="divider"></li>
												<li data-ng-repeat="sl in savelist" ng-click="saveDoc(sl.SL_ID)" id="list">{{ $index + 1 }}. {{sl.SL_NAME}}</li>
												<!-- <div id="#"></div> -->
												<li class="divider"></li>
												<li><button data-toggle="modal" data-target=".modalCreateSaveList" type="button" class="btn btn-default"><i class="fa fa-plus"></i>
														បង្កើតបញ្ជីរក្សាឯកសារ</button></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<hr class="invis">
							<div class="card" style="padding: 15px;">
								<h4><strong>ពត៌មានបន្ថែម:</strong></h4>
								<p style="text-indent: 50px;">{{ description }}</p>
							</div>
						</div>
						<!-- end desc -->
						<hr class="invis">
						
						<div class="card" style="padding: 15px;">
							<div id="reviews" class="feedbacks">
								<p>
									<a class="btn btn-default btn-block" role="button"
										data-toggle="collapse"
										href="page-shop-single.html#collapseExample"
										aria-expanded="false" aria-controls="collapseExample">
										មតិយោបល់របស់អ្នកប្រើប្រាស់?</a>
								</p>
								<div class="collapse" id="collapseExample" ng-controller="commentCtrl">
									<div class="well">
										<div class="media" ng-controller="sessoinCtrl">
											<div class="media-left">
												<img
													class="media-object"
													src="{{ urls }}{{ photo }}"
													alt="Generic placeholder image">
											</div>
											<div class="media-body">
												<h4 class="media-heading">{{ txtName }}</h4>
												<div class="form-group">
													<textarea id="txtComment" name="txtComment" ng-model="txtComment"
														class="form-control" placeholder="បញ្ចេញយោបល់..." data-ng-keypress="($event.which === 13)?insertComment():0"></textarea>
												</div>
											</div>
										</div>
										<div class="media" data-ng-repeat="com in comment">
											<div class="media-left">
												<a href="page-shop-single.html#"> <img
													class="media-object"
													src="{{ thumb }}{{ com.USER.PHOTO }}"
													alt="Generic placeholder image">
												</a>
											</div>
											<div class="media-body">
												<h4 class="media-heading">{{ com.USER.USER_NAME }}</h4>
												<div class="rating">
													<h5>{{ com.CMT_TEXT }}</h5>
													<p style="text-size: 5px">កាលបរិច្ឆេទបញ្ចូល: {{ com.CMT_DATE }}</p>
												</div>
												<!-- end rating -->
												
											</div>
										</div>
										<!-- end media -->
									</div>
									<!-- end well -->
								</div>
								<!-- end collapse -->
							</div>
						</div>
						<!-- end reviews -->
					</div>
					<!-- end col -->

					<div id="course-left-sidebar" class="col-md-4 card" style="padding: 15px;">
						<div class="widget">
							<!-- <div class="widget-title"> -->
							<h4 style="margin-top: 0px; line-height: 0.8 !important;">អត្ថបទស្រដៀង:</h4>
							<!-- </div> -->
							<div class="course-table">
								<table class="table" id="doc-table">
									<thead>
									</thead>
									<tbody>
										<tr data-ng-repeat="r in recom" data-ng-if="r.CATEGORY.CAT_ID != '${param.doc}'">
											<td>
												<div class="media-left">
													<a href="/view/?doc={{ r.DOC_ID }}&cat={{ r.CATEGORY.CAT_ID }}" title="{{r.DOC_TITLE}}"> <img
														src="{{ thumb }}{{ r.THUMBNAIL }}"
														alt="" class="media-object" width="150" height="100">
													</a>
												</div>
												<div class="media-body">
													<h5 class="media-heading" id="subStr">
														{{ r.DOC_TITLE }}
													<button class="btn btn-outline btn-rounded btn-default"
														data-ng-if="r.TYPE == '1'">
														<i class="fa fa-file-powerpoint-o text-white"></i>
													</button>
													<button class="btn btn-outline btn-rounded btn-default"
														data-ng-if="r.TYPE == '2'">
														<i class="fa fa-file-pdf-o text-white"></i>
													</button>
													<button class="btn btn-outline btn-rounded btn-default"
														data-ng-if="r.TYPE == '3'"">
														<i class="fa fa-file-word-o text-white"></i>
													</button>
													</h5>
													<p class="text-muted mb-0">បញ្ចូលដោយ: {{ r.USER.USER_NAME }}</p>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						
							<hr class="invis">

							<div id="reviews" class="feedbacks">
								<p>
									<button type="button" class="btn btn-default btn-block" role="button" ng-init="number=5" ng-click="recommend(number)" id="limit"><i
										class="fa fa-refresh"></i> ទាញបន្ថែម</button>
								</p>
							</div>
						</div>
					</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- SaveList Modal -->
			<jsp:include
						page="../include/front-end/modal/create-save-list.jsp"></jsp:include>
			<!-- Upload Modal -->
			<jsp:include
						page="../include/front-end/modal/upload.jsp"></jsp:include>
		</div>
	
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
	
	<!-- java script share facebook -->
			<script>
/* 				(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) return;
						  js = d.createElement(s); js.id = id;
						  js.src = "//connect.facebook.net/km_KH/sdk.js#xfbml=1&version=v2.7&appId=776306919082812";
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk')); */
			</script>
			<script type="text/javascript">
/* 			$(document).ready(function(){
				$('#share_button').click(function(e){
					e.preventDefault();
					FB.ui(
					{
						method: 'feed',
						name: 'Testing',
						link: 'khmer',
						picture: 'http://www.khmeracademy.org/resources/assets/img/banner/4th.jpg',
						caption: 'Test',
						description: 'Test',
						message: 'Test'
					});
				});
			}); */
		</script>
	
	<!-- end section -->
	<!-- end wrapper -->
	<!-- including js from include/front-end/js-include.jsp -->
	<jsp:include page="../include/front-end/js-include.jsp"></jsp:include>
	<script type="text/javascript">
		if(logId == ""){
			$('#like').click(function(){
				window.location.href = "/login";
			});
			$('#share').hide();
		
			$("#btnSaveList").click(function(){
				window.location.href = "/login";
			});
			
			$("#txtComment").click(function(){
				window.location.href = "/login";
			});
		}else{
			$('#like').click(function(){
				$(this).css('color','#e34b11');
			});
		}
	</script>
	
</body>
</html>