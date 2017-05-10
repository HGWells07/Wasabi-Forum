<%-- 
    Document   : busquedaUsuario
    Created on : 2/05/2017, 04:16:37 PM
    Author     : Charly Anguiano
--%>

<%@page import="java.sql.*"%>
<%@page import="Wasabi.*"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Busqueda de Usuarios</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Busqueda.css" rel="StyleSheet">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
        <script src="js/busqueda.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/general.css">

        <script>

            function comboAlumno() {
                var alumno = document.getElementById("alumnoDiv");
                var profesor = document.getElementById("profeDiv");
                if (profesor.style.visibility === "visible") {
                    profesor.style.visibility = "hidden";
                    alumno.style.visibility = "visible";
                }
                alumno.style.visibility = "visible";
            }

            function comboProfe() {

                var alumno = document.getElementById("alumnoDiv");
                var profesor = document.getElementById("profeDiv");
                if (alumno.style.visibility === "visible") {
                    alumno.style.visibility = "hidden";
                    profesor.style.visibility = "visible";
                } else
                    profesor.style.visibility = "visible";
            }
        </script>
        <style>
            .main {
                background-color: white;
                width: 80%;
                margin: auto;
                margin-top: 6em;
                padding-left: 4em;
                padding-right: 4em;
                padding-bottom: 2em;
            }

            .row {
                padding-top: 1em;
                text-align: center;
            }
        </style>
    </head>

    <body>

        <%
            DataBase db = new DataBase();
            db.conectar();
            Connection c = db.getC();
            ResultSet rs = null;
            HttpSession sesion = request.getSession();
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

        <div id="capa-oscura" onclick='close_navbar(); close_notification_bar();'></div>
        <!--Con este div se oscurece el cuerpo al activar el menu-->

        <div class="main">

            <div class="row">
                <div class="col-md-6">
                    <h1 style="display:inline;">Alumno</h1>
                    <input type='radio' value='alumno' id='alumno' name='usuario' onclick="comboAlumno()">
                </div>
                <div class="col-md-6">
                    <h1 style="display:inline;">Profesor</h1>
                    <input type='radio' value='profe' id='profe' name='usuario' onclick="comboProfe()">
                </div>
            </div>
            <div class="row">


                <div id="alumnoDiv" style=" visibility: hidden;" class="col-md-6">
                    <form id="formAlumno" action="busquedaUsuario.jsp" method="post" class="form-control">
                        <label for="semestree">Seleccione un semestre:</label>
                        <select id="semestree" name="semestree"class="form-control">
                            <option value="">Seleccione un semestre</option>
                            <%
                                Semestre sem = new Semestre();
                                try {
                                    out.println(sem.cargarComboSemestres());
                                } catch (SQLException e) {
                                    out.println("<option value=''>Error al cargar los semestres</option>");
                                }
                            %>

                        </select>
                        <br>
                        <br>
                        <label for="grupoo">Seleccione una academia:</label>
                        <select class="form-control" id="grupoo" name="grupoo">
                            <option value="">Seleccione un grupo</option>
                            <%
                                Grupo grup = new Grupo();
                                try {
                                    out.println(grup.cargarComboGrupos());
                                } catch (SQLException e) {
                                    out.println("<option value=''>Error al cargar los grupos</option>");
                                }
                            %>

                        </select>
                        <br><br>
                        <input type="submit" value="buscar" id="alumnoButton" class="form-control">
                    </form>

                </div>

                <div id="profeDiv" style=" visibility: hidden;" class="col-md-6">
                    <form id="formProfe" name="fromProfe" action="busquedaUsuario.jsp" method="post" class="form-control">

                        <label for="areaa">Seleccione una área:</label>
                        <select class="form-control form-controlm" id="areaa" name="areaa">

                            <option selected value="">Seleccione una área</option>
                            <%
                               Area area = new Area(); 
                               out.println(area.cargarComboArea()); 
                            %>


                        </select>


                        <br><br>



                        <label for="materiaa">Seleccione una academia:</label>
                        <select id="academiaa" name="academiaa" class="form-control">
                            <option value="">Seleccione una academia</option>
                            <%
                                Academia academia = new Academia();
                                out.println(academia.cargarAcademiasSelect());
                            %>

                        </select>
                        <br><br>
                        <input type="submit" value="buscar" id="profeButton" name="profeButton" onclick="ComboBoxesProfe()" class="form-control">
                    </form>
                </div>
            </div>

        </div>
        <script type="text/javascript" src="js/navbar.js"></script>
        <div class="row my-2 justify-content-center ml-2">
            <div class="col-md-4 ml-5">
                <%
            String semestre= request.getParameter("semestree");
            String grupo= request.getParameter("grupoo");
            ResultSet queryUsuarios;
            
            String nombre;
            String nombreGrupo;
            String boleta;
            if(!(grupo==null)){
                out.println("<h3>Resultados de búsqueda:</h3>");
                out.println("<hr/>"); 
            }
            try {
                queryUsuarios = db.consulta("select * from alumnos inner join usuario on alumnos.idUsuario = usuario.idUsuario "
                        + "inner join grupo inner join semestre on grupo.idSemestre = semestre.idSemestre "
                        + "where grupo.idGrupo='"+grupo+"' and semestre.idSemestre='"+semestre+"'"
                        + " order by usuario.nombre;");
                while(queryUsuarios.next()){
                    nombre = queryUsuarios.getString("usuario.nombre");
                    nombreGrupo = queryUsuarios.getString("grupo.nombre");
                    boleta = queryUsuarios.getString("alumnos.boleta");
                    out.println("<div class='card my-2'>"
                            + "<div class='card-block'>"
                            + "<p><b> Nombre de Usuario: "+nombre+"</b></p><p><b>Boleta: </b>"+boleta+"&nbsp;|&nbsp;<b>Grupo: </b>"+nombreGrupo+"</p>"
                            + "</div>"
                            + "</div>");
                }
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
            </div>
        </div>
        
        <script>
                            $(document).ready(function () {
                                $("#academiaa").change(function () {
                                    $("#areaa").find("option").show().not("." + this.value + "opcMateria").hide();
                                    $("#areaa").val($("#areaa").find("option:visible:first").val());
                                }).change();
                            });
        </script>
        <script>
            $(document).ready(function () {
                $("#semestree").change(function () {
                    $("#grupoo").find("option").show().not("." + this.value + "opcGrupo").hide();
                    $("#grupoos").val($("#Grupos").find("option:visible:first").val());
                }).change();
            });
        </script>

    </body>

</html>
