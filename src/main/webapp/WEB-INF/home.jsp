
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
       <script  type="text/javascript" src = "src/main/ressources/tableManager.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    
    <%@include file="navbar.jsp"%>

    	<style type="text/css">
		body {
			font-family: "Trebuchet MS", Helvetica, sans-serif;
		}
		a {
			text-decoration: none;
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
			margin-bottom: 20px;
		}
		table, th, td {
		   border: 1px solid #bbb;
		   text-align: left;
		}
		tr:nth-child(even) {
			background-color: #f2f2f2;
		}
		th {
			background-color: #ddd;
		}
		th,td {
			padding: 5px;
		}
		button {
			cursor: pointer;
		}
		/*Initial style sort*/
		.tablemanager th.sorterHeader {
			cursor: pointer;
		}
		.tablemanager th.sorterHeader:after {
			content: " \f0dc";
			font-family: "FontAwesome";
		}
		/*Style sort desc*/
		.tablemanager th.sortingDesc:after {
			content: " \f0dd";
			font-family: "FontAwesome";
		}
		/*Style sort asc*/
		.tablemanager th.sortingAsc:after {
			content: " \f0de";
			font-family: "FontAwesome";
		}
		/*Style disabled*/
		.tablemanager th.disableSort {
			
		}
		#for_numrows {
			padding: 10px;
			float: left;
		}
		#for_filter_by {
			padding: 10px;
			float: right;
		}
		#pagesControllers {
			display: block;
			text-align: center;
		}
	</style>
	
</head>



	<body>
	    <h1>Hello users</h1>
	    
	    <table class = tablemanager> 
	    
	    <thead>
	    	
	    	<tr>
					<th>Nom</th>
					<th>Code commune</th>
					<th>Code postal</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Ligne 5</th>
					<th>Libelle acheminement</th>
					<th>Modifier</th>
					<th>Effacer</th>
			</tr>
	    
	    </thead> 
	    
	    <tbody id= "body">
	    
	    </tbody>
	    
	   </table>
	   
	
	</body>

</html>

<script type="text/javascript">

    function getAll(){
    	
    }
    fetch("http://localhost:8081/ville/all")
    .then((res) => res.json())
    .then((data) => {
           data.forEach((ville) => {
        	  
        	   var code = ville.codeCommuneINSEE;
        	   console.log(code);
        	   
                  $("#body").append(`
                  var name = ville.nomCommune;  
                  console.log(ville.nomCommune);
                	
                  <tr>
                	<td>` + ville.nomCommune + `</td>   
                    <td>` + ville.codeCommuneINSEE + `</td>   
                    <td>` + ville.codePostal + `</td>  
                    
                    <td>` + ville.latitude + `</td>  
                    <td>` + ville.longitude + `</td>  
                    <td>` + ville.ligne5 + `</td>  
                    <td>` + ville.libelleAcheminement + `</td>  
                    
                    <td><a   href="<%=application.getContextPath()%>/modifier?villeId=`+ville.id +`">Modifier</a></td>
                  
					
                    <td><a  onclick="supprimer(`+ ville.id +`)" >Supprimer</a></td>
                    
                 
					
                  </tr>
                  
                  `)

           });   
    })
    
    function supprimer(id) {
    	
			
			fetch("http://localhost:8081/ville/" + id , {
				method:'DELETE',
				headers: {
				    'Content-type': 'application/json; charset=UTF-8'
				   
				  }
				})

		
 			 alert("Ville effacé");
 			 
 	}
    
    
    
	
</script>


