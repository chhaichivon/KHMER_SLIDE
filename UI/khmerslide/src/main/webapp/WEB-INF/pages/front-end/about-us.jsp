<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- including style from include/front-end/css-include.jsp -->
<jsp:include page="../include/front-end/css-include.jsp"></jsp:include>
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
		<!-- 		<div class="topbar">
        	<div class="container">
        		<div class="row">
	                <div class="col-md-6 text-left">
	                    <p><i class="fa fa-graduation-cap"></i> Best learning management template for ever.</p>
					</div>end left

	                <div class="col-md-6 text-right">
						<ul class="list-inline">
                            <li>
                                <a class="social" href="index9.html#"><i class="fa fa-facebook"></i></a> 
                                <a class="social" href="index9.html#"><i class="fa fa-twitter"></i></a> 
                                <a class="social" href="index9.html#"><i class="fa fa-google-plus"></i></a> 
                                <a class="social" href="index9.html#"><i class="fa fa-linkedin"></i></a>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="index9.html#" data-toggle="dropdown"><i class="fa fa-lock"></i> Login & Register</a>
                                <div class="dropdown-menu">
                                    <form method="post"> 
                                        <div class="form-title">
                                            <h4>Login Area</h4>
                                            <hr>
                                        </div>
                                        <input class="form-control" type="text" name="username" placeholder="User Name"> 
                                        <div class="formpassword">
                                            <input class="form-control" type="password" name="password" placeholder="******"> 
                                        </div>
                                        <div class="clearfix"></div>
                                        <button type="submit" class="btn btn-block btn-primary">Login</button>
                                        <hr>
                                        <h4><a href="index9.html#">Create an Account</a></h4>
                                    </form> 
                                </div>
                            </li>
                        </ul>
					</div>end right
				</div>end row
        	</div>end container
		</div>end topbar -->

		<!-- including header from include/front-end/header-include.jsp -->
		<jsp:include page="../include/front-end/header-include.jsp"></jsp:include>



		<section class="white section nopaddingbottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title text-center">
							<h4>អំពីយើង</h4>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->


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
						<h4>អំពី KhmerSLIDE</h4>
						<br>

						<p>KHMERSLIDE is a powerful documents hosting service for
							helping Cambodian dealing with the documents problems</p>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->

			<!-- end latest topics -->


			<div class="row">
				<div class="col-md-12">
					<div class="section-title text-center">
						<h4>ក្រុមអ្នកអភិវឌ្ឍន៍គេហទំព័រ</h4>
						<br>
						<br>
						<br>
						<br>
						<div class="col-md-3">
							<div class="item">
								<div class="shop-item-list entry"
									style="margin-right: 10px; margin-left: 10px;">
									<div class="">
										<div class="widget">
											<a href="javascript:;" role="button" data-modal="modal-1"
												class="md-trigger"> <img
												src="${pageContext.request.contextPath}/resources/static/front-end/img/Chivon.jpg"
												class="img-circle" alt="Cinque Terre" width="270"
												height="236" class="img-responsive">
											</a>
											<div class="magnifier" style="height: 250px;"></div>
										</div>
										<div class="shop-item-title clearfix">
											<h4 class="text-center" id="subStr">Chhai Chivon</h4>
										</div>
										<div class="visible-buttons shop-item-title">
											<p style="text-align: justify;">"HRD is the best IT
												Educational Center where you can get priceless knowledge and
												benefitcial experiences."</p>
											<b>Mr. Chhai Chivon,</b> 4th Generation, Software Developer.
										</div>
									</div>
									<hr class="invis">
								</div>


							</div>
						</div>
						<div class="col-md-3">
							<div class="item">
								<div class="shop-item-list entry"
									style="margin-right: 10px; margin-left: 10px;">
									<div class="">
										<div class="widget">
											<a href="javascript:;" role="button" data-modal="modal-1"
												class="md-trigger"> <img
												src="${pageContext.request.contextPath}/resources/static/front-end/img/Sovanvatey.jpg"
												class="img-circle" alt="Cinque Terre" width="270"
												height="236" class="img-responsive">
											</a>
											<div class="magnifier" style="height: 250px;"></div>
										</div>
										<div class="shop-item-title clearfix">
											<h4 class="text-center" id="subStr">Khoun Sovanvatey</h4>
										</div>
										<div class="visible-buttons shop-item-title">
											<p style="text-align: justify;">"HRD has strong
												intentioin to develop human resources in Cambodia."</p>
											<b>Miss. Khoun Sovanvatey,</b> 4th Generation, Software
											Developer.
										</div>
									</div>
									<hr class="invis">
								</div>


							</div>
						</div>
						<div class="col-md-3">
							<div class="item">
								<div class="shop-item-list entry"
									style="margin-right: 10px; margin-left: 10px;">
									<div class="">
										<div class="widget">
											<a href="javascript:;" role="button" data-modal="modal-1"
												class="md-trigger"> <img
								src="${pageContext.request.contextPath}/resources/static/front-end/img/BongChannarith.jpg"
								class="img-circle" alt="Cinque Terre" width="270" height="236"
								class="img-responsive">
											</a>
											<div class="magnifier" style="height: 250px;"></div>
										</div>
										<div class="shop-item-title clearfix">
											<h4 class="text-center" id="subStr">Bong Channarith</h4>
										</div>
										<div class="visible-buttons shop-item-title">
											<p style="text-align: justify;">"HRD is a place to grow your potential of self-researching and strengthen many valuable friendships."</p>
											<b>Mr. Bong Channarith,</b> 4th Generation, Software
											Developer.
										</div>
									</div>
									<hr class="invis">
								</div>


							</div>
						</div>
						<div class="col-md-3">
							<div class="item">
								<div class="shop-item-list entry"
									style="margin-right: 10px; margin-left: 10px;">
									<div class="">
									 <img
								src="${pageContext.request.contextPath}/resources/static/front-end/img/Odom.jpg"
								class="img-circle" alt="Cinque Terre" width="270" height="236"
								class="img-responsive">
										
											<div class="magnifier" style="height: 250px;"></div>
										</div>
										<div class="shop-item-title clearfix">
											<h4 class="text-center" id="subStr">Chan Odom</h4>
										</div>
										<div class="visible-buttons shop-item-title">
											<p style="text-align: justify;">"HRD Center is a place where the immature programming students can be altered into an expert programmer."</p>
											<b>Mr. Chan Odom,</b> 4th Generation, Software
											Developer.
										</div>
									</div>
									<hr class="invis">
								</div>


							</div>
						</div>

					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->


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
	<!-- including js from include/front-end/js-include.jsp -->
	<jsp:include page="../include/front-end/js-include.jsp"></jsp:include>
</body>
</html>