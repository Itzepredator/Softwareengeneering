<%@page import="de.hsqldb.Datenbank.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="de">
  <head>
    <meta charset="AddDefaultCharset utf-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="google-site-verification" content="AIzaSyCXxCG4kAz3fMbw-aph-Wil9JS5WrR58dQ" />
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
	
	<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
  </head>
  
  
    <!-- Import der Beans -->
  <jsp:useBean id="dbconnector" class="de.hsqldb.Datenbank.DBConnector"></jsp:useBean>
  
   <!-- Modal -->
	 	 <form role="form" method="POST">
		  <div class="modal fade" id="modalRegistrieren" role="dialog" arial-labelledby="modalRegistrierenLabel" aria-hidden="true">
		   <div class="modal-dialog">
		    <div class="modal-content">
			 <div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
			  </button>
			  <h4 class="modal-title" id="modalRegistrierenLabel">
					Registrieren
			  </h4>
			 </div>
			 <div class="modal-body">

			   <div class="row">
			    <div class="col-md-5">
				 <div class="form-group">
				  <label for="feldEmail">
						E-Mail-Adresse
				  </label>
				  <input type="text" class="form-control" name="email1" id="feldEmail" placeholder="Email-Adresse eingeben">
				  <jsp:setProperty name="dbconnector" property="email" param="email1"/>
				 </div>
				</div>
				<div class="col-md-5">
				 <div class="form-group">
				  <label for="feldVorname">
						Vorname
				  </label>
				  <input type="text" class="form-control" name="vorname1" id="feldVorname" placeholder="Vorname eingeben">
				  <jsp:setProperty name="dbconnector" property="vorname" param="vorname1"/>
				 </div>
				 <div class="col-md-5">
				 <div class="form-group">
				  <label for="feldNachname">
					Nachname
				  </label>
				  <input type="text" class="form-control" name="nachname1" id="feldNachname" placeholder="Nachname eingeben">
				  <jsp:setProperty name="dbconnector" property="nachname" param="nachname1"/>
				 </div>
				</div>
				</div>
				<div class="col-md-5">
				 <div class="form-group">
				  <label for="feldUsername">
						Benutzername
				  </label>
				  <input type="text" class="form-control" name="benutzername1" id="feldUsername" placeholder="Benutzername eingeben">
				  <jsp:setProperty name="dbconnector" property="benutzer" param="benutzername1"/>
				 </div>
				</div>
			   </div>
			   <div class="row">
			    <div class="col-md-5">
				 <div class="form-group">
				  <label for="feldPasswort">
						Passwort
				  </label>
				  <input type="password" class="form-control" name="passwort1" id="feldPasswort1" placeholder="Passwort eingeben">
				  <jsp:setProperty name="dbconnector" property="passwort" param="passwort1"/>
				 </div>
				 <div class="form-group">
				  <input type="password" class="form-control" id="feldPasswort2" placeholder="Passwort wiederholen">
				  <jsp:setProperty name="dbconnector" property="passwort" param="passwort1"/>
				 </div>
				</div>
			   </div>
	
			 </div>
			 <div class="modal-footer">
			  <button type="submit" class="btn btn-default" data-dismiss="modal">
					Schließen
			  </button>
			  <button type="submit" class="btn btn-primary">
					Konto erstellen
			  </button>
			 </div>
			</div>
		   </div>
		  </div>
		 </form>
  
  

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
          <a class="navbar-brand" href="map_index.jsp">Tankstellen DB</a>
        </div>
        <div class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="Benutzername" name="benutzername" class="form-control">
              <jsp:setProperty name="dbconnector" property="benutzer" param="benutzername"/>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Passwort" name="passwort" class="form-control">
              <jsp:setProperty name="dbconnector" property="passwort" param="passwort"/>
            </div>
          <!--  <p>Login erfolgreich: <c:out value="${dbconnector.login}"/></p>-->
            <!--  <p>Registrierung erfolgreich: <c:out value="${dbconnector.registrierung}"/></p> -->
              <jsp:setProperty name="dbconnector" property="werteZurueck" param="a"/>
            <button type="submit" class="btn btn-success">Einloggen</button>
           <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#modalRegistrieren">
				Registrieren
			</button>
			
		 </form>
		 
		  
		  
		  <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="map_index.jsp">Home</a></li>
            <li><a href="#about">Über uns</a></li>
            <li><a href="#contact">Kontakt</a></li>
          </ul>
        </div>
        </div><!--/.navbar-collapse -->
      </div>
      </div>
<!--        <div class="panel panel-default"> -->
<!--         <div class="panel-body"> -->
<!--           <br> -->
		  
