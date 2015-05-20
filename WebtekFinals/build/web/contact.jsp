<%-- 
    Document   : contact
    Created on : May 20, 2015, 1:38:25 AM
    Author     : daviDKevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SLU Online | Contact</title>
        <jsp:include page="WEB-INF/head-elements.jsp" />
    </head>
    <body>
        
        <!-- Page Content -->
    <div class="container">
        <jsp:include page="WEB-INF/nav-elements.jsp" />
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-phone"></i> Contact
                    <small>Subheading</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="home.html">Home</a>
                    </li>
                    <li class="active">Contact</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- Content Row -->
        <div class="row">
            <!-- Map Column -->
            <div class="col-md-12">
                <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
                <div style="overflow:hidden;height:400px;width:100%;">
                    <div id="gmap_canvas" style="height:400px;width:100%;"> </div>
		<style>#gmap_canvas img{max-width:none!important;background:none!important}</style>
                    <a class="google-map-code" href="http://wordpress-themes.org" id="get-map-data">template wordpress</a>
                </div>
                <script type="text/javascript"> 

		function init_map(){
			var myOptions = {zoom:17,center:new google.maps.LatLng(16.4184518,120.5965966),
			mapTypeId: google.maps.MapTypeId.ROADMAP};
			map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
			marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(16.4184518, 120.5965966)});
			infowindow = new google.maps.InfoWindow({content:"<b>Saint Louis University</b><br/>A. Bonifacio Street<br/>2600 Baguio" });
			google.maps.event.addListener(marker, "click", function(){infowindow.open(map,marker);});infowindow.open(map,marker);
		}google.maps.event.addDomListener(window, 'load', init_map);
                </script>
            </div>
            <!-- Contact Details Column -->
        </div>
        <!-- /.row -->

        <!-- Contact Form -->
        <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<div class="col-md-4">
                <h3>Contact Details</h3>
		<hr>
                <p>
                   A. Bonifacio Street
		<br>Baguio City, Philippines 2600<br>
                </p>
                <p>
					Trunk Lines: (063) (74) 442 2794, 442 2193, 443 3043, 443 2001, 444  8246 to 48, 444 8253<br>
					Fax Number: (063) (74) 442 2842<br><br><hr>
					Registrar's Office<br>
					Local:  213, 382, 299, 229<br>
					Email: sluregis.slu.edu.ph<br><br><hr>
					Student Affairs Office (Admission)<br>
					Local: 321, 237, 230<br>
					Email:  saosec@slu.edu.ph<br>
		</p>
               <hr>
                  
                <ul class="list-unstyled list-inline list-social-icons">
                    <li>
                        <a href="#"><i class="fa fa-facebook-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a>
                    </li>
                </ul>
            </div>

        <!-- /.row -->


        <!-- Footer -->
        
        <footer>
            
            <div class="row">
                <div class="col-lg-12">
                    <hr />
                    <p>WEBTEK 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Contact Form JavaScript -->
    <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    </body>
</html>
