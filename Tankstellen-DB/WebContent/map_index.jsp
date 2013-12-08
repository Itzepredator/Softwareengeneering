   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


    
    
<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Marvin Obreiter">
    <link rel="shortcut icon" href="favicon.png">

    <title>Map_Index</title>

    <!-- Bootstrap core CSS -->
    <style type="text/css">
<%@ include file="css/bootstrap.css" %>
</style> 
	<style type="text/css">
      html { height: 100% }
      body { height: 60%; margin-top: 18%; padding: 15px; }
      #map-test { height: 100% }
    </style>
	
    <!-- Custom styles for this template -->
        <style type="text/css">
<%@ include file="css/map_index.css" %>
</style> 
 
	<!--Maps API-->
	<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANIf0_AZrJxJ-X2W3XLIgX1F-teaw1iK4&sensor=true">
    </script>
	
	<!--Funktionen-->
	<script type="text/javascript">
	  google.maps.visualRefresh = true;
	  var map 
	  
      function initialize() {
	  var mapOptions = {
	  zoom: 15,
	  <!--Spezieller Ort als Startpunkt festlegen (Zentral) -->
	  <!--center: new google.maps.LatLng(-34.397, 150.644)->
	  };
	  map = new google.maps.Map(document.getElementById('map-test'),
      mapOptions);
	  // Try HTML5 geolocation
	  if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
			var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);

			var infowindow = new google.maps.InfoWindow({
			map: map,
			position: pos,
			content: 'Dein aktueller Standpunkt.'
			});
			map.setCenter(pos);
			},function() {
			handleNoGeolocation(true);
			});
		} else {
    // Browser doesn't support Geolocation
		handleNoGeolocation(false);
	   }    
	  }
		function handleNoGeolocation(errorFlag) {
			if (errorFlag) {
				var content = 'Error: The Geolocation service failed.';
			} else {
				var content = 'Error: Your browser doesn\'t support geolocation.';
			}
			var options = {
				map: map,
				position: new google.maps.LatLng(60, 105),
				content: content
			};
			var infowindow = new google.maps.InfoWindow(options);
			map.setCenter(options.position);
		}
		
	   function loadScript() {
			var script = document.createElement('script');
			script.type = 'text/javascript';
			script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
			'callback=initialize';
			document.body.appendChild(script);
		}
		
		google.maps.event.addDomListener(window, 'load', initialize);
		window.onload = loadScript;
    </script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
	
	<!--fav and touch icons  -->
	<link rel="apple-touch-icon-precomposed" Size="144x144" href="ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" Size="114x114" href="ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" Size="72x72" href="ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
  </head>
  
  

  <body>
      <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Tankstellen DB</a>
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Benutzername" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Passwort" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
		  <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">Über uns</a></li>
            <li><a href="#contact">Kontakt</a></li>
          </ul>
        </div>
        </div><!--/.navbar-collapse -->
      </div>
    </div>
	
	
 

  

 
 



    <!-- Main jumbotron for a primary marketing message or call to action -->
	<div id="map-test"/>
	  <!--<div class="container">
        <h1>Hello, world!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" role="button">Learn more &raquo;</a></p>
	  </div>-->
	<!--Map einblenden-->
	<!--<div id="map-test"/>-->
    <div class="container">
	

      <!-- Example row of columns -->
      <!--<div class="row">
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>-->
	</div> <!-- /container -->

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
