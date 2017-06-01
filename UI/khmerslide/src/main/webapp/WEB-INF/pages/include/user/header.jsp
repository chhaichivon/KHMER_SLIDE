<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="org.khmerslide.entities.User"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<div ng-controller="sessoinCtrl">      
      <div class="search-bar closed">
      <!--   <form>
          <div class="input-group input-group-lg">
            <input type="text" placeholder="ស្វែងរក..." class="form-control"><span class="input-group-btn">
              <button type="button" class="btn btn-default search-bar-toggle"><i class="ti-close"></i></button></span>
          </div>
        </form> -->
      </div><a href="/index.ks" class="brand pull-left"><img src="${pageContext.request.contextPath}/resources/static/img/logo/logo-login.png" alt="" width="150" height="20"></a><a href="javascript:;" role="button" class="hamburger-menu pull-left"><span></span></a>
      <form class="search-form pull-left hidden-xs">
        <!-- <div class="form-group has-feedback mb-0">
          <input type="text" aria-describedby="inputSearchFor" placeholder="ស្វែងរក..." style="width: 200px" class="form-control rounded"><span aria-hidden="true" class="ti-search form-control-feedback"></span><span id="inputSearchFor" class="sr-only">(default)</span>
        </div> -->
      </form>
      <ul class="notification-bar list-inline pull-right">
        <li class="dropdown"><a  href="/index.ks" class="dropdown-toggle bubble header-icon"><i class="ti-home"></i></a>

        </li>
        <li class="dropdown visible-lg visible-md"><a id="dropdownMenu2" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle header-icon lh-1 pt-15 pb-15">
            <div class="media mt-0">
              <div class="media-left avatar"><img src="{{ urls }}{{ photo }}" alt="" class="media-object img-circle"><span class="status bg-success"></span></div>
              <div class="media-right media-middle pl-0">
                <p class="fs-12 mb-0">សួរស្តី! {{ txtName }}</p>
              </div>
            </div></a>
          <ul aria-labelledby="dropdownMenu2" class="dropdown-menu fs-12 animated fadeInDown">
            <li><a id="profile" data-toggle="modal" data-target=".modalChangeProfile"><i class="ti-user mr-5"></i> ប្តូររូបភាពគណនី</a></li>
            <li><a id="info" data-toggle="modal" data-target=".modalChangeUserInformation"><i class="ti-settings mr-5"></i> ការកំណត់គណនី</a></li>
            <li><a href="/logout"><i class="ti-power-off mr-5"></i> ចាកចេញ</a></li>
          </ul>
        </li>
        <li><a href="/user/upload-file" role="button" class="bubble header-icon"><i class="ti-export"></i> <span>Upload</span></a></li>
      </ul>
      
      </div>
      
      
      
      <script type="text/javascript">
      	var userId = '<sec:authentication property="principal.id"/>';
      </script>