<!--           </div> -->
<!--         </div> -->
      

	  
	  	  
	<div class="panel panel-default" Style= "height: 100%">
	  <div id="map-test" class="panel-body">
	  </div>
	</div>
	<div id="pos">
		<!-- Meine Position wird ermittelt... -->
	</div>
	
	  	<!--Map wird sichtbar -->
	<!--<div class="panel panel-default">
	  <div id="map-test" class="panel-body" >
	  </div>
	</div>-->
	
	<!--<div id="map-test"/> -->


		<!--Maps API-->
	<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?sensor=false">
    </script>
	
	<!--Funktionen-->
	<script>

	var autocomplete;
	var countryRestrict = { 'country': 'de' }; 
	var places;
	var DBConnector;		
	var sec = "detail";
 	var wertestring = '';
 	
	var liste = new Werteliste(location.search);
	
	var locations = [
						{	"id":"9272",
							"web_id":"79872438",
							"name":"AVIA",
							"address":"An Der Stadtautobahn 38",
							"zip":"18107",
							"city":"Rostock",
							"lat":"54.1317885",
							"lon":"12.0635988",
							"mts_brand":"AVIA"
						},
							
						{	"id":"10835",
							"web_id":"1ab12a53",
							"name":"Aral",
							"address":"An Der Stadtautobahn 60",
							"zip":"18119",
							"city":"Rostock",
							"lat":"54.16825",
							"lon":"12.07995",
							"mts_brand":"ARAL"
						},
						
						{	"id":"10929",
							"web_id":"51bd2ab1",
							"name":"Aral",
							"address":"Toitenwinkler Allee 1",
							"zip":"18147",
							"city":"Rostock",
							"lat":"54.11383",
							"lon":"12.16077",
							"mts_brand":"ARAL"
						},
						{	"id":"11242",
							"web_id":"bfba2bea",
							"name":"Aral",
							"address":"Tessiner Stra\u00dfe 68",
							"zip":"18055",
							"city":"Rostock",
							"lat":"54.0810616",
							"lon":"12.1943837",
							"mts_brand":"ARAL"
						},
						
						{	"id":"11723",
							"web_id":"eb3e2dcb",
							"name":"Aral",
							"address":"R\u00f6versh\u00e4ger Chaussee 1",
							"zip":"18146",
							"city":"Rostock",
							"lat":"54.09931",
							"lon":"12.17473",
							"mts_brand":"ARAL"
						},
						
						{	"id":"13382",
							"web_id":"783c3446",
							"name":"Star",
							"address":"Hinrichsdorfer Strasse 7E",
							"zip":"18146",
							"city":"Rostock",
							"lat":"54.1109933",
							"lon":"12.1645474",
							"mts_brand":"STAR"
						},
						{"id":"16350","web_id":"fbc13fde","name":"Shell","address":"Sankt-Petersburger Str. ","zip":"18107","city":"Rostock","lat":"54.130546","lon":"12.057902","mts_brand":"Shell"},{"id":"16973","web_id":"e28b424d","name":"TOTAL","address":"Warnowufer 53","zip":"18057","city":"Rostock","lat":"54.09332","lon":"12.11552","mts_brand":"Total"},{"id":"17430","web_id":"3f344416","name":"TOTAL","address":"Erich-Schlesinger-Str. 26","zip":"18059","city":"Rostock","lat":"54.07666","lon":"12.11905","mts_brand":"Total"},{"id":"17433","web_id":"ccd54419","name":"Sonstige","address":"R\u00f6versh\u00e4ger Chaussee 5","zip":"18146","city":"Rostock","lat":"54.10005","lon":"12.18156","mts_brand":"team"},{"id":"18023","web_id":"a18a4667","name":"TOTAL","address":"An Der Stadtautobahn 70","zip":"18107","city":"Rostock-Luettenklein","lat":"54.1320386","lon":"12.0631525","mts_brand":"Total"},{"id":"19085","web_id":"0c9d4a8d","name":"Sonstige","address":"Handwerkstra\u00dfe 1 ","zip":"18069","city":"Rostock","lat":"54.12559","lon":"12.07709","mts_brand":"CITTI"},{"id":"19647","web_id":"007c4cbf","name":"Q1","address":"Fischerweg 1","zip":"18069","city":"Rostock","lat":"54.1137","lon":"12.08059","mts_brand":"Q1"},{"id":"19665","web_id":"d78d4cd1","name":"ESSO","address":"Werftallee  ","zip":"18109","city":"Rostock","lat":"54.157248","lon":"12.078678","mts_brand":"ESSO"},{"id":"19902","web_id":"ed624dbe","name":"Star","address":"Gro\u00dfe Rampe 1","zip":"18146","city":"Rostock","lat":"54.13945","lon":"12.16683","mts_brand":"STAR"},{"id":"21451","web_id":"99f953cb","name":"ESSO","address":"Lise-Meitner-Ring 1  ","zip":"18059","city":"Rostock","lat":"54.05956","lon":"12.11783","mts_brand":"ESSO"},{"id":"21722","web_id":"eb9654da","name":"Shell","address":"Lorenzstr. 75 ","zip":"18146","city":"Rostock","lat":"54.10961","lon":"12.16789","mts_brand":"Shell"},{"id":"28679","web_id":"be3e7007","name":"ESSO","address":"Rostocker Str. 52  ","zip":"18069","city":"Rostock","lat":"54.106062","lon":"12.047943","mts_brand":"ESSO"},{"id":"28718","web_id":"6406702e","name":"Sonstige","address":"Roevershaeger Ch. 3","zip":"18146","city":"Rostock","lat":"54.09951","lon":"12.17716","mts_brand":"Tankcenter"},{"id":"29990","web_id":"bffe7526","name":"TOTAL","address":"Tessiner Str. 98","zip":"18055","city":"Rostock","lat":"54.08061","lon":"12.18906","mts_brand":"Total"},{"id":"31149","web_id":"a57a79ad","name":"ESSO","address":"Verbindungsweg  ","zip":"18055","city":"Rostock","lat":"54.0829098","lon":"12.1645775","mts_brand":"ESSO"},{"id":"33770","web_id":"d2c283ea","name":"Sonstige","address":"Hansestr. 47 ","zip":"18182","city":"Rostock-Bentwisch","lat":"54.11366","lon":"12.19276","mts_brand":"Supermarkt-Tankstelle"},{"id":"33947","web_id":"4361849b","name":"HEM","address":"Zum S\u00fcdtor 6","zip":"18147","city":"Rostock","lat":"54.1369547","lon":"12.1118795","mts_brand":"HEM"},{"id":"34594","web_id":"bcda8722","name":"JET","address":"Satower Str. 10A ","zip":"18059","city":"Rostock","lat":"54.0753617","lon":"12.09267","mts_brand":"JET"},{"id":"46584","web_id":"dd65b5f8","name":"Agip","address":"Schmarler Damm 9","zip":"18069","city":"Rostock","lat":"54.129373","lon":"12.0753222","mts_brand":"Agip"},{"id":"54001","web_id":"3560d2f1","name":"JET","address":"Werftstr. 45 ","zip":"18057","city":"Rostock","lat":"54.094965","lon":"12.1026204","mts_brand":"JET"},{"id":"59362","web_id":"0e09e7e2","name":"AVIA","address":"Am Liepengraben 18 18","zip":"18147","city":"Rostock","lat":"54.128434","lon":"12.1613073","mts_brand":"AVIA"},{"id":"85423","web_id":"835b14daf","name":"HEM","address":"Ost-West-Str. 13","zip":"18147","city":"Rostock","lat":"54.14565","lon":"12.115951","mts_brand":"HEM"},{"id":"85447","web_id":"d3e514dc7","name":"Sonstige","address":"Gielandstr. 2","zip":"18147","city":"Rostock","lat":"54.1261","lon":"12.1628","mts_brand":"Tankstelle"},{"id":"85485","web_id":"c7e414ded","name":"Sonstige","address":"Hansestr. 20-22","zip":"18182","city":"Rostock-Bentwisch","lat":"54.1274","lon":"12.1766","mts_brand":"team"}
	 	    ];
	
	  
	//parametriesierbar
	var searchText = "";//"<c:out value="${param.searchText}"/>";
	var typeOfSearch = "city";
	
	if(sec == 'list' && typeOfSearch != 'coord') {
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			address: 'Deutschland ' + searchText
			}, function(locResult) {
				lat = locResult[0].geometry.location.lat();
	            lon = locResult[0].geometry.location.lng();
			});
	} else {
	
        //var lat = 49.798456;
        //var lon = 9.942688;
        for(var i=0; i<locations.length; i++) {
        	if(wertestring == locations[i].web_id) {
        		var lat = parseFloat(locations[i].lat);
        		var lon = parseFloat(locations[i].lon);
        		console.log("else " + lon);
        	}
        }
        }
	
	function initialize() {		
		var mapOptions = {
		center: new google.maps.LatLng(lat, lon),
		zoom: 18,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		streetViewControl: false,
		mapTypeControl: false,
		overviewMapControl: false
		//disableDefaultUI: true,
	   	};
		map = new google.maps.Map(document.getElementById('map-test'), mapOptions);

	}
	
	function moveMap(moveLat, moveLon) {
		var moveLatLng  = new google.maps.LatLng(moveLat, moveLon);
		var marker = new google.maps.Marker({
			position: moveLatLng,
			map: map,
			title: "Hier bist du"
		});
		map.panTo(moveLatLng);
	}
	
	function usePosition(position) {
		document.getElementById('address').value = position.coords.latitude + ',' + position.coords.longitude;
		moveMap(position.coords.latitude, position.coords.longitude);
	}
	//TODO JSON
