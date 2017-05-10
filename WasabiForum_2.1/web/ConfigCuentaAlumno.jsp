<%-- 
    Document   : ConfigCuentaAlumno
    Created on : 8/05/2017, 09:29:06 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Configuracion</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/ConfigCuentaAlumCSS.css" rel="StyleSheet">
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">-->
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
        <script src="js/ConfigCuentaAlumJS.js"></script>

    </head>
    <body>

        <div class="login" style="visibility: visible" id="DivContra">
            <div class="login-screen">
                <div class="app-title">
                    <h1>Ingrese contraseña</h1>
                </div>

                <div class="login-form">


                    <div class="control-group">
                        <form id="fContraAlum" name="fContra" action="validarPasswordAlumno.jsp" method="post">
                            <input type="password" placeholder="contraseña" id="contraAlum" name="contraAlum">
                            <%
                            String e = request.getQueryString();
                            if(e!=null){
                                out.println("<label class='error' style='color: red;'>La contraseña no es correcta</label>");
                            }
                            %>
                            <input type="submit" class="btn" value="Enviar" id="BContraAlum">
                            <br>
                        </form>
                    </div>



                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/navbar.js"></script>
    </body>
</html>
