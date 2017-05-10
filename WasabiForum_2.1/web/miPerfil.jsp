<%-- 
    Document   : miPerfil
    Created on : 7/05/2017, 06:43:03 PM
    Author     : Charly Anguiano
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1" import="java.io.*, java.sql.*, Wasabi.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Perfil</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <link rel="stylesheet" href="css/foro.css">
        <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-1.6.4.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
        <meta charset="ISO-8859-1">
    </head>
    <body>
        <script>
            var parametros = "width=1000, height=800, left=350, top=150 resizable=no, \n\ menubar=no, toolbar=no, directories=no, location=no, scrollbars=no, status=no";

            function abrirVentana() {
                window.open("ConfigCuentaAlumno.html", "ventana", parametros);

            }

        </script>
        <%
            DataBase bd = new DataBase();

            bd.conectar();

            Connection c = bd.getC();
            Statement s = c.createStatement();
            ResultSet rs = null;

            HttpSession sesion = request.getSession();


        %>

        <!--Navbar comprimida-->

        <% Navbar nav = new Navbar();
            out.println(nav.imprimirNavbar(sesion.getAttribute("identificador").toString(), sesion.getAttribute("tipoUsuario").toString())); %>

        <!--Barra de notificaciones-->

        <div id="notification-bar">
            <div id="titulo-notification-bar">
                <span id="titulo-notificacion">Notificaciones&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="close_notification_bar()" id="tache-notificacion">&times;</a></span>
            </div>
            <div class="clear"></div>

            <div id="notification-container">

            </div>

        </div>

        <div id="capa-oscura" onclick='close_navbar(); close_notification_bar();'></div> <!--Con este div se oscurece el cuerpo al activar el menu-->

        <!--Cabecera del perfil de usuario-->

        <div class="jumbotron container-fluid" style="background-color: #4F67A4; color: white;">
            <div class="container">
                <div class="row justify-content-center ml-2">
                    <div id="columna-perfil" class="col-md-8 col-sm-10 ml-5">
                        <%
                            String boleta = session.getAttribute("identificador").toString();
                            String tipoUsuario = session.getAttribute("tipoUsuario").toString();

                            try {
                                if (tipoUsuario.equals("3")) {
                                    Alumno alumno = new Alumno();
                                    rs = alumno.getAlumnoPorID(boleta);
                                    while (rs.next()) {
                                        String nombre = rs.getString("usuario.nombre");
                                        String correo = rs.getString("usuario.correo");
                                        String grupo = rs.getString("grupo.nombre");
                                        boleta = rs.getString("alumnos.boleta");
                                        out.println(alumno.imprimirPerfil(boleta, nombre, correo, grupo));
                                        break;
                                    }
                                }
                            } catch (SQLException e) {
                                out.println(e.toString());
                            }
                        %>
                    </div>
                </div>
            </div>

        </div>

        <!--Publicaciones hechas por el usuario-->

        <div class="container">
            <div class="row justify-content-center ml-2">
                <div id="columna-publicaciones" class="col-md-8 col-sm-10 ml-5">
                    <h4>Publicaciones del usuario:</h4>
                    <hr/>
                    <%                //Cargar las publicaciones
                        String tituloPub = "";
                        String materiaPub = "";
                        String academiaPub = "";
                        String fechaPub = "";
                        String idMateriaPub = "";
                        String idPublicacion = "";
                        String nombreUsuario = "";
                        String idUsuario = "";
                        String colorBase = "#3a3a3a";
                        String color = "";
                        String rolUsuario="";

                        try {
                            Statement sUsuario = c.createStatement();
                            ResultSet rsUsuario = null;

                            ResultSet rsAcademia = null;
                            Statement sAcademia = c.createStatement();

                            ResultSet rsMateria = null;
                            Statement sMateria = c.createStatement();

                            Publicacion pub = new Publicacion();

                            ResultSet rsPub = pub.getRSPublicacionesAlumno(boleta);

                            while (rsPub.next()) {
                                tituloPub = rsPub.getString("titulo");
                                idMateriaPub = rsPub.getString("idMateria");
                                fechaPub = rsPub.getString("fechaYHora");
                                idPublicacion = rsPub.getString("idPublicacion");
                                idUsuario = rsPub.getString("idUsuario");

                                rsUsuario = sUsuario.executeQuery("select * from usuario where idUsuario ='" + idUsuario + "';");
                                while (rsUsuario.next()) {
                                    idUsuario = rsUsuario.getString("idUsuario");
                                    nombreUsuario = rsUsuario.getString("usuario.nombre");
                                    rolUsuario=rsUsuario.getString("usuario.idRol");
                                }

                                rsMateria = sMateria.executeQuery("select * from materia where idMateria ='" + idMateriaPub + "';");

                                while (rsMateria.next()) {
                                    materiaPub = rsMateria.getString("nombre");}
                                   
                                }

                                rsAcademia = sAcademia.executeQuery("select * from Materia "
                                        + "inner join academia on materia.idAcademia = academia.idAcademia "
                                        + "inner join catcolores on academia.color = catcolores.idColor "
                                        + "where materia.nombre='" + materiaPub + "';");

                                while (rsAcademia.next()) {
                                    academiaPub = rsAcademia.getString("academia.nombre");
                                    colorBase = rsAcademia.getString("catcolores.color");
                                    if (!(colorBase == null)) {
                                        color = colorBase;
                                    }
                                }

                                String publicacion = pub.imprimirPublicacionForo(idPublicacion, academiaPub, materiaPub, tituloPub, fechaPub, nombreUsuario, color, rolUsuario);

                                out.println(publicacion);
                        
                            
                            bd.cierraConexion();
                        } catch (SQLException e) {
                            out.println(e.toString());
                        }

                    %>
                </div>
            </div>
        </div>
        <!--JavaScript de la navbar-->
        <script type="text/javascript" src="js/navbar.js"></script>

        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="http://code.jquery.com/jquery-1.6.4.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    </body>
</html>
