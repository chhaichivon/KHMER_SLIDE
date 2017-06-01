<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <footer class="dark footer section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-xs-12" id="aboutUs">
                        <div class="widget">
                            <div class="widget-title">
                                <h4>អំពី KhmerSLIDE</h4>
                                <hr>
                            </div>
                            <p>KHMERSLIDE  is a powerful documents hosting service for helping Cambodian dealing with the documents problems 
                            </p>
                            <a href="/aboutus" class="btn btn-default">អានបន្ត</a>
                        </div><!-- end widget -->
                    </div><!-- end col -->

                    <div class="col-md-3 col-xs-12">
                        <div class="widget">
                            <div class="widget-title">
                                <h4>ស្វែងរកពួកយើងនៅលើ:</h4>
                                <hr>
                            </div>
                            	<a href="https://www.facebook.com/khmerslide/?fref=ts" class="btn btn-outline btn-primary"><i class="fa fa-facebook-official"></i> Facebook</a>
                            	<a href="https://plus.google.com/u/2/117679030560282344615/posts?hl=en" class="btn btn-outline btn-danger"><i class="fa fa-google-plus-square"></i> Google+</a>
                        </div><!-- end widget -->
                    </div><!-- end col -->

                    <div class="col-md-3 col-xs-12">
                        <div class="widget">
                            <div class="widget-title">
                                <h4>អត្ថបទពេញនិយម</h4>
                                <hr>
                            </div>

                            <ul class="popular-courses" data-ng-controller="documentCtrl">
                                <li data-ng-repeat="dp in popularDocument" data-ng-if="$index<12">
                                    <a href="/view/?doc={{ dp.DOC_ID }}&cat={{dp.CATEGORY.CAT_ID}}"" title=""><img class="img-thumbnail" src="{{ thumb }}{{ dp.THUMBNAIL }}" alt="" title="{{ dp.DOC_TITLE }}"></a>
                                </li>
                            </ul>
                        </div><!-- end widget -->
                    </div><!-- end col -->

                    <div class="col-md-3 col-xs-12">
                        <div class="widget">
                            <div class="widget-title">
                                <h4>ទំនាក់ទំនងតាមរយៈ​</h4>
                                <hr>
                            </div>

                            <ul class="contact-details">
                                <li><i class="fa fa-link"></i> <a href="/index">www.khmerslide.com</a></li>
                                <li><i class="fa fa-envelope"></i> <a href="mailto:info@yoursite.com">khmerslide.hrd@gmail.com</a></li>
                                <li><i class="fa fa-phone"></i> +855 10 552 563</li>
                                <li><i class="fa fa-fax"></i> +855 10 753 147</li>
                                <li><i class="fa fa-home"></i> Korean Software HRD. St 323, Phnom Penh.
</li>
                            </ul>

                        </div><!-- end widget -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </footer><!-- end section -->