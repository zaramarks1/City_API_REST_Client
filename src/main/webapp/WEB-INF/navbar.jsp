
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
    background-color: #067373;
    width: 100%;
    overflow: hidden;

    }

/* Style the links inside the navigation bar */
.navbar-top a {
    float: left;
    color: white;
    text-align: center;
    padding: 30px 16px;
    text-decoration: none;
    font-size: 17px;
    }

    /* Change the color of links on hover */
    .navbar-top a:hover {
    background-color: #bffcfc;
    color: black;
    }

    /* Add a color to the active/current link */
    .navbar-top a.active {
    background-color: #bffcfc;
    color: black;
    }
</style>