// 	function addListMarker() {
// 		$.getJSON("&result=json", function(data) {
// 			var items[];
// 			$.each(data.stations, function(station, val) {
// 				var setIcon = 'WEB-INF/resources/picture/gas_Station.png';
// 				var setLatLng = new google.maps.LatLng(val.lat, val.lon);
// 				marker = new google.maps.Marker({
// 					position: setLatLng,
// 					map: map,
// 					icon: setIcon
// 				});
// 				google.maps.event.addListener(marker, 'click', function() {
// 					window.location.href = '#';
// 				});
// 			});
// 		});
// 	}
	
// 	function addListMarker() {
// 		$.getJSON("/&result=json", function(results){
// 			$.each(data.stations, function(station, val){
// 					var latLng=new google.maps.LatLng(val.lat, val.lon);
// 					var marker=new google.maps.Marker({
// 						position: latLng,
// 						map: map
// 					});
// 			});
// 		});
// 	}
	
 	function addListMarker() {
			var setIcon = 'http://oi57.tinypic.com/1z1rd04.jpg';
			var array =[];
			
			for(var i=0; i<locations.length; i++) {
				var marker = new google.maps.Marker({
					position: new google.maps.LatLng(locations[i].lat, locations[i].lon),
					title: locations[i].mts_brand,
					icon: setIcon,
					map: map,
					id: locations[i].web_id
					
				});
				array.push(marker);
			}
			for(var k=0; k<array.length; k++) {
	
				new google.maps.event.addListener(array[k], 'click', function() {
					
		 			window.location.href='#' + this.id;
					
		 		});	 	
			}
 	}
 	
 	function addDetailMarker() {
 		map.setZoom(15);
 		var setIcon = 'http://oi57.tinypic.com/1z1rd04.jpg';
 		console.log("addDetailMarker " + wertestring);
 		var array =[];
 			
 				for (var i=0; i<locations.length; i++) {
 					console.log("inf ForSchleife " + wertestring);
 					if(locations[i].web_id === wertestring) {
 						console.log("in if " + wertestring);
 						console.log("location " + locations[i].lat +" | "+ locations[i].lon);
 						var setLatLng = new google.maps.LatLng(locations[i].lat, locations[i].lon);
 					//var LatLng = new google.maps.LatLng(locations[i].lat, locations[i].lon); 
 		  			var marker = new google.maps.Marker({
 		  				position: setLatLng,
 		  				map: map,
 		 				Icon: setIcon
 		 			});
 		  			array.push(marker);
 				}
 			}
 	}
 	
 	function Werteliste (querystring) {
 		  if (querystring == '') return;
 		  wertestring = querystring.slice(1);
 		  console.log("Was ist es " + wertestring);
 		  
 	}
 		  
 		  //var paare = wertestring.split("&");
 		  //var paar, 
 		 // var name, wert;
//  		  var web_id;
//  		  for (var i = 0; i < web_id.length; i++) {
//  		    paar = paare[i].split("=");
//  		    name = paar[0];
//  		    wert = paar[1];
//  		    name = unescape(name).replace("+", " ");
//  		    wert = unescape(wert).replace("+", " ");
//  		    this[name] = wert;
//  		  

	
	if(sec == '') {
		var watchId = navigator.geolocation.getCurrentPosition(usePosition);
		
	}
	
    if(sec == '' || sec == 'list' || sec == 'detail') {
        google.maps.event.addDomListener(window, 'load', initialize);
      }
    
    if(sec == 'detail') {
    	google.maps.event.addDomListener(window, 'load', addDetailMarker);
    }
    
    if(sec == 'list') {
    	google.maps.event.addDomListener(window, 'load', addListMarker);
    }
	
	
    //google.maps.event.addDomListener(window, 'load', initialize);
	
	
		//Autokompletioin
// 		autocomplete = new google.maps.places.Autocomplete(
// 				/** @type {HTMLInputElement} */
// 				(document.getElementById('address')),{
// 				//types: ['(cities)'],
// 				componentRestrictions: countryRestrict
// 			});
// 				places = new google.maps.places.PlacesService(map);
// 				google.maps.event.addListener(autocomplete, 'places_changed', onPlaceChanged);

		//navigator hat problem. wenn in initialize dann dauerhafte frage ob Standort ermittelt werden soll
// 		navigator.geolocation.getCurrentPosition(function(position){
// 			initialize(position.coords);
// 		}, function(){
// 			document.getElementById('pos').innerHTML = 'Deine Position konnte leider nicht ermittelt werden';
// 		});
		

// 	   // Try HTML5 geolocation
// 	   if(navigator.geolocation) {
// 		navigator.geolocation.getCurrentPosition(function(position) {
// 			//var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
// 			initialize(position.coords)
// 			var infowindow = new google.maps.InfoWindow({
// 				map: map,
// 				position: pos,
// 				//content: 'Dein aktueller Standpunkt.'
// 				content: 'Location found using HTML5.'
// 			});
// 			map.setCenter(pos);
// 		}, function() {
// 				handleNoGeolocation(true);
// 		});
// 	} else {
//     	// Browser doesn't support Geolocation
// 		handleNoGeolocation(false);
// 	}

	
// 	function onPlaceChanged() {
// 		var place = autocomplete.getPlace();
// 		if (place.geometry) {
// 			map.panTo(place.geometry.location);
// 			map.setZoom(16);
// 			//search();
// 		} else {
// 			document.getElementById('address');
// 		}
// 	}
      
