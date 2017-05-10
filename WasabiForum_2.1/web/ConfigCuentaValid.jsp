<%-- 
    Document   : ConfigCuentaValid
    Created on : 18/04/2017, 01:21:20 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuracion</title>
        <link href="css/ConfigCuentaAlumCSS.css" rel="StyleSheet">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">-->
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
        <script src="js/ConfigCuentaJS.js"></script>
        <script>
            var ventana_secundaria;

            function cerrarVentana() {
                ventana_secundaria.close();
            }
        </script>
    </head>
    <body>
        <div class="login" style="visibility: visible" id="DivCambio">
            <div class="login-screen">
                <div class="app-title">
                    <h1>Configuracion de la cuenta</h1>
                </div>
                <div class="app-title">
                    <h3>Contraseña</h3>
                </div>
                <div class="login-form">
                    <div class="control-group">
                        <form id="fCambio">
                            <input type="password" placeholder="Escribir contraseña nueva" id="nueContra" name="nueContra"><br>
                            <input type="password" placeholder="Confirma contraseña nueva" id="ConfNueContra" name="ConfNueContra"><br>
                            <input type="submit" class="btn" value="Guardar Cambios" id="BCambio"/>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <script type="text/javascript" src="js/navbar.js"></script>
    </body>
</html>
