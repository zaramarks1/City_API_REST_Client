
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    
    <%@include file="navbar.jsp"%>
     <%@include file="css.jsp"%>

</head>



	<body>
	    <h1 align=center>Liste des villes en france</h1>
	    
	    <table id = "villes" class = tablemanager> 
	    
	    <thead>
	    	
	    	<tr>
					<th>Nom</th>
					<th>Code commune</th>
					<th>Code postal</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Ligne 5</th>
					<th>Libelle acheminement</th>
					<th>View + meteo</th>
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

    fetch("http://localhost:8081/ville/all")
    .then((res) => res.json())
    .then((data) => {
           data.forEach((ville) => {
        	  
        	   var code = ville.codeCommuneINSEE;
        	   
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
                    
                    <td><a   href="<%=application.getContextPath()%>/view?villeId=`+ville.id +`">View</a></td>
                    
                    <td><a   href="<%=application.getContextPath()%>/modifier?villeId=`+ville.id +`">Modifier</a></td>
                    
					
                    <td><a  onclick="supprimer(`+ ville.id +`)" >Supprimer</a></td>
                    
                 
					
                  </tr>
                  
                  `)

           });  
           
           $(document).ready(function(){
               $('#villes').after('<div id="nav"></div>');
               var rowsShown = 50;
               var rowsTotal = $('#villes tbody tr ').length;
               var numPages = rowsTotal/rowsShown;
               
               console.log(rowsTotal);
               
               
               for(i = 0;i < numPages;i++) {
                   var pageNum = i + 1;
                   $('#nav').append('<a href="#" rel="'+i+'">'+pageNum+'</a> ');
               }
               $('#villes tbody tr ').hide();
               $('#villes tbody tr ').slice(0, rowsShown).show();
               $('#nav a:first').addClass('active');
               $('#nav a').bind('click', function(){
            	   $('#villes thead tr').show();
                   $('#nav a').removeClass('active');
                   $(this).addClass('active');
                   var currPage = $(this).attr('rel');
                   var startItem = currPage * rowsShown;
                   var endItem = startItem + rowsShown;
                   $('#villes tbody tr ').css('opacity','0.0').hide().slice(startItem, endItem).
                           css('display','table-row').animate({opacity:1}, 300);
               });
              
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

<style>

#villes tbody tr {
  display: none;
}


</style>


