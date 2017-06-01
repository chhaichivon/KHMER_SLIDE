<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<!-- including style from include/admin/css-include.jsp -->
  	<jsp:include page="../include/admin/css-include.jsp"></jsp:include>
    <%-- <%@ include file="../include/css-include.jsp" %> --%>
  </head>
  <body style="background-image: url(../../images/backgrounds/17.jpg)" class="body-bg-full v2">
    <div class="container page-container">
      <div class="page-content">
        <div class="v2">
          <div class="logo"><img src="/resources/login/logo/logo.png"" alt="" width="300"></div>
          <form  class="form-horizontal" action="login" id="frmLogin" method="POST">
            <div class="form-group">
              <div class="col-xs-12">
                <input type="text" placeholder="Username" name="username" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <div class="col-xs-12">
                <input type="password" placeholder="Password" name="password" class="form-control">
              </div>
            </div>
            <div class="form-group">
              <div class="col-xs-12">
                <div class="checkbox-inline checkbox-custom pull-left">
                  <input id="exampleCheckboxRemember" type="checkbox" value="remember">
                  <label for="exampleCheckboxRemember" class="checkbox-muted text-muted">Remember me</label>
                </div>
                <div class="pull-right"><a href="#" class="inline-block form-control-static">Forgot a Passowrd?</a></div>
              </div>
            </div>
            <button type="submit" class="btn-lg btn btn-primary btn-rounded btn-block">Sign in</button>
          </form>
          <hr>
          <div class="clearfix">
            <p class="text-muted mb-0 pull-left">Want new account?</p><a href="#" class="inline-block pull-right">Sign Up</a>
          </div>
        </div>
      </div>
    </div> 
	<!-- including js from include/admin/js-include.jsp -->
	<jsp:include page="../include/admin/js-include.jsp"></jsp:include>
	
	<!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
        
        $(function() {
        	
        	$("#frmLogin").submit(function(e){
       		
       		  e.preventDefault();
       			
       		  $.ajax({
  	            url: "${pageContext.request.contextPath}/login",
  	            type: "POST",
  	            data: $("#frmLogin").serialize(),
//   	            beforeSend: function (xhr) {
//   	                xhr.setRequestHeader("X-Ajax-call", "true");
//   	            },
  	            success: function(data) {
  	            	if(data == "User account is locked"){
  	            		alert(data);
  	            	}else if(data == "User is disabled"){
  	            		alert(data);
  	            	}else if(data == "Bad credentials"){
  	            		alert(data);
  	            	}else{
  	            		alert("Logined success." + data);
  						location.href = "${pageContext.request.contextPath}/"+data;
  	            		
  	            	}
  	            	
  	            },
  	         	error: function(data){
  	         		console.log(data);
  				}
  	        });
       			
       		});
	      
        	
        	
        	$.ajax({ 
			    url: "http://localhost:8080/api/user", 
			    type: 'GET', 
			    beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.setRequestHeader("Authorization" , "Basic a3NsOmtzbGFwaQ==");
                },
			    success: function(data) { 
					console.log(data);
				  
			    },
			    error:function(data,status,er) { 
			        console.log("error: "+data+" status: "+status+" er:"+er);
			    }
			});
        	
        
        });
        </script>
  </body>
</html>
