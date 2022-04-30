
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

</head>


<body>

	<c:if test="${villeId != null}">

		<form id="formModifier" method="post">

			<div class="field">
				<label class="label">Nom</label>
				<div class="enterValue">
					<input type="text" name="nomCommune" id="nomCommune" class="input"
						required>

				</div>
			</div>
			<div class="field">
				<div class="enterValue">
					<input hidden type="text" name="codeCommuneINSEE"
						id="codeCommuneINSEE" class="input" required>
						
						<input hidden type="text" name="id"
						id="id" class="input" required>

				</div>
			</div>
			<div class="field">
				<label class="label">Code postal</label>
				<div class="enterValue">
					<input type="text" class="input" name="codePostal" id="codePostal"
						placeholder="Code postal de la ville">
				</div>
			</div>
			<div class="field">
				<label class="label">Libéllé acheminnement</label>
				<div class="enterValue">
					<input type="text" name="libelle" id="libelle" class="input"
						placeholder="Libéllé acheminnement de la ville">
				</div>
			</div>
			<div class="field">
				<label class="label">Ligne 5</label>
				<div class="enterValue">
					<input type="text" name="ligne5" id="ligne5" class="input"
						placeholder="Ligne 5 de la ville">

				</div>
			</div>
			<div class="field">
				<label class="label">Longitude</label>
				<div class="enterValue">
					<input type="text" name="longitude" id="longitude" class="input"
						placeholder="Longitude de la ville">
				</div>
			</div>

			<div class="field">
				<label class="label">Latitude</label>
				<div class="enterValue">
					<input type="text" name="latitude" id="latitude" class="input"
						placeholder="Latitude de la ville">
				</div>
			</div>
			<br>
			<div class="">
				<input class="button" value="Modifier la ville " type="submit" />
			</div>

			<div class="">
				<input class="button" value="Cancel" id="modify" type="button" />
			</div>
		</form>

	</c:if>
	<script type="text/javascript">
	
		
				var form = document.getElementById('formModifier');
				console.log(form);
				 fetch("http://localhost:8081/ville/" +${villeId})
				    .then((res) => res.json())
				    .then((data) => {
				          
				        	   console.log(data.nomCommune);
				        	   
				        	   document.getElementById('id').value =data.id
						       document.getElementById('nomCommune').value =data.nomCommune
						       document.getElementById('codeCommuneINSEE').value =data.codeCommuneINSEE
						       document.getElementById('codePostal').value =data.codePostal
						       document.getElementById('libelle').value =data.libelleAcheminement
						       document.getElementById('ligne5').value =data.ligne5
						       document.getElementById('latitude').value =data.latitude
						       document.getElementById('longitude').value =data.longitude						  
				           
				    })
				    
			var form = document.getElementById('formModifier');
			console.log(form);
			if(form!== null){
			form.addEventListener('submit', function(e){
				
				e.preventDefault()
				var idV =  document.getElementById('id').value
				var nomCommuneV = document.getElementById('nomCommune').value
				var codeCommuneINSEEV = document.getElementById('codeCommuneINSEE').value
				var codePostalV = document.getElementById('codePostal').value
				var libelleV = document.getElementById('libelle').value
				var ligne5V = document.getElementById('ligne5').value
				var longitudeV = document.getElementById('longitude').value
				var latitudeV = document.getElementById('latitude').value
				
				fetch("http://localhost:8081/ville", {
					method:'PUT', 
					body:JSON.stringify({
						id:parseInt(idV),
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