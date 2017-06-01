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
				<!-- end navbar-header -->
				<form class="search-form pull-left hidden-xs">
<!-- 					<div class="form-group has-feedback mb-0">
						<input type="text" aria-describedby="inputSearchFor"
							placeholder="ស្វែងរក..." style="width: 350px"
							class="form-control rounded"><span aria-hidden="true"
							class="fa fa-search form-control-feedback"></span><span
							id="inputSearchFor" class="sr-only">(default)</span>
					</div> -->
				</form>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
					
						<li><a href="/index.ks"><i class="fa fa-home"></i>ទំព័រដើម</a></li>
						<li class="dropdown ttmenu-half"><a href="index9.html#"
							data-toggle="dropdown" class="dropdown-toggle"><i
								class="fa fa-list-ul"></i> មីនុយ</a>
							<ul class="dropdown-menu">
								<li data-ng-controller="categoryCtrl">
									<div class="ttmenu-content">
										<div class="row">
											<div class="col-md-6" data-ng-repeat="c in category">
												<div class="box">
													<ul>
														<li><a href="/category/?cat={{ c.CAT_ID }}">{{ c.CAT_NAME }}</a></li>
													</ul>
												</div>
												<!-- end box -->
											</div>
											<!-- end col -->
										</div>
										<!-- end row -->
									</div>
									<!-- end ttmenu-content -->
								</li>
							</ul></li>
						<!-- end mega menu -->
						<li><a href="/aboutus"><i class="fa fa-info-circle"></i> អំពីយើង</a></li>
						<li><a href="/contactus"><i class="fa fa-mobile"></i> ទំនាក់ទំនង</a></li>
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
						<li id="upload"><a data-toggle="modal" data-target=".modalUpload"><i class="fa fa-upload"></i> Upload</a></li>
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
<%-- <<sec:authentication property="">

</sec:authentication> --%>
<script type="text/javascript">
      	var logId = '${logId}';

      	
      </script>