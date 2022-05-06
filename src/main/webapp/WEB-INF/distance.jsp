
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Distance entre deux villes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">



<%@include file="navbar.jsp"%>
 <%@include file="css.jsp"%>

<style>
.dropdown-content {
	display: show;
	background-color: #f6f6f6;
	min-width: 230px;
	border: 1px solid #ddd;
	z-index: 1;
	display: block;
}
</style>
</head>

<body>

<div align = center>
<h1>Calculer la distance entre deux villes</h1>
	<c:if test="${ville1 == null && ville2== null}">

		<form id="distance"  method="post">

			<div class="">

				<h2>Ville 1</h2>

				<select name="ville1Id" id="ville1" placeholder="Choisir une ville"
					class="dropdown-content" required>
				</select>

			</div>

			<div class="">

				<h2>Ville 2</h2>

				<select name="ville2Id" id="ville2" placeholder="Choisir une ville"
					class="dropdown-content" required>
				</select>
			</div>

			<div class="distance">
				<input  class="button" value="Calculate Distance" id="distance"
					type="submit" />
			</div>



		</form>
		
		
		<h2 id= "distanceTotal"> </h2>



	</c:if>
	
</div>

	<script type="text/javascript">

	var ville1 = document.getElementById("ville1");
  	var ville2 = document.getElementById("ville2");
  	
	  fetch("http://localhost:8081/ville/all")
	  .then((res) => res.json())
	  .then((data) => {
	         data.forEach((ville) => {
      	  

      	var option1 = document.createElement("option");
      	var option2 = document.createElement("option");
        
        
        option1.value = ville.id;
        option1.text = ville.nomCommune;
        
        option2.value = ville.id;
        option2.text = ville.nomCommune;
        
        ville1.add(option1);
        ville2.add(option2);
      	 

         });   
  })
  
  	function distance(lat1, lon1, lat2, lon2, unit) {
	    if ((lat1 == lat2) && (lon1 == lon2)) {
	        return 0;
	    }
	    else {
	        var radlat1 = Math.PI * lat1/180;
	        var radlat2 = Math.PI * lat2/180;
	        var theta = lon1-lon2;
	        var radtheta = Math.PI * theta/180;
	        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
	        if (dist > 1) {
	            dist = 1;
	        }
	        dist = Math.acos(dist);
	        dist = dist * 180/Math.PI;
	        dist = dist * 60 * 1.1515;
	        if (unit=="K") { dist = dist * 1.609344 }
	        if (unit=="N") { dist = dist * 0.8684 }
	        return dist;
	    }
}
	  
  	


	var form = document.getElementById('distance');
	form.addEventListener('submit', function(e){
		
		e.preventDefault()

		var ville1 = document.getElementById('ville1').value
		var ville2 = document.getElementById('ville2').value
		
		var lat1, lon1, lat2, lon2
		
		var data1, data2;
		
		 fetch("http://localhost:8081/ville/" + ville1)
	    .then((res) => res.json())
	    .then((data) => {
	        	
		lat1 = data.latitude;
		lon1 = data.longitude;
		

		 fetch("http://localhost:8081/ville/" + ville2)
		    .then((res) => res.json())
		    .then((data) => {
		          
		        	
			lat2 = data.latitude;
			lon2 = data.longitude;
			
			 console.log(lat1);

			 console.log(lon1);
		        	  
			 console.log(lat2);

			 console.log(lon2);
			 
			 var distanceTotal =  distance(lat1, lon1, lat2, lon2, 'K')
			 
			 console.log("dist:")
			 console.log(distanceTotal)
			 
			 document.getElementById('distanceTotal').innerHTML = "Distance = " + distanceTotal + " km";
		           
		    })
	
    
	    })
	    
	    
	   
	    
	

	    
		
})

  
  </script>

</body>


</html>