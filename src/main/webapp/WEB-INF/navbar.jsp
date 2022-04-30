
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav>
        <div class="navbar-top" >
            <a class="active" href="<%=application.getContextPath()%>/home">Home</a>
            <a href="<%=application.getContextPath()%>/villeAjouter">Ajouter une ville</a>
            <a href="<%=application.getContextPath()%>/distance">Calculer la distance entre deux villes</a>
        </div>
    </nav>
</header>


<style>
    .navbar-top {
    background-color: #333;
    overflow: hidden;
    }

/* Style the links inside the navigation bar */
.navbar-top a {
    float: left;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
    }

    /* Change the color of links on hover */
    .navbar-top a:hover {
    background-color: #ddd;
    color: black;
    }

    /* Add a color to the active/current link */
    .navbar-top a.active {
    background-color: #04AA6D;
    color: white;
    }
</style>

