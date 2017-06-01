<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix='filter' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<!-- including style from include/front-end/css-include.jsp -->
<jsp:include
	page="../include/front-end/category/category-css-include.jsp"></jsp:include>
	<style>
		.col-md-9{
			padding: 5px;
		} 
		.card{
			padding: 0px;
		}
		#subString{
		    overflow: hidden;
		    white-space:nowrap;
		    text-overflow:ellipsis;
		    width:150px;
		    display:inline-block;
		}
		.section{
			padding: 0;
		}
	</style>
</head>
<body id="" class="" data-view="app" data-responsive="true"
	data-user-signed-in="false" data-ng-app="homePage">
	<input type="hidden" value="${param.cat}" id="cat-id">
	<input type="hidden" value="${param.sub}" id="sub-id">
	<input type="hidden" value="${param.type}" id="type">

	<div id="loader">
		<div class="loader-container">
			<img
				src="${pageContext.request.contextPath}/resources/static/front-end/img/site.gif"
				alt="" class="loader-site">
		</div>
	</div>

	<div id="wrapper">
		<!-- including header from include/front-end/header-include.jsp -->
		<jsp:include
			page="../include/front-end/category/category-header-include.jsp"></jsp:include>


		<section class="grey section">
			<div class="container">
				<div class="row">
					<div id="course-left-sidebar" class="col-md-3" data-ng-controller="catCtrl">
						<div class="sidebar-s -size-fixed-tablet is-hidden-phone">
							<form accept-charset="UTF-8" action="/search"
								class="js-facet-form" data-pjax="" data-view="facetingControls"
								id="searchFacets" method="get">
								<div style="margin: 0; padding: 0; display: inline">
									<input name="utf8" type="hidden" value="&#x2713;" />
								</div>
								<div class="search-facet-panel" data-view="searchFacetPanel">
									<!-- <div class="search-facet-refine">លទ្ធផលនៃការស្វែងរករបស់អ្នក:</div> -->
									
									<input id="term" name="term" type="hidden" /> <input
										class="js-autosuggest__analytics-param" disabled="disabled"
										name="as" type="hidden" /> <input
										class="js-autosuggest__term-type-param" disabled="disabled"
										name="type" type="hidden" /> <input name="referrer"
										type="hidden" value="search" />

									<div class="search-facet card">
										<div class="search-facet-actives__remove-all">
											លទ្ធផលនៃការស្វែងរក: <a data-pjax="" href="/index.ks">សម្អាត</a>
										</div>

										<div class="search-facet-actives__facet-wrapper">
											<ul class="search-facet-actives__facet-categories-list">
												<li>
													<div class="search-facet-actives__facet">
														<span class="search-facet-actives__icon"> <i
															class="fa fa-folder-o"></i>
														</span> <span class="search-facet-actives__text">{{ txtMainCategory  }}</span>
														<a class="search-facet-actives__glyph-cancel"
															data-description="Site Templates" data-pjax=""
															href="/index.ks"> <i class="e-icon -icon-cancel"></i>
														</a>
													</div>
												</li>
												<li id="sub">
													<div class="search-facet-actives__facet">
														<span class="search-facet-actives__icon"> <i
															class="fa fa-folder-o"></i>
														</span> <span class="search-facet-actives__text">{{ txtSubCategory }}</span>
														<a class="search-facet-actives__glyph-cancel"
															data-description="Site Templates" data-pjax=""
															href="/category/?cat={{ MCategoryId }}"> <i class="e-icon -icon-cancel"></i>
														</a>
													</div>
												</li>
												<filter:choose>
													<filter:when test="${param.type == 1}">
														<li>
															<div class="search-facet-actives__facet">
																<span class="search-facet-actives__icon"> <i
																	class="fa fa-folder-o"></i>
																</span> <span class="search-facet-actives__text">Slide</span>
																<filter:if test="${param.sub == null}"><a class="search-facet-actives__glyph-cancel"
																	data-description="Site Templates" data-pjax=""
																	href="/category/?cat={{ MCategoryId }}"> <i class="e-icon -icon-cancel"></i>
																</a></filter:if>
																<filter:if test="${param.sub != null}"><a class="search-facet-actives__glyph-cancel"
																	data-description="Site Templates" data-pjax=""
																	href="/category/?cat={{ MCategoryId }}&sub=${param.sub}"> <i class="e-icon -icon-cancel"></i>
																</a></filter:if>
															</div>
														</li>
													</filter:when>
													<filter:when test="${param.type == 2}">
														<li>
															<div class="search-facet-actives__facet">
																<span class="search-facet-actives__icon"> <i
																	class="fa fa-folder-o"></i>
																</span> <span class="search-facet-actives__text">PDF</span>
																<filter:if test="${param.sub == null}"><a class="search-facet-actives__glyph-cancel"
																	data-description="Site Templates" data-pjax=""
																	href="/category/?cat={{ MCategoryId }}"> <i class="e-icon -icon-cancel"></i>
																</a></filter:if>
																<filter:if test="${param.sub != null}"><a class="search-facet-actives__glyph-cancel"
																	data-description="Site Templates" data-pjax=""
																	href="/category/?cat={{ MCategoryId }}&sub=${param.sub}"> <i class="e-icon -icon-cancel"></i>
																</a></filter:if>
															</div>
														</li>
													</filter:when>
													<filter:when test="${param.type == 3}">
														<li>
															<div class="search-facet-actives__facet">
																<span class="search-facet-actives__icon"> <i
																	class="fa fa-folder-o"></i>
																</span> <span class="search-facet-actives__text">Microsoft Word</span>
																<filter:if test="${param.sub == null}"><a class="search-facet-actives__glyph-cancel"
																	data-description="Site Templates" data-pjax=""
																	href="/category/?cat={{ MCategoryId }}"> <i class="e-icon -icon-cancel"></i>
																</a></filter:if>
																<filter:if test="${param.sub != null}"><a class="search-facet-actives__glyph-cancel"
																	data-description="Site Templates" data-pjax=""
																	href="/category/?cat={{ MCategoryId }}&sub=${param.sub}"> <i class="e-icon -icon-cancel"></i>
																</a></filter:if>
															</div>
														</li>
													</filter:when>
												</filter:choose>
											</ul>
										</div>
									</div>

									<div class="search-facet">
										<div class="search-facet--no-margin">
											<div
												class="js-search-facet-panel__header search-facet-panel__header--start">
												<h2 data-title="Category">
													<i class="e-icon -icon-list -margin-right"></i>មីនុយ
												</h2>
												<ul class="search-facet-listing">
													<li data-ng-repeat="s in subCategory">
														<div class="search-facet-listing__link">
															<span class="search-facet-listing__label">{{ s.CAT_NAME }}</span>
															<!-- <span class="search-facet-result-count">7332</span> -->
														</div>
													</li>
												</ul>

											</div>

											<div
												class="js-search-facet-panel__body search-facet-panel__body  is-visually-hidden--js">
												<div class="search-facet-panel__body-inner">
													<button
														class="js-search-facet-panel__body-close search-facet-panel__body-close">
														<i class="e-icon -icon-cancel"> <span
															class="e-icon__alt">បោះបង់</span>
														</i>
													</button>
													<div class="search-facet-panel__breadcrumbs-wrapper">
														<div class="search-facet-panel__breadcrumbs-intro">
															<span class="t-body -size-m">បង្ហាញ:</span>
														</div>
														<div class="search-facet-panel__breadcrumbs">
															<nav
																class="breadcrumbs -line-wrap -color-grey -icon-fill h-text-truncate">
																<span data-pjax="" rel="nofollow">
																	មីនុយទាំងអស់ <!-- <span class="breadcrumbs__count">24610</span> -->
																</span>
															</nav>
														</div>
													</div>

													<ul class="search-facet-single-select-in-panel">
														<filter:choose>
															<filter:when test="${param.type == null}">
																<li class="" data-ng-repeat="sh in subCategory">
																	<a href="?cat={{ sh.PARENT.CAT_ID }}&sub={{ sh.CAT_ID }}"
																		rel="nofollow"
																		style="min-width: 50%; width: calc(100.0% - 30px);">
																			<div class="search-facet-single-select-panel__title">
																				<div
																					class="search-facet-single-select-panel__title-inner">
																					{{ sh.CAT_NAME }}</div>
																			</div>
																	</a>
																</li>
															</filter:when>
															<filter:when test="${param.type != null}">
															<li class="" data-ng-repeat="sh in subCategory">
																<a href="?cat={{ sh.PARENT.CAT_ID }}&sub={{ sh.CAT_ID }}&type=${param.type}"
																	rel="nofollow"
																	style="min-width: 50%; width: calc(100.0% - 30px);">
																		<div class="search-facet-single-select-panel__title">
																			<div
																				class="search-facet-single-select-panel__title-inner">
																				{{ sh.CAT_NAME }}</div>
																		</div>
																</a>
															</li>
															</filter:when>
														</filter:choose>
													</ul>
													<div
														class="js-search-facet-toggle search-facet-panel-toggle"
														data-view="facetTogglePanel">
														<div class="search-facet-panel__action">
															<button
																class="js-search-facet-panel__body-close e-btn--3d -color-primary -width-full">
																Done</button>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- <div>
											<div class="search-facet-header">
												<h2>
													<i class="e-icon -icon-calendar -margin-right"></i><span>កាលបរិច្ឆេទបញ្ចូល</span>
												</h2>
											</div>

											<div
												class="group-select -border-top-none -border-radius-none">
												<label class="is-visually-hidden" for="sales">កាលបរិច្ឆេទបញ្ចូល</label>
												<select data-pjax="" id="sales" name="sales">
													<option selected="selected" value="">កាលបរិច្ឆេទ:
														ឆ្នាំមុន</option>
													<option value="rank-0">ខែមុន</option>
													<option value="rank-1">សប្តាហ៍មុន</option>
													<option value="rank-2">ថ្ងៃម្សិលមិញ</option>
													<option value="rank-3">ថ្ងៃនេះ</option>
												</select>
											</div>

										</div> -->

										<div class="search-facet">
											<!-- <div class="search-facet--no-margin"> -->
											<div
												class="js-search-facet-panel__header search-facet-panel__header--end">
												<h2 data-title="Software version">
													<i class="e-icon -icon-document -margin-right"></i>ប្រភេទឯកសារ
												</h2>


												<ul class="search-facet-listing">
													<li>
														<div class="search-facet-listing__link">
															<span class="search-facet-listing__label">Slide</span>
														</div>
													</li>
													<li>
														<div class="search-facet-listing__link">
															<span class="search-facet-listing__label">PDF</span> 
														</div>
													</li>
													<li>
														<div class="search-facet-listing__link">
															<span class="search-facet-listing__label">Microsoft Word</span> 
														</div>
													</li>
												</ul>
											</div>

											<div
												class="js-search-facet-panel__body search-facet-panel__body  is-visually-hidden--js">
												<div class="search-facet-panel__body-inner">
													<button
														class="js-search-facet-panel__body-close search-facet-panel__body-close">
														<i class="e-icon -icon-cancel"> <span
															class="e-icon__alt">បោះបង់</span>
														</i>
													</button>
													<div class="search-facet-panel__breadcrumbs-wrapper">
														<div class="search-facet-panel__breadcrumbs-intro">
															<span class="t-body -size-m">បង្ហាញ:</span>
														</div>
														<div class="search-facet-panel__breadcrumbs">
															<nav
																class="breadcrumbs -line-wrap -color-grey -icon-fill h-text-truncate">
																<span data-pjax="" rel="nofollow">
																	ប្រភេទឯកសារទាំងអស់ 
																</span>
															</nav>
														</div>
													</div>

													<ul class="search-facet-single-select-in-panel">
													<filter:choose>
														<filter:when test="${param.sub == null }">
															<li class=""><a
															href="/category/?cat=${param.cat}&type=1" rel="nofollow"
															style="min-width: 50%; width: calc(100.0% - 30px);">
																<div class="search-facet-single-select-panel__title">
																	<div
																		class="search-facet-single-select-panel__title-inner">
																		Slide</div>
																</div>
															</a>
														</li>

														<li class=""><a
															href="/category/?cat=${param.cat}&type=2" rel="nofollow"
															style="min-width: 50%; width: calc(100.0% - 30px);">
																<div class="search-facet-single-select-panel__title">
																	<div
																		class="search-facet-single-select-panel__title-inner">
																		PDF</div>
																</div>
															</a>
														</li>
														
														<li class=""><a
															href="/category/?cat=${param.cat}&type=3" rel="nofollow"
															style="min-width: 50%; width: calc(100.0% - 30px);">
																<div class="search-facet-single-select-panel__title">
																	<div
																		class="search-facet-single-select-panel__title-inner">
																		Microsoft Word</div>
																</div>
															</a>
														</li>
														</filter:when>
														<filter:when test="${param.sub != null }">
															<li class=""><a
															href="/category/?cat=${param.cat}&sub=${param.sub}&type=1" rel="nofollow"
															style="min-width: 50%; width: calc(100.0% - 30px);">
																<div class="search-facet-single-select-panel__title">
																	<div
																		class="search-facet-single-select-panel__title-inner">
																		Slide</div>
																</div>
															</a>
														</li>

														<li class=""><a
															href="/category/?cat=${param.cat}&sub=${param.sub}&type=2" rel="nofollow"
															style="min-width: 50%; width: calc(100.0% - 30px);">
																<div class="search-facet-single-select-panel__title">
																	<div
																		class="search-facet-single-select-panel__title-inner">
																		PDF</div>
																</div>
															</a>
														</li>
														
														<li class=""><a
															href="/category/?cat=${param.cat}&sub=${param.sub}&type=3" rel="nofollow"
															style="min-width: 50%; width: calc(100.0% - 30px);">
																<div class="search-facet-single-select-panel__title">
																	<div
																		class="search-facet-single-select-panel__title-inner">
																		Microsoft Word</div>
																</div>
															</a>
														</li>
														</filter:when>
													</filter:choose>
													</ul>

													<div
														class="js-search-facet-toggle search-facet-panel-toggle"
														data-view="facetTogglePanel">
														<div class="search-facet-panel__action">
															<button
																class="js-search-facet-panel__body-close e-btn--3d -color-primary -width-full">
																Done</button>
														</div>
													</div>
												</div>
											</div>
											<!-- </div> -->
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- end col -->
					
					<div class="col-md-9">
						<div class="row" data-ng-controller="documentByCatCtrl">
							<div class="col-md-3 card" data-ng-repeat="d in document | orderBy:'-UPLOADED_DATE'">
								<div class="shop-item-list entry">
		                            <div class="">
		                               <a href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}" title="{{d.DOC_TITLE}}"> 
		                               		<img src="{{ thumb }}{{ d.THUMBNAIL }}" alt="">
									   </a>
		                                <div class="magnifier">
		                                </div>
		                            </div>
		                            <div class="shop-item-title clearfix">
		                                <h4 id="subString"><a href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}" title="{{d.DOC_TITLE}}">{{ d.DOC_TITLE }}</a></h4>
		                                <div class="shopmeta">
		                                    <span class="pull-left">ចូលអាន: {{ d.VIEWED }} ដង</span><br>
		                                    <!-- <div class="pull-right"> -->
												<span class="pull-left">ពេញចិត្ត: {{ d.LIKED }} <i
												class="fa fa-thumbs-o-up fa-lg text-primary"></i></span>
											<!-- </div> -->
		                                </div><!-- end shop-meta -->
		                            </div><!-- end shop-item-title -->
		                            <div class="visible-buttons">
		                                <a href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}"><span class="fa fa-eye" title="ចូលមើលអត្ថបទនេះ"></span></a>
										<a href="#"><span class="fa fa-share" title="ចែករំលែកបន្តនូវអត្ថបទមួយនេះ"></span></a>
		                            </div><!-- end buttons -->
		                        </div>
							</div>
							<hr class="invis">

						<div id="reviews" class="feedbacks">
						<filter:choose>
							<filter:when test="${param.type == null}">
								<p>
									<button class="btn btn-default btn-block" role="button" ng-init="number=8" ng-click="catId(number)" id="limit"><i
										class="fa fa-refresh"></i> ទាញបន្ថែម</button>
								</p>
							</filter:when>
							<filter:when test="${param.type != null}">
								<p>
									<button class="btn btn-default btn-block" role="button" ng-init="number=8" ng-click="catAndType(number)" id="limit"><i
										class="fa fa-refresh"></i> ទាញបន្ថែម</button>
								</p>
							</filter:when>
						</filter:choose>
						
							
						</div>
						</div>
					</div>
					<!-- <div id="course-content" class="col-md-10 card"
						data-ng-controller="documentByCatCtrl">
						<div class="course-table card-block">
							<h4>អត្ថបទ</h4>
							<table class="table" id="doc-table">
								<thead>
									<tr>
										<th width="50%"></th>
										<th width="30%"></th>
										<th width="20%"></th>
									</tr>
								</thead>
								<tbody>
									<tr data-ng-repeat="d in document | orderBy:'-UPLOADED_DATE'">
										<td>
											<div class="media-left">
												<a href="/view/?doc={{ d.DOC_ID }}&cat={{ d.CATEGORY.CAT_ID }}" title="{{d.DOC_TITLE}}"> <img
													src="{{ thumb }}{{ d.THUMBNAIL }}" alt=""
													class="media-object" width="150" height="100">
												</a>
											</div>
											<div class="media-body">
												<h5 class="media-heading">
													{{ d.DOC_TITLE }}
													<button class="btn btn-outline btn-rounded btn-default"
														data-ng-if="d.TYPE == '1'">
														<i class="fa fa-file-powerpoint-o text-white"></i>
													</button>
													<button class="btn btn-outline btn-rounded btn-default"
														data-ng-if="d.TYPE == '2'">
														<i class="fa fa-file-pdf-o text-white"></i>
													</button>
													<button class="btn btn-outline btn-rounded btn-primary"
														data-ng-if="d.TYPE == '3'"">
														<i class="fa fa-file-word-o text-white"></i>
													</button>
												</h5>
												<p class="text-muted mb-0">បញ្ចូលដោយ: {{
													d.USER.USER_NAME }}</p>
													<p class="text-muted mb-0">កាលបរិច្ឆេទបញ្ចូល: {{
													d.UPLOADED_DATE }}</p>
											</div>
										</td>
										<td>{{ d.DESCRIPTION }}</td>
										<td><i class="fa fa-eye"></i> {{ d.VIEWED }} បានអាន<br>
											<i class="fa fa-thumbs-o-up"></i> {{ d.LIKED }} ពេញចិត្ត<br>
											<i class="fa fa-share-alt-square"></i> {{ d.SHARED }}
											ចែកចាយបន្ត</td>
									</tr>
								</tbody>
							</table>
						</div> -->
						<!-- end course-table -->

						
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
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
	</div>

	<!-- including js from include/front-end/js-include.jsp -->
	<jsp:include page="../include/front-end/js-include.jsp"></jsp:include>

</body>
</html>