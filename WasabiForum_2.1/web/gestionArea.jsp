<%-- 
    Document   : index
    Created on : May 7, 2017, 10:40:00 PM
    Author     : merlyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wasabi Forum - Gestion de Area Basica </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/estilosGestion.css">
    </head>
    <body>
    <!--
    -->

        <!--Navbar comprimida-->

      <div id="navbar-container">

        <div class="navbar-img-div" id="navbar-imagen-menu" onClick="open_navbar();">
          <img id="imagen-menu" class="imagen-navbar" src="imagenes/menu.png">
        </div>

        <div class="navbar-img-div" id="navbar-imagen-close" onClick="close_navbar();">
          <img id="imagen-close" class="imagen-navbar" src="imagenes/close.png">
        </div>

        <div class="outer">
          <div id="navbar-image-container" class="middle">
            <div class="navbar-img-div" id="navbar-imagen-home">
              <img class="imagen-navbar" src="imagenes/home.png">
            </div>
            <div class="navbar-img-div" id="navbar-imagen-profile">
              <img class="imagen-navbar" src="imagenes/profile.png">
            </div>
            <div class="navbar-img-div" id="navbar-imagen-notification" onclick="open_notification_bar();">
              <img class="imagen-navbar" src="imagenes/notification.png">
            </div>
            <div class="navbar-img-div" id="navbar-imagen-search">
              <img class="imagen-navbar" src="imagenes/search.png">
            </div>
          </div>
        </div>

      </div>

      <!--Navbar extendida-->

      <div id="extended-navbar-container">

        <div id="titulo-navbar">
          <p>Wasabi Forum<p>
        </div>

        <div class="outer">
          <div class="middle">

            <div class="navbar-texto">
              <p><a href="foro.jsp" class="navbar-a">Inicio</a></p>
            </div>
            <div class="navbar-texto">
              <p><a href="#" class="navbar-a">Mi perfil</a></p>
            </div>
            <div class="navbar-texto">
              <p><a href="#" class="navbar-a" onclick="open_notification_bar();">Notificaciones</a></p>
            </div>
            <div class="navbar-texto">
              <p><a href="#" class="navbar-a">Buscar usuario</a></p>
            </div>

          </div>
        </div>

        <div id="navbar-opc">
          <p><a class="navbar-a2" href="#">Acerca de</a></p>
          <p><a class="navbar-a2" href="#">Configuración de la cuenta</a></p>
          <p><a class="navbar-a2" href="#">Salir</a></p>
        </div>

      </div>

      <!--Barra de notificaciones-->

      <div id="notification-bar">
        <div id="titulo-notification-bar">
          <span id="titulo-notificacion">Notificaciones&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="close_notification_bar()" id="tache-notificacion">&times;</a></span>
        </div>
        <div class="clear"></div>

        <div id="notification-container">

        </div>

      </div>

      <div id="capa-oscura"></div> <!--Con este div se oscurece el cuerpo al activar el menu-->

      <!--Cuerpo del foro-->

      <div id="divGeneral">
        <div class="encabezadoTitulo"> <h3> Gestor de Área Básica </h3> </div>
        <div id="divTabs">
          <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" onclick="change('profesores')" id="profesores"> <h2> Profesores </h2></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" onclick="change('materias')" id="materias"> <h2> Materias </h2> </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" onclick="change('academias')" id="academias"> <h2> Academias </h2> </a>
            </li>
          </ul>
        </div>



      <div id="divVentanaTabs">
            <iframe name="ventanaTab" id="ventanaTab" class="iframesito" src="profesores.jsp"> </iframe>
      </div>


      </div>




      <!--Fin del cuerpo del foro-->


        <!--JavaScript de la navbar-->
        <script type="text/javascript" src="js/navbar.js"></script>

        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

    </body>
</html>
