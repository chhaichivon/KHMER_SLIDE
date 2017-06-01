	        <!-- Angular Js -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.9.0.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/front-end/homePage.js"></script>
	<script
		src="http://dmypbau5frl9g.cloudfront.net/assets/market/core/index-033b5427b56df3a606e88cb177b6f4a5.js"
		type="text/javascript"></script>
			<script
		src="${pageContext.request.contextPath}/resources/static/front-end/category/js/custom.js"
		type="text/javascript"></script>
			<script>
		$(function() {
			viewloader.execute(Views);
		});
	</script>
	<script src="${pageContext.request.contextPath}/resources/static/front-end/js/bootstrap.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/static/front-end/js/retina.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resources/static/front-end/js/wow.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/front-end/js/carousel.js"></script>
    <!-- CUSTOM PLUGINS -->
	<script src="${pageContext.request.contextPath}/resources/static/front-end/js/custom.js"></script>
    <!-- SLIDER REV -->
    <script src="${pageContext.request.contextPath}/resources/static/front-end/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/front-end/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
        <!-- Sweet Alert -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/sweetalert/dist/sweetalert-dev.js"></script>
    
    <script>
    jQuery(document).ready(function() {
        jQuery('.tp-banner').show().revolution(
            {
            dottedOverlay:"none",
            delay:16000,
            startwidth:1170,
            startheight:620,
            hideThumbs:200,     
            thumbWidth:100,
            thumbHeight:50,
            thumbAmount:5,  
            navigationType:"none",
            navigationArrows:"solo",
            navigationStyle:"preview4",  
            touchenabled:"on",
            onHoverStop:"on",
            swipe_velocity: 0.7,
            swipe_min_touches: 1,
            swipe_max_touches: 1,
            drag_block_vertical: false,          
            parallax:"mouse",
            parallaxBgFreeze:"on",
            parallaxLevels:[10,7,4,3,2,5,4,3,2,1],
            parallaxDisableOnMobile:"off",           
            keyboardNavigation:"off",   
            navigationHAlign:"center",
            navigationVAlign:"bottom",
            navigationHOffset:0,
            navigationVOffset:20,
            soloArrowLeftHalign:"left",
            soloArrowLeftValign:"center",
            soloArrowLeftHOffset:20,
            soloArrowLeftVOffset:0,
            soloArrowRightHalign:"right",
            soloArrowRightValign:"center",
            soloArrowRightHOffset:20,
            soloArrowRightVOffset:0,  
            shadow:0,
            fullWidth:"on",
            fullScreen:"off",
            spinner:"spinner4",  
            stopLoop:"off",
            stopAfterLoops:-1,
            stopAtSlide:-1,
            shuffle:"off",  
            autoHeight:"off",           
            forceFullWidth:"off",                         
            hideThumbsOnMobile:"off",
            hideNavDelayOnMobile:1500,            
            hideBulletsOnMobile:"off",
            hideArrowsOnMobile:"off",
            hideThumbsUnderResolution:0,
            hideSliderAtLimit:0,
            hideCaptionAtLimit:0,
            hideAllCaptionAtLilmit:0,
            startWithSlide:0,
            fullScreenOffsetContainer: ""  
            }); 
        });
    </script>
    
        <!-- Bootstrap File Input-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/page-content/file-uploads/bootstrap-file-input.js"></script>
    
    <!-- DataTables-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/jszip/dist/jszip.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/pdfmake/build/pdfmake.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/pdfmake/build/vfs_fonts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-colreorder/js/dataTables.colReorder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/plugins/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/page-content/dashboard/index.js"></script>
    
    
    <!-- Check whether the user login or not -->
    <script>
	if(logId!=""){
		$("#login").hide();
		$("#profile").show();
		$("#logout").show();
		$("#upload").show();
	}else{
		$("#login").show();
		$("#profile").hide();
		$("#logout").hide();
		$("#upload").hide();
	}
    </script>
    