<%-- 
    Document   : foro
    Created on : 2/05/2017, 04:10:46 PM
    Author     : Charly Anguiano
--%>

<%@page import="java.util.logging.Logger"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1" import="java.io.*, java.sql.*, Wasabi.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Wasabi Forum</title>
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
    </head>
    <body>

        <%
            DataBase bd = new DataBase();

            bd.conectar();

            Connection c = bd.getC();
            Statement s = c.createStatement();
            ResultSet rs = null;

            HttpSession sesion = request.getSession();


        %>

        <!--Navbar-->

        <%
            Navbar nav = new Navbar();
            out.println(nav.imprimirNavbar(sesion.getAttribute("identificador").toString(), sesion.getAttribute("tipoUsuario").toString()));
        %>
        

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

        <!--Cuerpo del foro-->


        <div class="container">
            <div class="row justify-content-center ml-2">
                <div id="columna-publicaciones" class="col-md-8 col-sm-10 ml-5">

                    <div class="card my-2" >
                        <div class="card-header" style="background-color: #3dd372; border-color: #3dd372;">
                            <div class="row">
                                <div class='col-8' style='color: white;'>
                                    <h4 class="card-title">Escribe una pregunta</h4>
                                </div>
                                <div class='col-4 text-right'>
                                    <button class='btn btn-secondary' data-toggle="collapse" data-target="#collapse-publicar" aria-expanded="false" aria-controls="collapse-publicar" >Preguntar</button>
                                </div>
                            </div> 

                        </div>

                        <div class='collapse' id='collapse-publicar'>

                            <div class="card-block">
                                <div id="contenedor-formulario-publicacion" class="form-group">
                                    <form id="fPublicar" name="fPublicar" action="crearPublicacion.jsp" method="post">
                                        <label for="inputTituloPublicacion">Título de la pregunta:</label>
                                        <input type="text" class="form-control" name="inputTituloPublicacion" placeholder="Escribe tu pregunta aquí...">
                                        <br/>
                                        <label for="inputDescripcion">Especifica tu duda con una descripción <span class="text-muted">(Opcional)</span></label>
                                        <textarea id="inputDescripcion" name="inputDescripcion" rows="3" class="form-control"></textarea>

                                        <br/>
                                        <div class="row">
                                            <div class="col-6">
                                                <label for="selectAcademia">Academia:</label>


                                                <select class="form-control form-control-sm" id="selectAcademia" name="selectAcademia">

                                                    <option selected value="">Seleccione una academia</option>
                                                    <%
                                                    Academia academia = new Academia();
                                                    out.println(academia.cargarAcademiasSelect());
                                                    %>

                                                </select>
                                            </div>
                                            <div class="col-6">
                                                <label for="selectMateria">Materia:</label>
                                                <select class="form-control form-control-sm" id="selectMateria" name="selectMateria">

                                                    <option selected value="">Seleccione una materia</option>
                                                    <%                                      //Cargar las materias
                                                        Materia materia = new Materia();
                                                        out.println(materia.cargarMateriasSelect("opcMateria"));
                                                    %>


                                                </select>

                                                <script>
                                                    $(document).ready(function () {
                                                        $("#selectAcademia").change(function () {
                                                            $("#selectMateria").find("option").show().not("." + this.value + "opcMateria").hide();
                                                            $("#selectMateria").val($("#selectMateria").find("option:visible:first").val());
                                                        }).change();
                                                    });
                                                </script>

                                            </div>
                                        </div>

                                        <br/>

                                        <div class="row">
                                            <div class="col-12 text-right">
                                                <input type="submit" class="btn btn-success" id="BPublicar" name="BPublicar" value="Publicar">
                                            </div>
                                        </div>        
                                    </form>
                                </div>

                            </div>

                        </div>

                    </div>

                    <hr/>

                    <!--Filtro de preguntas-->  
                    <form id="fFiltrar" name="fFiltrar" action="foro.jsp" method="post">
                        <div class="form-group">

                            <div class="row">
                                <div class='col-8'>
                                    <h6>Filtrar publicaciones:</h6> 
                                </div>
                                <div class='col-4 text-right'>
                                    <input type="submit" value="Filtrar" class='btn btn-primary btn-sm' id="BFiltrar" name="BFiltrar">
                                </div>
                            </div>   

                            <div class="row">
                                <div class="col-6">
                                    Academia: <select id="selectFiltroAcademia" name="selectFiltroAcademia" class="form-control form-control-sm">
                                        <option value="">Seleccione una academia</option>
                                        <%
                                        out.println(academia.cargarAcademiasSelect());
                                        %>

                                    </select>
                                </div>
                                <div class='col-6'>

                                    Materia: 
                                    <select id="selectFiltroMateria" name="selectFiltroMateria" class='form-control form-control-sm'>
                                        <option value="">Seleccione una materia</option>
                                        <%
                                            out.println(materia.cargarMateriasSelect("academiaFiltro"));
                                        %>

                                    </select>
                                </div>
                                <script>

                                    $(document).ready(function () {
                                        $("#selectFiltroAcademia").change(function () {
                                            $("#selectFiltroMateria").find("option").show().not("." + this.value + "academiaFiltro").hide();
                                            $("#selectFiltroMateria").val($("#selectFiltroMateria").find("option:visible:first").val());
                                        }).change();
                                    });

                                </script>
                            </div>
                        </div>
                    </form>

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
                        String color = "#3A3A3A";
                        String colorBase = "";
                        String tipoUsuario = "";
                        
                        String materiaFiltrada = request.getParameter("selectFiltroMateria");

                        try {
                            Statement sUsuario = c.createStatement();
                            ResultSet rsUsuario = null;

                            ResultSet rsAcademia = null;
                            Statement sAcademia = c.createStatement();

                            ResultSet rsMateria = null;
                            Statement sMateria = c.createStatement();

                            Publicacion pub = new Publicacion();

                            ResultSet rsPub;
                            
                            if(materiaFiltrada==null){
                                rsPub = pub.getRSPublicacionesForo();
                            } else {
                                rsPub = pub.getRSPublicacionesMateria(materiaFiltrada);
                            }

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
                                    tipoUsuario = rsUsuario.getString("idRol");
                                }
                                
                                rsMateria = sMateria.executeQuery("select * from materia where idMateria ='" + idMateriaPub + "';");
                                
                                while (rsMateria.next()) {
                                    materiaPub = rsMateria.getString("nombre");
                                }

                                rsAcademia = sAcademia.executeQuery("select * from Materia "
                                        + "inner join academia on materia.idAcademia = academia.idAcademia "
                                        + "inner join catcolores on academia.color = catcolores.idColor "
                                        + "where materia.nombre='" + materiaPub + "';");

                                while (rsAcademia.next()) {
                                    academiaPub = rsAcademia.getString("academia.nombre");
                                    colorBase = rsAcademia.getString("catcolores.color");
                                    if(!(colorBase==null)){
                                        color = colorBase;
                                    }
                                }

                                String publicacion = pub.imprimirPublicacionForo(idPublicacion, academiaPub, materiaPub, tituloPub, fechaPub, nombreUsuario, color, tipoUsuario);

                                out.println(publicacion);

                            }
                            bd.cierraConexion();
                        } catch (SQLException e) {
                            out.println(e.toString());
                        }

                    %>


                </div>
            </div>
        </div>

        <!--Fin del cuerpo del foro-->


        <!--JavaScript de la navbar-->
        <script type="text/javascript" src="js/navbar.js"></script>

        <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="http://code.jquery.com/jquery-1.6.4.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="js/tether.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
        <script src="js/Foro.js"></script>
    </body>
</html>
