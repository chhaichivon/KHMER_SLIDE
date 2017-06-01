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
		<!-- including header from include/front-end/header-include.jsp -->
		<jsp:include page="../include/front-end/header-include.jsp"></jsp:include>

		<section class="slider-section">
			<div class="tp-banner-container">
			
			</div>
		</section>
	</div>
	<!-- end container -->
	<section></section>
	<!-- end section -->


	

<section class="white section nopaddingbottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title text-center">
							<h4>ទំនាក់ទំនង</h4>
						</div>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
</div>
</section>

	<section class="grey section">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
				 <div class="widget">
                            <div class="widget-title">
						<h4>ស្វែងរកយើងតាមរយៈ ផែនទី</h4>
					</div>
					</div>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1954.3355327966553!2d104.8863989576609!3d11.575421768968686!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3109519cfc0bdfb1%3A0x2c2974b77cdaff4b!2sKorea+Software+HRD+Center!5e0!3m2!1sen!2skh!4v1472208885371" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
				<!-- end col -->
			
			<!-- end row -->
			

		
				<div class="col-md-4">        
                        <div class="widget">
                            <div class="widget-title">
                                <h4>ទំនាក់ទំនងតាមរយៈ​</h4>
                                <hr>
                            </div>
                            <ul class="contact-details">
                                <li><i class="fa fa-link"></i> <a href="#">www.khmerslide.com</a></li>
                                <li><i class="fa fa-envelope"></i> <a href="#"> khmerslide.hrd@gmail.com</a></li>
                                <li><i class="fa fa-phone"></i>  +855 10 552 563</li>
                                <li><i class="fa fa-fax"></i>+855 10 753 147</li>
                                <li><i class="fa fa-home"></i> Korean Software HRD. St 323, Phnom Penh.</li>
                            </ul>

                        </div><!-- end widget -->
				</div>
				<!-- end col -->
			
			<!-- end row -->

		</div>
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