//     function toggleBounce() {
//     	if (marker.getAnimation() != null) {
//     	    marker.setAnimation(null);
//     	} else {
//     	    marker.setAnimation(google.maps.Animation.BOUNCE);
//     	}
//    	}

//     function sucheAusfuehren(){
//     	codeAddress();
//     	tankstellenTabelleLaden();
//     }
      
    function tankstellenTabelleLaden(){

    <% 
    DBConnector.sucheTankstelleSQL("",request.getQueryString());   
    %>

    }
    
	function codeAddress() {
		var geocoder = new google.maps.Geocoder();
		var address = document.getElementById('address').value;
		geocoder.geocode( { 'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
			   		animation: google.maps.Animation.DROP,	
					map: map,
					position: results[0].geometry.location
				});
		  //google.maps.event.addListener(marker, 'click', toggleBounce);
		  	} else {
		  		alert('Geocode was not successful for the following reason: ' + status);
		  	}
		});
	}

    </script>
	
	  <div class="table-responsive">
	  <c:set var="tankstellenList" value="${dbconnector.tankstellenList}"/>
	  <table class="table table-bordered table-hover">
	  <tr>
	  	<td><b>Nr</b></td>
	  	<td><b>Name</b></td>
	  	<td><b>Straße</b></td>
	  	<td><b>Ort</b></td>
	  	<td><b>PLZ</b></td>
	  	<td><b>E10</b></td>
	  	<td><b>Super</b></td>
	  	<td><b>SuperPlus</b></td>
	  	<td><b>Diesel</b></td>
	  	<td><b>VPowerDiesel</b></td>
	  </tr>
	  <c:forEach items="${tankstellenList}" var="zeile">
	  <tr>
	  	<c:forEach  items ="${zeile}" var="spaltenInhalt">
	  	  <td>
	  		  <c:out value="${spaltenInhalt}"/>
	  	</td>
	  	</c:forEach>
	  </tr>   
    </c:forEach>
	 </table>
	 </div>
	 <div>
	</div>
      <hr>
      <footer>
        <p>&copy; Smoking Brains 2013 - 2014</p>
      </footer>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    if("undefined"==typeof jQuery) throw new Error("Bootstrap requires jQuery");+function(a){"use strict";function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(void 0!==a.style[c])return{end:b[c]}}a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one(a.support.transition.end,function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b()})}(jQuery),+function(a){"use strict";var b='[data-dismiss="alert"]',c=function(c){a(c).on("click",b,this.close)};c.prototype.close=function(b){function c(){f.trigger("closed.bs.alert").remove()}var d=a(this),e=d.attr("data-target");e||(e=d.attr("href"),e=e&&e.replace(/.*(?=#[^\s]*$)/,""));var f=a(e);b&&b.preventDefault(),f.length||(f=d.hasClass("alert")?d:d.parent()),f.trigger(b=a.Event("close.bs.alert")),b.isDefaultPrevented()||(f.removeClass("in"),a.support.transition&&f.hasClass("fade")?f.one(a.support.transition.end,c).emulateTransitionEnd(150):c())};var d=a.fn.alert;a.fn.alert=function(b){return this.each(function(){var d=a(this),e=d.data("bs.alert");e||d.data("bs.alert",e=new c(this)),"string"==typeof b&&e[b].call(d)})},a.fn.alert.Constructor=c,a.fn.alert.noConflict=function(){return a.fn.alert=d,this},a(document).on("click.bs.alert.data-api",b,c.prototype.close)}(jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d)};b.DEFAULTS={loadingText:"loading..."},b.prototype.setState=function(a){var b="disabled",c=this.$element,d=c.is("input")?"val":"html",e=c.data();a+="Text",e.resetText||c.data("resetText",c[d]()),c[d](e[a]||this.options[a]),setTimeout(function(){"loadingText"==a?c.addClass(b).attr(b,b):c.removeClass(b).removeAttr(b)},0)},b.prototype.toggle=function(){var a=this.$element.closest('[data-toggle="buttons"]');if(a.length){var b=this.$element.find("input").prop("checked",!this.$element.hasClass("active")).trigger("change");"radio"===b.prop("type")&&a.find(".active").removeClass("active")}this.$element.toggleClass("active")};var c=a.fn.button;a.fn.button=function(c){return this.each(function(){var d=a(this),e=d.data("bs.button"),f="object"==typeof c&&c;e||d.data("bs.button",e=new b(this,f)),"toggle"==c?e.toggle():c&&e.setState(c)})},a.fn.button.Constructor=b,a.fn.button.noConflict=function(){return a.fn.button=c,this},a(document).on("click.bs.button.data-api","[data-toggle^=button]",function(b){var c=a(b.target);c.hasClass("btn")||(c=c.closest(".btn")),c.button("toggle"),b.preventDefault()})}(jQuery),+function(a){"use strict";var b=function(b,c){this.$element=a(b),this.$indicators=this.$element.find(".carousel-indicators"),this.options=c,this.paused=this.sliding=this.interval=this.$active=this.$items=null,"hover"==this.options.pause&&this.$element.on("mouseenter",a.proxy(this.pause,this)).on("mouseleave",a.proxy(this.cycle,this))};b.DEFAULTS={interval:5e3,pause:"hover",wrap:!0},b.prototype.cycle=function(b){return b||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(a.proxy(this.next,this),this.options.interval)),this},b.prototype.getActiveIndex=function(){return this.$active=this.$element.find(".item.active"),this.$items=this.$active.parent().children(),this.$items.index(this.$active)},b.prototype.to=function(b){var c=this,d=this.getActiveIndex();return b>this.$items.length-1||0>b?void 0:this.sliding?this.$element.one("slid",function(){c.to(b)}):d==b?this.pause().cycle():this.slide(b>d?"next":"prev",a(this.$items[b]))},b.prototype.pause=function(b){return b||(this.paused=!0),this.$element.find(".next, .prev").length&&a.support.transition.end&&(this.$element.trigger(a.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},b.prototype.next=function(){return this.sliding?void 0:this.slide("next")},b.prototype.prev=function(){return this.sliding?void 0:this.slide("prev")},b.prototype.slide=function(b,c){var d=this.$element.find(".item.active"),e=c||d[b](),f=this.interval,g="next"==b?"left":"right",h="next"==b?"first":"last",i=this;if(!e.length){if(!this.options.wrap)return;e=this.$element.find(".item")[h]()}this.sliding=!0,f&&this.pause();var j=a.Event("slide.bs.carousel",{relatedTarget:e[0],direction:g});if(!e.hasClass("active")){if(this.$indicators.length&&(this.$indicators.find(".active").removeClass("active"),this.$element.one("slid",function(){var b=a(i.$indicators.children()[i.getActiveIndex()]);b&&b.addClass("active")})),a.support.transition&&this.$element.hasClass("slide")){if(this.$element.trigger(j),j.isDefaultPrevented())return;e.addClass(b),e[0].offsetWidth,d.addClass(g),e.addClass(g),d.one(a.support.transition.end,function(){e.removeClass([b,g].join(" ")).addClass("active"),d.removeClass(["active",g].join(" ")),i.sliding=!1,setTimeout(function(){i.$element.trigger("slid")},0)}).emulateTransitionEnd(600)}else{if(this.$element.trigger(j),j.isDefaultPrevented())return;d.removeClass("active"),e.addClass("active"),this.sliding=!1,this.$element.trigger("slid")}return f&&this.cycle(),this}};var c=a.fn.carousel;a.fn.carousel=function(c){return this.each(function(){var d=a(this),e=d.data("bs.carousel"),f=a.extend({},b.DEFAULTS,d.data(),"object"==typeof c&&c),g="string"==typeof c?c:f.slide;e||d.data("bs.carousel",e=new b(this,f)),"number"==typeof c?e.to(c):g?e[g]():f.interval&&e.pause().cycle()})},a.fn.carousel.Constructor=b,a.fn.carousel.noConflict=function(){return a.fn.carousel=c,this},a(document).on("click.bs.carousel.data-api","[data-slide], [data-slide-to]",function(b){var c,d=a(this),e=a(d.attr("data-target")||(c=d.attr("href"))&&c.replace(/.*(?=#[^\s]+$)/,"")),f=a.extend({},e.data(),d.data()),g=d.attr("data-slide-to");g&&(f.interval=!1),e.carousel(f),(g=d.attr("data-slide-to"))&&e.data("bs.carousel").to(g),b.preventDefault()}),a(window).on("load",function(){a('[data-ride="carousel"]').each(function(){var b=a(this);b.carousel(b.data())})})}(jQuery),+function(a){"use strict";var b=function(c,d){this.$element=a(c),this.options=a.extend({},b.DEFAULTS,d),this.transitioning=null,this.options.parent&&(this.$parent=a(this.options.parent)),this.options.toggle&&this.toggle()};b.DEFAULTS={toggle:!0},b.prototype.dimension=function(){var a=this.$element.hasClass("width");return a?"width":"height"},b.prototype.show=function(){if(!this.transitioning&&!this.$element.hasClass("in")){var b=a.Event("show.bs.collapse");if(this.$element.trigger(b),!b.isDefaultPrevented()){var c=this.$parent&&this.$parent.find("> .panel > .in");if(c&&c.length){var d=c.data("bs.collapse");if(d&&d.transitioning)return;c.collapse("hide"),d||c.data("bs.collapse",null)}var e=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[e](0),this.transitioning=1;var f=function(){this.$element.removeClass("collapsing").addClass("in")[e]("auto"),this.transitioning=0,this.$element.trigger("shown.bs.collapse")};if(!a.support.transition)return f.call(this);var g=a.camelCase(["scroll",e].join("-"));this.$element.one(a.support.transition.end,a.proxy(f,this)).emulateTransitionEnd(350)[e](this.$element[0][g])}}},b.prototype.hide=function(){if(!this.transitioning&&this.$element.hasClass("in")){var b=a.Event("hide.bs.collapse");if(this.$element.trigger(b),!b.isDefaultPrevented()){var c=this.dimension();this.$element[c](this.$element[c]())[0].offsetHeight,this.$element.addClass("collapsing").removeClass("collapse").removeClass("in"),this.transitioning=1;var d=function(){this.transitioning=0,this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")};return a.support.transition?(this.$element[c](0).one(a.support.transition.end,a.proxy(d,this)).emulateTransitionEnd(350),void 0):d.call(this)}}},b.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()};var c=a.fn.collapse;a.fn.collapse=function(c){return this.each(function(){var d=a(this),e=d.data("bs.collapse"),f=a.extend({},b.DEFAULTS,d.data(),"object"==typeof c&&c);e||d.data("bs.collapse",e=new b(this,f)),"string"==typeof c&&e[c]()})},a.fn.collapse.Constructor=b,a.fn.collapse.noConflict=function(){return a.fn.collapse=c,this},a(document).on("click.bs.collapse.data-api","[data-toggle=collapse]",function(b){var c,d=a(this),e=d.attr("data-target")||b.preventDefault()||(c=d.attr("href"))&&c.replace(/.*(?=#[^\s]+$)/,""),f=a(e),g=f.data("bs.collapse"),h=g?"toggle":d.data(),i=d.attr("data-parent"),j=i&&a(i);g&&g.transitioning||(j&&j.find('[data-toggle=collapse][data-parent="'+i+'"]').not(d).addClass("collapsed"),d[f.hasClass("in")?"addClass":"removeClass"]("collapsed")),f.collapse(h)})}(jQuery),+function(a){"use strict";function b(){a(d).remove(),a(e).each(function(b){var d=c(a(this));d.hasClass("open")&&(d.trigger(b=a.Event("hide.bs.dropdown")),b.isDefaultPrevented()||d.removeClass("open").trigger("hidden.bs.dropdown"))})}function c(b){var c=b.attr("data-target");c||(c=b.attr("href"),c=c&&/#/.test(c)&&c.replace(/.*(?=#[^\s]*$)/,""));var d=c&&a(c);return d&&d.length?d:b.parent()}var d=".dropdown-backdrop",e="[data-toggle=dropdown]",f=function(b){a(b).on("click.bs.dropdown",this.toggle)};f.prototype.toggle=function(d){var e=a(this);if(!e.is(".disabled, :disabled")){var f=c(e),g=f.hasClass("open");if(b(),!g){if("ontouchstart"in document.documentElement&&!f.closest(".navbar-nav").length&&a('<div class="dropdown-backdrop"/>').insertAfter(a(this)).on("click",b),f.trigger(d=a.Event("show.bs.dropdown")),d.isDefaultPrevented())return;f.toggleClass("open").trigger("shown.bs.dropdown"),e.focus()}return!1}},f.prototype.keydown=function(b){if(/(38|40|27)/.test(b.keyCode)){var d=a(this);if(b.preventDefault(),b.stopPropagation(),!d.is(".disabled, :disabled")){var f=c(d),g=f.hasClass("open");if(!g||g&&27==b.keyCode)return 27==b.which&&f.find(e).focus(),d.click();var h=a("[role=menu] li:not(.divider):visible a",f);if(h.length){var i=h.index(h.filter(":focus"));38==b.keyCode&&i>0&&i--,40==b.keyCode&&i<h.length-1&&i++,~i||(i=0),h.eq(i).focus()}}}};var g=a.fn.dropdown;a.fn.dropdown=function(b){return this.each(function(){var c=a(this),d=c.data("dropdown");d||c.data("dropdown",d=new f(this)),"string"==typeof b&&d[b].call(c)})},a.fn.dropdown.Constructor=f,a.fn.dropdown.noConflict=function(){return a.fn.dropdown=g,this},a(document).on("click.bs.dropdown.data-api",b).on("click.bs.dropdown.data-api",".dropdown form",function(a){a.stopPropagation()}).on("click.bs.dropdown.data-api",e,f.prototype.toggle).on("keydown.bs.dropdown.data-api",e+", [role=menu]",f.prototype.keydown)}(jQuery),+function(a){"use strict";var b=function(b,c){this.options=c,this.$element=a(b),this.$backdrop=this.isShown=null,this.options.remote&&this.$element.load(this.options.remote)};b.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},b.prototype.toggle=function(a){return this[this.isShown?"hide":"show"](a)},b.prototype.show=function(b){var c=this,d=a.Event("show.bs.modal",{relatedTarget:b});this.$element.trigger(d),this.isShown||d.isDefaultPrevented()||(this.isShown=!0,this.escape(),this.$element.on("click.dismiss.modal",'[data-dismiss="modal"]',a.proxy(this.hide,this)),this.backdrop(function(){var d=a.support.transition&&c.$element.hasClass("fade");c.$element.parent().length||c.$element.appendTo(document.body),c.$element.show(),d&&c.$element[0].offsetWidth,c.$element.addClass("in").attr("aria-hidden",!1),c.enforceFocus();var e=a.Event("shown.bs.modal",{relatedTarget:b});d?c.$element.find(".modal-dialog").one(a.support.transition.end,function(){c.$element.focus().trigger(e)}).emulateTransitionEnd(300):c.$element.focus().trigger(e)}))},b.prototype.hide=function(b){b&&b.preventDefault(),b=a.Event("hide.bs.modal"),this.$element.trigger(b),this.isShown&&!b.isDefaultPrevented()&&(this.isShown=!1,this.escape(),a(document).off("focusin.bs.modal"),this.$element.removeClass("in").attr("aria-hidden",!0).off("click.dismiss.modal"),a.support.transition&&this.$element.hasClass("fade")?this.$element.one(a.support.transition.end,a.proxy(this.hideModal,this)).emulateTransitionEnd(300):this.hideModal())},b.prototype.enforceFocus=function(){a(document).off("focusin.bs.modal").on("focusin.bs.modal",a.proxy(function(a){this.$element[0]===a.target||this.$element.has(a.target).length||this.$element.focus()},this))},b.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keyup.dismiss.bs.modal",a.proxy(function(a){27==a.which&&this.hide()},this)):this.isShown||this.$element.off("keyup.dismiss.bs.modal")},b.prototype.hideModal=function(){var a=this;this.$element.hide(),this.backdrop(function(){a.removeBackdrop(),a.$element.trigger("hidden.bs.modal")})},b.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},b.prototype.backdrop=function(b){var c=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var d=a.support.transition&&c;if(this.$backdrop=a('<div class="modal-backdrop '+c+'" />').appendTo(document.body),this.$element.on("click.dismiss.modal",a.proxy(function(a){a.target===a.currentTarget&&("static"==this.options.backdrop?this.$element[0].focus.call(this.$element[0]):this.hide.call(this))},this)),d&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),!b)return;d?this.$backdrop.one(a.support.transition.end,b).emulateTransitionEnd(150):b()}else!this.isShown&&this.$backdrop?(this.$backdrop.removeClass("in"),a.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one(a.support.transition.end,b).emulateTransitionEnd(150):b()):b&&b()};var c=a.fn.modal;a.fn.modal=function(c,d){return this.each(function(){var e=a(this),f=e.data("bs.modal"),g=a.extend({},b.DEFAULTS,e.data(),"object"==typeof c&&c);f||e.data("bs.modal",f=new b(this,g)),"string"==typeof c?f[c](d):g.show&&f.show(d)})},a.fn.modal.Constructor=b,a.fn.modal.noConflict=function(){return a.fn.modal=c,this},a(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(b){var c=a(this),d=c.attr("href"),e=a(c.attr("data-target")||d&&d.replace(/.*(?=#[^\s]+$)/,"")),f=e.data("modal")?"toggle":a.extend({remote:!/#/.test(d)&&d},e.data(),c.data());b.preventDefault(),e.modal(f,this).one("hide",function(){c.is(":visible")&&c.focus()})}),a(document).on("show.bs.modal",".modal",function(){a(document.body).addClass("modal-open")}).on("hidden.bs.modal",".modal",function(){a(document.body).removeClass("modal-open")})}(jQuery),+function(a){"use strict";var b=function(a,b){this.type=this.options=this.enabled=this.timeout=this.hoverState=this.$element=null,this.init("tooltip",a,b)};b.DEFAULTS={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1},b.prototype.init=function(b,c,d){this.enabled=!0,this.type=b,this.$element=a(c),this.options=this.getOptions(d);for(var e=this.options.trigger.split(" "),f=e.length;f--;){var g=e[f];if("click"==g)this.$element.on("click."+this.type,this.options.selector,a.proxy(this.toggle,this));else if("manual"!=g){var h="hover"==g?"mouseenter":"focus",i="hover"==g?"mouseleave":"blur";this.$element.on(h+"."+this.type,this.options.selector,a.proxy(this.enter,this)),this.$element.on(i+"."+this.type,this.options.selector,a.proxy(this.leave,this))}}this.options.selector?this._options=a.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},b.prototype.getDefaults=function(){return b.DEFAULTS},b.prototype.getOptions=function(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b),b.delay&&"number"==typeof b.delay&&(b.delay={show:b.delay,hide:b.delay}),b},b.prototype.getDelegateOptions=function(){var b={},c=this.getDefaults();return this._options&&a.each(this._options,function(a,d){c[a]!=d&&(b[a]=d)}),b},b.prototype.enter=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs."+this.type);return clearTimeout(c.timeout),c.hoverState="in",c.options.delay&&c.options.delay.show?(c.timeout=setTimeout(function(){"in"==c.hoverState&&c.show()},c.options.delay.show),void 0):c.show()},b.prototype.leave=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs."+this.type);return clearTimeout(c.timeout),c.hoverState="out",c.options.delay&&c.options.delay.hide?(c.timeout=setTimeout(function(){"out"==c.hoverState&&c.hide()},c.options.delay.hide),void 0):c.hide()},b.prototype.show=function(){var b=a.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){if(this.$element.trigger(b),b.isDefaultPrevented())return;var c=this.tip();this.setContent(),this.options.animation&&c.addClass("fade");var d="function"==typeof this.options.placement?this.options.placement.call(this,c[0],this.$element[0]):this.options.placement,e=/\s?auto?\s?/i,f=e.test(d);f&&(d=d.replace(e,"")||"top"),c.detach().css({top:0,left:0,display:"block"}).addClass(d),this.options.container?c.appendTo(this.options.container):c.insertAfter(this.$element);var g=this.getPosition(),h=c[0].offsetWidth,i=c[0].offsetHeight;if(f){var j=this.$element.parent(),k=d,l=document.documentElement.scrollTop||document.body.scrollTop,m="body"==this.options.container?window.innerWidth:j.outerWidth(),n="body"==this.options.container?window.innerHeight:j.outerHeight(),o="body"==this.options.container?0:j.offset().left;d="bottom"==d&&g.top+g.height+i-l>n?"top":"top"==d&&g.top-l-i<0?"bottom":"right"==d&&g.right+h>m?"left":"left"==d&&g.left-h<o?"right":d,c.removeClass(k).addClass(d)}var p=this.getCalculatedOffset(d,g,h,i);this.applyPlacement(p,d),this.$element.trigger("shown.bs."+this.type)}},b.prototype.applyPlacement=function(a,b){var c,d=this.tip(),e=d[0].offsetWidth,f=d[0].offsetHeight,g=parseInt(d.css("margin-top"),10),h=parseInt(d.css("margin-left"),10);isNaN(g)&&(g=0),isNaN(h)&&(h=0),a.top=a.top+g,a.left=a.left+h,d.offset(a).addClass("in");var i=d[0].offsetWidth,j=d[0].offsetHeight;if("top"==b&&j!=f&&(c=!0,a.top=a.top+f-j),/bottom|top/.test(b)){var k=0;a.left<0&&(k=-2*a.left,a.left=0,d.offset(a),i=d[0].offsetWidth,j=d[0].offsetHeight),this.replaceArrow(k-e+i,i,"left")}else this.replaceArrow(j-f,j,"top");c&&d.offset(a)},b.prototype.replaceArrow=function(a,b,c){this.arrow().css(c,a?50*(1-a/b)+"%":"")},b.prototype.setContent=function(){var a=this.tip(),b=this.getTitle();a.find(".tooltip-inner")[this.options.html?"html":"text"](b),a.removeClass("fade in top bottom left right")},b.prototype.hide=function(){function b(){"in"!=c.hoverState&&d.detach()}var c=this,d=this.tip(),e=a.Event("hide.bs."+this.type);return this.$element.trigger(e),e.isDefaultPrevented()?void 0:(d.removeClass("in"),a.support.transition&&this.$tip.hasClass("fade")?d.one(a.support.transition.end,b).emulateTransitionEnd(150):b(),this.$element.trigger("hidden.bs."+this.type),this)},b.prototype.fixTitle=function(){var a=this.$element;(a.attr("title")||"string"!=typeof a.attr("data-original-title"))&&a.attr("data-original-title",a.attr("title")||"").attr("title","")},b.prototype.hasContent=function(){return this.getTitle()},b.prototype.getPosition=function(){var b=this.$element[0];return a.extend({},"function"==typeof b.getBoundingClientRect?b.getBoundingClientRect():{width:b.offsetWidth,height:b.offsetHeight},this.$element.offset())},b.prototype.getCalculatedOffset=function(a,b,c,d){return"bottom"==a?{top:b.top+b.height,left:b.left+b.width/2-c/2}:"top"==a?{top:b.top-d,left:b.left+b.width/2-c/2}:"left"==a?{top:b.top+b.height/2-d/2,left:b.left-c}:{top:b.top+b.height/2-d/2,left:b.left+b.width}},b.prototype.getTitle=function(){var a,b=this.$element,c=this.options;return a=b.attr("data-original-title")||("function"==typeof c.title?c.title.call(b[0]):c.title)},b.prototype.tip=function(){return this.$tip=this.$tip||a(this.options.template)},b.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},b.prototype.validate=function(){this.$element[0].parentNode||(this.hide(),this.$element=null,this.options=null)},b.prototype.enable=function(){this.enabled=!0},b.prototype.disable=function(){this.enabled=!1},b.prototype.toggleEnabled=function(){this.enabled=!this.enabled},b.prototype.toggle=function(b){var c=b?a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs."+this.type):this;c.tip().hasClass("in")?c.leave(c):c.enter(c)},b.prototype.destroy=function(){this.hide().$element.off("."+this.type).removeData("bs."+this.type)};var c=a.fn.tooltip;a.fn.tooltip=function(c){return this.each(function(){var d=a(this),e=d.data("bs.tooltip"),f="object"==typeof c&&c;e||d.data("bs.tooltip",e=new b(this,f)),"string"==typeof c&&e[c]()})},a.fn.tooltip.Constructor=b,a.fn.tooltip.noConflict=function(){return a.fn.tooltip=c,this}}(jQuery),+function(a){"use strict";var b=function(a,b){this.init("popover",a,b)};if(!a.fn.tooltip)throw new Error("Popover requires tooltip.js");b.DEFAULTS=a.extend({},a.fn.tooltip.Constructor.DEFAULTS,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),b.prototype=a.extend({},a.fn.tooltip.Constructor.prototype),b.prototype.constructor=b,b.prototype.getDefaults=function(){return b.DEFAULTS},b.prototype.setContent=function(){var a=this.tip(),b=this.getTitle(),c=this.getContent();a.find(".popover-title")[this.options.html?"html":"text"](b),a.find(".popover-content")[this.options.html?"html":"text"](c),a.removeClass("fade top bottom left right in"),a.find(".popover-title").html()||a.find(".popover-title").hide()},b.prototype.hasContent=function(){return this.getTitle()||this.getContent()},b.prototype.getContent=function(){var a=this.$element,b=this.options;return a.attr("data-content")||("function"==typeof b.content?b.content.call(a[0]):b.content)},b.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".arrow")},b.prototype.tip=function(){return this.$tip||(this.$tip=a(this.options.template)),this.$tip};var c=a.fn.popover;a.fn.popover=function(c){return this.each(function(){var d=a(this),e=d.data("bs.popover"),f="object"==typeof c&&c;e||d.data("bs.popover",e=new b(this,f)),"string"==typeof c&&e[c]()})},a.fn.popover.Constructor=b,a.fn.popover.noConflict=function(){return a.fn.popover=c,this}}(jQuery),+function(a){"use strict";function b(c,d){var e,f=a.proxy(this.process,this);this.$element=a(c).is("body")?a(window):a(c),this.$body=a("body"),this.$scrollElement=this.$element.on("scroll.bs.scroll-spy.data-api",f),this.options=a.extend({},b.DEFAULTS,d),this.selector=(this.options.target||(e=a(c).attr("href"))&&e.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.offsets=a([]),this.targets=a([]),this.activeTarget=null,this.refresh(),this.process()}b.DEFAULTS={offset:10},b.prototype.refresh=function(){var b=this.$element[0]==window?"offset":"position";this.offsets=a([]),this.targets=a([]);var c=this;this.$body.find(this.selector).map(function(){var d=a(this),e=d.data("target")||d.attr("href"),f=/^#\w/.test(e)&&a(e);return f&&f.length&&[[f[b]().top+(!a.isWindow(c.$scrollElement.get(0))&&c.$scrollElement.scrollTop()),e]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){c.offsets.push(this[0]),c.targets.push(this[1])})},b.prototype.process=function(){var a,b=this.$scrollElement.scrollTop()+this.options.offset,c=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,d=c-this.$scrollElement.height(),e=this.offsets,f=this.targets,g=this.activeTarget;if(b>=d)return g!=(a=f.last()[0])&&this.activate(a);for(a=e.length;a--;)g!=f[a]&&b>=e[a]&&(!e[a+1]||b<=e[a+1])&&this.activate(f[a])},b.prototype.activate=function(b){this.activeTarget=b,a(this.selector).parents(".active").removeClass("active");var c=this.selector+'[data-target="'+b+'"],'+this.selector+'[href="'+b+'"]',d=a(c).parents("li").addClass("active");d.parent(".dropdown-menu").length&&(d=d.closest("li.dropdown").addClass("active")),d.trigger("activate")};var c=a.fn.scrollspy;a.fn.scrollspy=function(c){return this.each(function(){var d=a(this),e=d.data("bs.scrollspy"),f="object"==typeof c&&c;e||d.data("bs.scrollspy",e=new b(this,f)),"string"==typeof c&&e[c]()})},a.fn.scrollspy.Constructor=b,a.fn.scrollspy.noConflict=function(){return a.fn.scrollspy=c,this},a(window).on("load",function(){a('[data-spy="scroll"]').each(function(){var b=a(this);b.scrollspy(b.data())})})}(jQuery),+function(a){"use strict";var b=function(b){this.element=a(b)};b.prototype.show=function(){var b=this.element,c=b.closest("ul:not(.dropdown-menu)"),d=b.data("target");if(d||(d=b.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,"")),!b.parent("li").hasClass("active")){var e=c.find(".active:last a")[0],f=a.Event("show.bs.tab",{relatedTarget:e});if(b.trigger(f),!f.isDefaultPrevented()){var g=a(d);this.activate(b.parent("li"),c),this.activate(g,g.parent(),function(){b.trigger({type:"shown.bs.tab",relatedTarget:e})})}}},b.prototype.activate=function(b,c,d){function e(){f.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),b.addClass("active"),g?(b[0].offsetWidth,b.addClass("in")):b.removeClass("fade"),b.parent(".dropdown-menu")&&b.closest("li.dropdown").addClass("active"),d&&d()}var f=c.find("> .active"),g=d&&a.support.transition&&f.hasClass("fade");g?f.one(a.support.transition.end,e).emulateTransitionEnd(150):e(),f.removeClass("in")};var c=a.fn.tab;a.fn.tab=function(c){return this.each(function(){var d=a(this),e=d.data("bs.tab");e||d.data("bs.tab",e=new b(this)),"string"==typeof c&&e[c]()})},a.fn.tab.Constructor=b,a.fn.tab.noConflict=function(){return a.fn.tab=c,this},a(document).on("click.bs.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(b){b.preventDefault(),a(this).tab("show")})}(jQuery),+function(a){"use strict";var b=function(c,d){this.options=a.extend({},b.DEFAULTS,d),this.$window=a(window).on("scroll.bs.affix.data-api",a.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",a.proxy(this.checkPositionWithEventLoop,this)),this.$element=a(c),this.affixed=this.unpin=null,this.checkPosition()};b.RESET="affix affix-top affix-bottom",b.DEFAULTS={offset:0},b.prototype.checkPositionWithEventLoop=function(){setTimeout(a.proxy(this.checkPosition,this),1)},b.prototype.checkPosition=function(){if(this.$element.is(":visible")){var c=a(document).height(),d=this.$window.scrollTop(),e=this.$element.offset(),f=this.options.offset,g=f.top,h=f.bottom;"object"!=typeof f&&(h=g=f),"function"==typeof g&&(g=f.top()),"function"==typeof h&&(h=f.bottom());var i=null!=this.unpin&&d+this.unpin<=e.top?!1:null!=h&&e.top+this.$element.height()>=c-h?"bottom":null!=g&&g>=d?"top":!1;this.affixed!==i&&(this.unpin&&this.$element.css("top",""),this.affixed=i,this.unpin="bottom"==i?e.top-d:null,this.$element.removeClass(b.RESET).addClass("affix"+(i?"-"+i:"")),"bottom"==i&&this.$element.offset({top:document.body.offsetHeight-h-this.$element.height()}))}};var c=a.fn.affix;a.fn.affix=function(c){return this.each(function(){var d=a(this),e=d.data("bs.affix"),f="object"==typeof c&&c;e||d.data("bs.affix",e=new b(this,f)),"string"==typeof c&&e[c]()})},a.fn.affix.Constructor=b,a.fn.affix.noConflict=function(){return a.fn.affix=c,this},a(window).on("load",function(){a('[data-spy="affix"]').each(function(){var b=a(this),c=b.data();c.offset=c.offset||{},c.offsetBottom&&(c.offset.bottom=c.offsetBottom),c.offsetTop&&(c.offset.top=c.offsetTop),b.affix(c)})})}(jQuery);
    </script>
  </body>
</html>
