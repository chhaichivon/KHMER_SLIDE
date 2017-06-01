<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- including style from include/front-end/css-include.jsp -->
<jsp:include page="../include/front-end/css-include.jsp"></jsp:include>
</head>
<body class="login" ng-app="homePage">

	<div id="loader">
		<div class="loader-container">
			<img
				src="${pageContext.request.contextPath}/resources/static/front-end/img/site.gif"
				alt="" class="loader-site">
		</div>
	</div>

	<div id="wrapper" ng-controller="signinctrl">
		<!-- including header from include/front-end/header-include.jsp -->
		<jsp:include page="../include/front-end/header-include.jsp"></jsp:include>
		<div class="container">
			<div class="row" ​style="padding-top: 28px;">
				<div class="col-md-6 col-md-offset-3">
					<div class="logo logo-center">
						<a href="index.html"><img
							src="${pageContext.request.contextPath}/resources/static/img/logo/logo-login.png"
							alt=""></a>
					</div>
					<div class="panel panel-login">

						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-12">
									<a href="course-login.html#" class="active"
										id="login-form-link">បង្កើតគណនី KhmerSLIDE</a>
								</div>
							</div>
							<hr>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<form action="login" id="frmSignup" name="frmSignup" method="POST" method="post"
										role="form" style="display: block;">
										<div class="form-group">
											<input type="text" name="username" id="username" tabindex="1"
												class="form-control" placeholder="ឈ្មោះអ្នកប្រើប្រាស់"
												value="" ng-model="txtusername" required="required">
										</div>
										<div class="form-group">
											<select class="form-control" ​​tabindex="1"
												ng-model="txtGender" name="txtGender" id="txtGender" required="required">
												<option value="">-- ភេទ --</option>
												<option value="ប្រុស">ប្រុស</option>
												<option value="ស្រី">ស្រី</option>
											</select>
										</div>
										<div class="form-group">
											<input type="text" name="email" id="email" tabindex="2"
												class="form-control" placeholder="អ៊ីម៉ែល"
												ng-pattern="/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,15})$/"
												ng-model="txtemail" type="mail"
												required="required">
										</div>
										<div class="form-group">
											<input id="txtPassword" type="password" name="txtPassword"
												ng-model="txtPassword" tabindex="3" class="form-control"
												placeholder="លេខសម្ងាត់" required="required">
										</div>
										<div class="form-group">
											<input id="txtConfirmPassword" type="password"
												name="txtConfirmPassword" ng-model="txtConfirmPassword"
												ng-change="match()" tabindex="4" class="form-control"
												placeholder="បញ្ជាក់លេខសម្ងាត់" required="required">
										</div>
										<span ng-show="noMatch" class="error"> Password is not
											match !</span> <span ng-show="BlakPass" class="error"> Please
											enter your password !</span>
										<div class="form-group" ng-model = "tt" ng-init = "tt = frmSignup.$invalid">
											<div class="row">
												<div class="col-sm-12">
													<button
													  	
														class="form-control btn btn-default btn-block"
														ng-click="signup()" type="button"
														ng-disabled="(frmSignup.$invalid || noMatch)">ចុះឈ្មោះ
													</button>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-lg-6">
													<div class="text-center">
														<label>អ្នកមានគណនី​រូចហើយ?</label>
													</div>
												</div>
												<div class="col-lg-6">
													<div class="text-center">
														<a href="/login" t class="forgot-password">ចូលគណនី</a>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end wrapper -->
	<!-- including js from include/front-end/js-include.jsp -->
	<jsp:include page="../include/front-end/js-include.jsp"></jsp:include>

</body>
</html>