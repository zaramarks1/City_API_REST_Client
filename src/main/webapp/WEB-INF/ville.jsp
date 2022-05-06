
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
	    <%@include file="navbar.jsp"%>
	    <%@include file="css.jsp"%>
</head>


<body>


<c:if test="${villeId == null}">
 
<div align=center>

<h1>Ajouter une ville</h1>
	<form id = "formAdd"  method="post"  >

		<div class="field">
			<label class="form-label" >Nom</label>
			<div class="enterValue">
				<input type="text" name="nomCommune" id="nomCommune" class="form-text"
					placeholder="Nom de la ville" required> 
					
			</div>
		</div>
		<div class="field">
			<label class="form-label">Code de la commune</label>
			<div class="enterValue">
				<input type="text" name="codeCommuneINSEE" id="codeCommuneINSEE" class="form-text"
					placeholder="Code commune de la ville" required> 
				
			</div>
		</div>
		<div class="field">
			<label class="form-label">Code postal</label>
			<div class="enterValue">
				<input type="text" class="form-text" name="codePostal" id="codePostal"
					placeholder="Code postal de la ville"> 
			</div>	
		</div>
		<div class="field">
			<label class="form-label">Lib�ll� acheminnement</label>
			<div class="enterValue">
				<input type="text" name="libelle" id="libelle" class="form-text"
					placeholder="Lib�ll� acheminnement de la ville"> 
			</div>
		</div>
		<div class="field">
			<label class="form-label">Ligne 5</label>
			<div class="enterValue">
				<input type="text" name="ligne5" id="ligne5" class="form-text"
					placeholder="Ligne 5 de la ville"> 
				
			</div>
		</div>
		<div class="field">
			<label class="form-label"">Longitude</label>
			<div class="enterValue">
				<input type="text" name="longitude" id="longitude" class="form-text"
					placeholder="Longitude de la ville"> 
			</div>
		</div>

		<div class="field">
			<label class="form-label">Latitude</label>
			<div class="enterValue">
				<input class="form-text" type="text" name="latitude" id="latitude" 
					placeholder="Latitude de la ville"> 
			</div>
		</div>
		<br>
		<div class="">
			<input  class="button" 
				value="Ajouter la ville " type="submit" />
			<input class="button"
				value="Cancel" id= "modify" type="button" />
		</div>
	</form>
	
</div>
</c:if>


	<script type="text/javascript">
	
			var form = document.getElementById('formAdd');
			console.log(form);
			if(form!== null){
			form.addEventListener('submit', function(e){
				
				e.preventDefault()
				
				var nomCommuneV = document.getElementById('nomCommune').value
				var codeCommuneINSEEV = document.getElementById('codeCommuneINSEE').value
				var codePostalV = document.getElementById('codePostal').value
				var libelleV = document.getElementById('libelle').value
				var ligne5V = document.getElementById('ligne5').value
				var longitudeV = document.getElementById('longitude').value
				var latitudeV = document.getElementById('latitude').value
				
				fetch("http://localhost:8081/ville", {
					method:'POST', 
					body:JSON.stringify({
						codeCommuneINSEE:codeCommuneINSEEV, 
						nomCommune:nomCommuneV,
						codePostal:codePostalV,
						libelleAcheminement:libelleV,
						ligne5:ligne5V, 
						longitude:longitudeV,
						latitude:latitudeV
					}),
					headers: {
					    'Content-type': 'application/json; charset=UTF-8'
					   
					  }
					})
					.then(function(response){
					return response.json()
					 .then(function(data){
						console.log(data)
				})
					  
				})
				
				
			})
			
			
			}
		
	
	</script>


</body>
</html>