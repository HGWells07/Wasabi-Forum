<%-- 
    Document   : AdmiEscolarFinal
    Created on : 24-abr-2017, 18:44:34
    Author     : Ricardo
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" 
              integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/ADMI.css">
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
        <title>Administración Escolar</title>
        <script src=js/SelecciónAdmiEscolar.js></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <%@page import="java.sql.*,java.io.*" %>
        <%@page import="Wasabi.DataBase" %>
        <%
            DataBase base = new DataBase();
            base.conectar();

            HttpSession sesion = request.getSession();
            String operacion = request.getQueryString();
            if(operacion!=null){
                out.println("<script>alert('Operación exitosa')</script>");
            }
        %>
        <style>
            #submit-cerrar:hover{
                cursor: pointer;
                color: #3498DB;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div id="logout-container" style="position: fixed;
             top: 0px; 
             right: 0px;
             width: 150px;
             height: 40px;
             background-color: #ff3333;
             font-size: 16px;
             padding: 7px;
             z-index: 3;
             text-align: center;
             color: #080808;">
            <form name="formCerrarSesionAdmin" action="cerrarSesion.jsp" method="post">
                <i class="fa fa-sign-out" aria-hidden="true"></i>
                <input type="submit" name="submit-cerrar" id="submit-cerrar" value='Cerrar Sesion' style="
                       background:none!important;
                       color:inherit;
                       border:none; 
                       padding:0!important;
                       font: inherit;
                       ">
            </form>
        </div>
        <div class="container-fixed" >
            <div class="row justify-content-center" style="font-size:300%;background-color:olive;text-justify:inter-word;" >
                Gestor Escolar
            </div>
            <div class="col-12" >
                <div class=" row justify-content-center" style="margin:40px;">
                    <div id="Area" class="boton-pestana col-3" onclick="OpccionesArea();"><img src="imagenes/002-school-2.png">&nbsp;&nbsp;<br><b>Áreas</b></div>
                    <div id="Profesores" class="boton-pestana col-3" onclick="OpccionesProfesores();"><img src="imagenes/006-teacher-reading.png">&nbsp;&nbsp;<br><b>Profesores</b></div>
                    <div id="Estudios" class="boton-pestana col-3" onclick="OpccionesEstudios();"><img src="imagenes/003-diploma.png">&nbsp;&nbsp;<br><b>Estudios</b></div> 
                </div>
            </div>
            <div class="row" >
                <div  class="col-md-6  cntizq">
                    <div class="Contenedor"  id="Contizq">
                        <div class="Opcciones"  id="opcAreas">
                            <div class="BotonesOpc" id="BTNuevaArea" onclick="PantNuevaArea();">Nueva Área</div>
                            <div class="BotonesOpc" id="BTEliminarArea" onclick="PantEliminarArea();">Eliminar Área</div>
                        </div>
                        <div class="Opcciones" id="opcProfesores">
                            <div class="BotonesOpc" id="BTNuevoProfesor"  onclick="PantNuevoProfesor();">Nuevo Profesor</div>
                            <div class="BotonesOpc" id="BTEliminarProfesor"   onclick="PantEliminarProfesor();">Eliminar Profesor</div>
                        </div>
                        <div class="Opcciones" id="opcEstudios" >
                            <div class="BotonesOpc"  id="BTNuevoGrupo" onclick="PantNuevoGrupo();">Nuevo Grupo </div>
                            <div class="BotonesOpc" id="BTEliminarGrupo"  onclick="PantEliminarGrupo();">Eliminar Grupo</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 cntizq" >
                    <div class="Divsmoviles" id="Contizq" style="margin:40px">
                        <div class="PantallasOperaciones" id="PantallaNuevaArea">
                            <form id="fNuevaArea" method="post" action="IngresarArea.jsp">
                                <h3 align="center" >Nueva Área</h3>
                                <p>Nombre del area:</p><br>
                                <input type="text" id="NomArea" name="NomArea"><br><br>
                                <p class=tamañoText1>Jefe de Area:</p>
                                <label>
                                    <select class="form-control" style="text-align: center;" id="injefearea" name="injefearea">
                                        <option value="">seleccione a un jefe de area</option>
                                        <%
                                            ResultSet r = null;
                                            String nombreprof, nombreProfesor;

                                            try {
                                                r = base.consulta("select * from profesores inner join usuario on profesores.idUsuario = usuario.idUsuario;");
                                                while (r.next()) {
                                                    nombreprof = r.getString("NumeroEmpleado");
                                                    nombreProfesor = r.getString("usuario.nombre");
                                                    out.print("<option value='" + nombreprof + "'>"+nombreProfesor+" (" + nombreprof + ")</option>");
                                                }
                                            } catch (SQLException error) {
                                                error.toString();
                                            }
                                        %>
                                    </select>
                                </label><br><br>
                                <input type="submit" class='btn btn-secondary'value="Ingresar" id="BNuevaArea" name="BNuevaArea">
                            </form>
                        </div>
                        <div class="PantallasOperaciones" id="PantallaEliminarArea">
                            <h3 align="center">Eliminar Area</h3>
                            <p class="tamañoText1">Area a Eliminar</p><br>
                            <form id="fEliminarArea" name="fEliminarArea" action="EliminarArea.jsp">
                                <label>
                                    <select class="form-control" style="text-align: center;" id="ElimArea" name="ElimArea">
                                        <option value="">Seleccione el area</option>
                                        <%
                                            ResultSet rsarea = null;
                                            String nombrearea;
                                            try {
                                                rsarea = base.consulta("select * from area;");
                                                while (rsarea.next()) {
                                                    nombrearea = rsarea.getString("Nombre");
                                                    out.print("<option value='" + nombrearea + "'>" + nombrearea + "</option>");
                                                }
                                            } catch (SQLException error) {
                                                error.toString();
                                            }
                                        %>
                                    </select>
                                </label>
                                <br><br><br>
                                <input type="submit" value="Eliminar" id="BEliminarArea" class='btn btn-secondary' name="BEliminarArea">
                            </form>
                        </div>
                        <div class="PantallasOperaciones" id="PantallaNuevoProfesor">
                            <h3 align='center'>Nuevo Profesor</h3>
                            <form id="fNuevoProfesor" name="fNuevoProfesor" action="IngresarProfesor.jsp">
                               <p class="tamañoText1">Nombre</p>
                                <input type="text" ID="NombreProf" name="NombreNuevoProfesor">
                                <p class="tamañoText1">Numero de Empleado</p>
                                <input type="text" ID="NumEmpleado" name="NumEmplinput">
                                <p class="tamañoText1">Contraseña</p>
                                <input type="password" id="Contraseña" name="Contrainput"><br><br>
                                <input type="submit" class='btn btn-secondary'value="Ingresar" id="BNuevoProfesor" name="BNuevoProfesor">
                            </form>
                        </div>
                        <div class="PantallasOperaciones" id="PantallaEliminarProfesor">
                            <h3 align="center">Eliminar Profesor</h3>
                            <p class="tamañoText1">Profesor a Eliminar</p><br>
                            <form id="fElimProfesor" name="fElimProfesor" action="EliminarProfesor.jsp">
                                <label>
                                    <select class="form-control" style="text-align: center;" id="SelecProfesor" name="SelecProfesor">
                                        <option value="">Seleccione el Profesor</option>
                                        <%
                                            ResultSet rs = null;
                                            String nombre, numeroEmpleado;
                                            try {
                                                rs = base.consulta("select * from profesores inner join usuario on profesores.idUsuario = usuario.idUsuario;");
                                                while (rs.next()) {
                                                    nombre = rs.getString("Usuario.Nombre");
                                                    numeroEmpleado = rs.getString("profesores.NumeroEmpleado");
                                                    out.print("<option value='"+nombre+"'>" + nombre + " ("+numeroEmpleado+")</option>");
                                                    out.print("<option>" + nombre + " ("+numeroEmpleado+")</option>");
                                                }
                                            } catch (SQLException error) {
                                                error.toString();
                                            }
                                        %>
                                    </select>
                                </label>
                                <br><br><br>
                                <input type="submit" class='btn btn-secondary' value="Eliminar" id="BElimProfesor" name="BElimProfesor">
                            </form>
                        </div>
                        <div class="PantallasOperaciones" id="PantallaNuevoGrupo">
                            <h3 align="center">Nuevo Grupo</h3>
                            <p class="tamañoText1">Nombre del Grupo:</p>
                            <form id="fNuevoGrupo" name="fNuevoGrupo" action="IngresarGrupo.jsp">
                                <input type="text" id="NomGrupo" name="NomGrupo">
                                <p class="tamañoText1">Eliga Semestre</p>
                                <label>
                                    <select class="form-control" id="SelecSemestre1" name="SelecSemestre1">
                                        <option value="">Seleccione el semestre</option>
                                        <%
                                            ResultSet resem1 = null;
                                            String semestre1;
                                            try {
                                                resem1 = base.consulta("select * from semestre;");
                                                while (resem1.next()) {
                                                    semestre1 = resem1.getString("Nombre");
                                                    out.print("<option value='" + semestre1 + "'>" + semestre1 + "</option>");
                                                }
                                            } catch (SQLException error) {
                                                error.toString();
                                            }
                                        %>
                                    </select>
                                </label>
                                <br><br>
                                <input type="submit" class='btn btn-secondary' value="Ingresar" id="BNuevoGrupo" name="BNuevoGrupo">
                            </form>
                        </div>
                        <div class="PantallasOperaciones" id="PantallaEliminarGrupo">
                            <h3 align="center">Eliminar Grupo</h3>
                            <p class="tamañoText1">Eliga Semestre</p>
                            <form id="fElimGrupo" name="fElimGrupo" action="EliminarGrupo.jsp">
                                <label>
                                    <select class="form-control" id="SelecSemestre2" name="SelecSemestre2">
                                        <option value="">Seleccione el semestre</option>
                                        <%
                                            ResultSet resem2 = null;
                                            String semestre2;
                                            String nomsem;
                                            try {
                                                resem2 = base.consulta("select * from semestre;");
                                                while (resem2.next()) {
                                                    semestre2 = resem2.getString("idSemestre");
                                                    nomsem = resem2.getString("Nombre");
                                                    out.print("<option value='" + semestre2 + "'>" + nomsem + "</option>");
                                                }
                                            } catch (SQLException error) {
                                                error.toString();
                                            }
                                        %>
                                    </select>
                                </label>
                                <p class="tamañoText1">Grupo a Eliminar</p>
                                <label>
                                    <select class="form-control" id="SelecGrupo" name="SelecGrupo">
                                        <option value="">Seleccione el Grupo</option>
                                        <%
                                            ResultSet grup = null;
                                            String grupore;
                                            String semestre;

                                            String idsem;

                                            String idgrup;
                                            try {
                                                grup = base.consulta("select * from grupo ORDER BY nombre;");
                                                while (grup.next()) {
                                                    grupore = grup.getString("Nombre");
                                                    semestre = grup.getString("idSemestre");
                                                    idgrup = grup.getString("idGrupo");
                                                    out.print("<option value='" + idgrup + "' class='" + semestre + "opcGrupo'>" + grupore + "</option>");

                                                }
                                            } catch (SQLException error) {
                                                error.toString();
                                            }
                                        %>
                                    </select>
                                    <script>
                                       $(document).ready(function () {
                                            $("#SelecSemestre2").change(function () {
                                                $("#SelecGrupo").find("option").show().not("." + this.value + "opcGrupo").hide();
                                                $("#SelecGrupo").val($("#SelecGrupo").find("option:visible:first").val());
                                            }).change();
                                        });
                                    </script>
                                </label>
                                <br><br>
                                <input type='submit' class='btn btn-secondary' value="Eliminar" id="BElimGrupo" name="BElimGrupo">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="js/navbar.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    </body>
</html>
