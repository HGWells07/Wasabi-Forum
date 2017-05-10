<%-- 
    Document   : index
    Created on : 2/05/2017, 04:03:47 PM
    Author     : Charly Anguiano
--%>

<%@page import="java.sql.*, Wasabi.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wasabi Forum</title>
    </head>

    <link href="css/IngreUsu.css" rel="StyleSheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/IngreUsuJS.js" language="javascript" type="text/javascript"></script>
    <script src="js/ValidacionIniRegis.js" language="javascript" type="text/javascript"></script>
    <script src="js/ValidacionRegistro.js" language="javascript" type="text/javascript"></script>
    <body>

        <%
            DataBase db = new DataBase();
            db.conectar();
            String error = request.getQueryString();
            if(error!=null){
                out.println("<script>alert('Usuario o contraseña inválidos');</script>");
            }
        %>

        <header>
                <div class="contenedor">
                    <div class="header">
                        <div id="logo">
                            <img src="img/wasabilogo.png" alt="logo" class="logo"/>
                        </div>
                        <label for="wasabiforum" class="textitowasabi"> WasabiForum </label>
                        <div class="divFormulario">
                            <form id="fInicioSesion" action="iniciarSesion.jsp" method="post">
                                <table> 
                                    <tbody>
                                        <tr>
                                            <td class="textito" colspan="1"> Boleta / Número de Empleado </td> 
                                            <td class="textito" colspan='3'> Password </td>
                                        </tr>
                                        <tr>

                                            <td> <input type="text" id="usuarioIn" name="usuarioIn" class="textoFormInicio " placeholder="Alumno y profesor"style=padding-right:1em"> </td> 

                                            <td> <input type="password" id="contraIn" name="contraIn" class="textoFormInicio " placeholder="password" style="width:80%"> </td>

                                            <td> <input type="submit" id="BIniciarSesion" value="Iniciar sesion" class="botonFormInicio"/> </td>

                                            <td> <input type="button" value="Registrate" id="BRegistro" name="BRegistro" onclick="pageScroll();" class="botonFormInicio"/> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div class="dropdownkey">
                            <input type="checkbox" id="botonkey"> <label for="toggle"> </label>

                            <div class="formAdmin" id="formAdmin">
                                <form id="fAdmin" method="post" action="iniciarSesionAdmin.jsp">
                                    <label class="textito" id="textpriv"> ¿Es usted un usuario privilegiado? </label>
                                    <label class="textito" id="textprivn"> Numero de empleado: </label>
                                    <input type="text" class="nombrepriv" id="UsuPrivi" name="UsuPrivi">
                                    <label class="textito" id="textprivp"> Contraseña: </label>
                                    <input type="password" class="passpriv" id="ContraPrivi" name="ContraPrivi">
                                    <input type="submit" class="subpriv" value="iniciar" id="BAdmin" name="BAdmin">
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div> 
        </header>            





        <div id="DivGaleria" style = " display:table; width: 100%;  height:100%;" class="imgs">

            <section id="bloque1" class="bloqueparallax">
                <div>
                    <p>No dejes que te coma la incertidumbre</p>
                </div>
            </section>

            <section id="bloque2" class="bloqueparallax">
                <div>
                    <p>Encuentra el mejor lugar para estudiar </p>
                </div>
            </section>

            <section id="bloque3" class="bloqueparallax">
                <div>
                    <p>Wasabi está listo para resolver todas tus dudas.</p>
                </div>
            </section>
        </div>


        <footer id="footer">
            <h3><A class="TituloRegistro"> ¡Empieza ahora! </a></h3>
            <div class="cajitaForm" id="DivRegistro">
                <form id="formRegistro"  action="registrarAlumno.jsp" method="post">
                    <div class="primera parte">
                        <label for="boleta">Boleta:</label>
                        <input type="text" id="Boleta" name="Boleta" style=" width: 400px; margin: auto; margin-right:35px;"  onkeypress=" return validarEnteros(event)">
                    </div>

                    <div class="segundaparte">
                        <label for="semestre">Seleccione un semestre:</label>

                        <select id="Semestres" name="Semestres" style=" width: 487px; text-align: center; margin-right:35px;" >
                            <option value="">Seleccione un semestre</option>
                            <%
                                Semestre sem = new Semestre();
                                try{
                                    out.println(sem.cargarComboSemestres());
                                }catch(SQLException e){
                                    out.println("<option value=''>Error al cargar los semestres</option>");
                                }
                            %>

                        </select>

                        <label for="grupos">Seleccione un grupo:</label>
                        <select id="Grupos" name="Grupos" style=" width: 487px; margin: auto; margin-right:35px;">
                            <option value="">Seleccione un grupo</option>
                            <%
                                Grupo grup = new Grupo();
                                try{
                                    out.println(grup.cargarComboGrupos());
                                }catch(SQLException e){
                                    out.println("<option value=''>Error al cargar los grupos</option>");
                                }
                            %>

                        </select>

                        <script>
                            $(document).ready(function () {
                                $("#Semestres").change(function () {
                                    $("#Grupos").find("option").show().not("." + this.value + "opcGrupo").hide();
                                    $("#Grupos").val($("#Grupos").find("option:visible:first").val());
                                }).change();
                            });
                        </script>

                    </div>

                    <div class="terceraparte">

                        <label for="Correo"> Email:</label>
                        <input type="text" style=" width: 400px; margin: auto; margin-right:35px;" id="Correo" name="Correo">
                        <label for="Nombre_Usuario"> Nombre de usuario: </label>
                        <input type="text"  style=" width: 400px; margin: auto; margin-right:35px;" id="Nombre_Usuario" name="Nombre_Usuario">
                        <label for="Password"> Contraseña: </label>
                        <input type="password"  style=" width: 400px; margin: auto; margin-right:35px;" id="Password" name="Password">
                        <label for="Confirm_Password"> Confirme su contraseña: </label>
                        <input type="password" style=" width: 400px; margin: auto; margin-right:35px;"  id="Confirm_Password" name="Confirm_Password">
                    </div>
                    <br/><br/>
                    <ul class="actions">
                        <li>
                            <input type="submit" value="Registrarse" id="BRegistrarse" name="BRegistrarse">
                        </li>
                    </ul>
                </form>

            </div>

            <div class="copiright"> 
                &copy;
                Designed by SUSHI Software.
            </div>

        </footer>

    </body>
</html>
