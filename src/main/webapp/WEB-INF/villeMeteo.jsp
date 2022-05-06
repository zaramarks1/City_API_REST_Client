
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>View ville</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<%@include file="navbar.jsp"%>
<%@include file="css.jsp"%>

</head>


<body>

	<c:if test="${villeId != null}">
	<div align = center>
		<div style="float: left; width: 50%">

			<h1>La ville </h1>

					<h3 class="label">Nom</h3>
					<h4 id="nomCommune"></h4>
					 
					<h3 class="label">Code Commune INSEE</h3>
					<h4 id="codeCommuneINSEE"></h4>
					
					<h3 class="label">Code postal</h3>
					<h4 id="codePostal"></h4>

					<h3 class="label">Libéllé acheminnement</h3>
					<h4 id="libelle"></h4>


					<h3 class="label">Ligne 5</h3>
					<h4 id="ligne5"></h4>

					<h3 class="label">Longitude</h3>
					<h4 id="longitude"></h4>


					<h3 class="label">Latitude</h3>
					<h4 id="latitude"></h4>

			
			</div>
		
			<div  style="float: right; width: 50%">

			<h1>La meteo </h1>

					<h3 class="label">General</h3>
					<h4 id="general"></h4>
					 
					<h3 class="label">Description</h3>
					<h4 id="description"></h4>
					
					<h3 class="label">Temperature Actuel</h3>
					<h4 id="temp"></h4>

					<h3 class="label">Sensation</h3>
					<h4 id="sensation"></h4>


					<h3 class="label">Temperature minimale</h3>
					<h4 id="tempmin"></h4>

					<h3 class="label">Temperature maximale</h3>
					<h4 id="tempmax"></h4>


					<h3 class="label">Humidité</h3>
					<h4 id="humidite"></h4>
					
					<h3 class="label">Velocité vent</h3>
					<h4 id="vent"></h4>
		
		</div>

		
	</div>
			
	</c:if>
	<script type="text/javascript">
	
		
	fetch("http://localhost:8081/ville/" +${villeId})
	.then((res) => res.json())
	.then((data) => {
				          
	console.log(data.nomCommune);
				        	   
	document.getElementById('nomCommune').innerHTML =data.nomCommune
	document.getElementById('codeCommuneINSEE').innerHTML =data.codeCommuneINSEE
	document.getElementById('codePostal').innerHTML =data.codePostal
	document.getElementById('libelle').innerHTML =data.libelleAcheminement
	document.getElementById('ligne5').innerHTML =data.ligne5
	document.getElementById('latitude').innerHTML =data.latitude
	document.getElementById('longitude').innerHTML =data.longitude	
	
	fetch("https://api.openweathermap.org/data/2.5/weather?lat="+data.latitude+"&lon="+data.longitude+"&appid=3cba85ef17788b3b59370dc12e9ef119&lang=fr&units=metric" )
	.then((res) => res.json())
	.then((data) => {
		
		document.getElementById('general').innerHTML =data.weather.main 
		document.getElementById('description').innerHTML =data.weather.description
		document.getElementById('temp').innerHTML =data.main.temp + "o celcius"
		document.getElementById('sensation').innerHTML =data.main.feels_like + "o celcius"
		document.getElementById('tempmin').innerHTML =data.main.temp_min + "o celcius"
		document.getElementById('tempmax').innerHTML =data.main.temp_max + "o celcius"
		document.getElementById('humidite').innerHTML =data.humidity
		document.getElementById('vent').innerHTML =data.wind.speed	
				          
	console.log(data);
				        	  	
		           
	})
		
	})
	
	
			
				    
			
	
	</script>


</body>
</html>