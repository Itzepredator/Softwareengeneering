<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.png">

    <title>Map_Index</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
      <!--html { height: 100%; display: inline-block; margin-left: 15%; margin-right: 15%; }-->
      <!--body { height: 50%; margin-top: 12%; padding: 0px;}-->
      #map-test { 	height: 100% !important; 
					margin-top: 0% !important; 
					position: absolut !important;}
    </style>
	
	

    <!-- Custom styles for this template -->
    <link href="css/map_index.css" rel="stylesheet">
	 
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
	  <!--center: new google.maps.LatLng(-34.397, 150.644)-->
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
            <button type="submit" class="btn btn-success">Einloggen</button>
			<button type="submit" class="btn btn-info" data-toggle="modal" data-target="#registrieren">Registrieren</button>
          </form>
		  <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">‹ber uns</a></li>
            <li><a href="#contact">Kontakt</a></li>
          </ul>
        </div>
        </div><!--/.navbar-collapse -->
      </div>
      </div>
       <div class="panel panel-default">
        <div class="panel-body">
          <br>
          <div class="col-md-4">
            <input name="Ortssuche" placeholder="Ort" class="form-control" type="text">
          </div>
          <div class="pull-right col-lg-8 col-lg-push-1">
            <div class="row"></div>
            <div class="row">
              <div class="col-md-2">
                <select class="form-control">
                  <option>Alle</option>
                  <option>Argip</option>
                  <option>Aral</option>
                  <option>usw</option>
                </select>
              </div>
              <div class="col-md-3">
                <select class="form-control">
                  <option>Super(E5)</option>
                  <option>Super(10)</option>
                  <option>Diesel</option>
                  <option>V-Power Diesel</option>
                  <option>usw</option>
                </select>
              </div>
              <div class="col-md-3">
                <select class="form-control">
                  <option>5 Km</option>
                  <option>10 Km</option>
                  <option>15 Km</option>
                  <option>20 Km</option>
                </select>
              </div>
              <div class="col-lg-1">
                <a class="btn btn-primary">Suchen</a>
              </div>
            </div>
          </div>
        </div>
      </div>
	  <div class="modal fade" id="registrieren">
<!-- Registrierungsformular als Modal --> 
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">Registrieren</h4>
      </div>
      <div class="modal-body">
        <!--<p>One fine body&hellip;</p><-->
		<input type="text" placeholder="Benutzername" class="form-control">
		<input type="text" placeholder="E-Mail Adresse" class="form-control">
		<input type="password" placeholder="Kennwort eingeben" class="form-control">
		<input type="password" placeholder="Kennwort wiederholen" class="form-control">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">schlieﬂen</button>
        <button type="button" class="btn btn-primary">abschicken</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<div class="panel panel-default" Style= "height: 100%">
      <div id="map-test" class="panel-body">
	  </div>
	</div>
	  	<!--Map wird sichtbar -->
	<!--<div class="panel panel-default">
	  <div id="map-test" class="panel-body" >
	  </div>
	</div>-->
	
	<!--<div id="map-test"/> -->

    <!-- Main jumbotron for a primary marketing message or call to action -->

	  <!--<div class="container">
        <h1>Hello, world!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" role="button">Learn more &raquo;</a></p>
	  </div>-->
	<!--Map einblenden-->
	<!--<div id="map-test"/>-->
	
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
	

      <hr>
      <footer>
        <p>&copy; Smoking Brains 2013</p>
      </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
    <script type="text/javascript" src="/Tankstellen-DB/WebContent/js/bootstrap.min.js"></script> 
	

  </body>
</html>
