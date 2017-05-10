<%-- 
    Document   : verPublicacionSeleccionada
    Created on : 16/04/2017, 01:13:01 AM
    Author     : Charly Anguiano
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1" import="java.io.*, java.sql.*, Wasabi.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wasabi Forum - Beta</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/nav_style.css">
        <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    </head>
    <body>

        <%
            Connection c = null;
            Statement s = null;
            ResultSet rs = null;
            
            DataBase bd = new DataBase();
            
            Respuesta respuesta = new Respuesta();

            bd.conectar();
            c = bd.getC();
            
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

        <div id="capa-oscura" onclick='close_navbar(); close_notification_bar();'></div> <!--Con este div se oscurece el cuerpo al activar el menu-->

      <!--Cuerpo del foro-->


      <div class="container">
        <div class="row justify-content-center ml-2">
          <div id="columna-publicaciones" class="col-md-8 col-lg-9 col-sm-10 ml-5">

            
            <%
                
                //Cargar las publicaciones
                
                String tituloPub ="";
                String materiaPub ="";
                String academiaPub = "";
                String fechaPub = "";
                String idMateriaPub = "";
                String descripcionPub = "";
                String nombreUsuario = "";
                String idUsuario = "";
                String colorBase;
                String color = "#3A3A3A";
                String rolUsuario = "";

                
                String idPublicacion = request.getParameter("idPublicacion");
                
                try{
                    ResultSet rsAcademia = null;
                    Statement sAcademia = c.createStatement();
                    
                    ResultSet rsMateria = null;
                    Statement sMateria = c.createStatement();

                    Publicacion ps = new Publicacion();
                    
                    rs = ps.getRSPublicacionPorId(idPublicacion);
                    
                    Statement sUsuario = bd.getC().createStatement();
                    ResultSet rsUsuario = null;
                    
                    while(rs.next()){
                        tituloPub = rs.getString("titulo");
                        idMateriaPub = rs.getString("idMateria");
                        fechaPub = rs.getString("fechaYHora");
                        descripcionPub = rs.getString("contenido");
                        idPublicacion = rs.getString("idPublicacion");
                        idUsuario = rs.getString("idUsuario");
                        
                        rsUsuario = sUsuario.executeQuery("select * from usuario where idUsuario ='"+idUsuario+"';");
                                while (rsUsuario.next()){
                                    idUsuario = rsUsuario.getString("idUsuario");
                                    nombreUsuario = rsUsuario.getString("usuario.nombre");
                                    rolUsuario = rsUsuario.getString("usuario.idRol");
                                }
                        
                        rsMateria = sMateria.executeQuery("select * from materia where idMateria ='" + idMateriaPub +"';");

                        while(rsMateria.next()){
                            materiaPub = rsMateria.getString("nombre");
                        }
                        
                        rsAcademia = sAcademia.executeQuery("select * from Materia  "
                                        + "inner join academia on Materia.idAcademia = academia.idAcademia "
                                        + "inner join catcolores on academia.color = catcolores.idColor "
                                        + "where materia.nombre='" + materiaPub + "';");

                                while (rsAcademia.next()) {
                                    academiaPub = rsAcademia.getString("academia.nombre");
                                    colorBase = rsAcademia.getString("catcolores.color");
                                    if(!(colorBase==null)){
                                        color = colorBase;
                                    }
                                }
                        
                        String publicacionSeleccionada = ps.imprimirPublicacionSeleccionada(idPublicacion, academiaPub, materiaPub, tituloPub, fechaPub, descripcionPub, nombreUsuario, color, rolUsuario);
                        
                        out.println(publicacionSeleccionada);
                        
                    }
                }catch(SQLException e){
                    out.println(e.toString());
                }

            %>
            
          </div>
            
        </div>
            
        <!--Respuestas-->
            
        <div class="row justify-content-center ml-2">
            <div class="col-md-8 col-sm-10 col-lg-9 ml-5">
                <h3 class="">Respuestas</h3>
                <hr style="background-color: #94a0ab;" />
                
                <div class="card">
                    <div class="card-block">
                        <div class="form-group">
                            <form action="crearRespuesta.jsp" method="post" name="form-respuesta">
                                <input type="text" name="idPublicacion" value="
                                       <%out.println(idPublicacion);%>
                                       " style="display:none;">
                                <% out.println("<input type='text' style='display: none;' name='idPublicacion' value='"+idPublicacion+"');"); %>
                                <h5><label for="respuesta">Responde a esta pregunta</label></h5>
                                <textarea name="respuesta" rows="3" class="form-control"></textarea>
                                <br/>
                                <div class="row">
                                    <div class="col-12 text-right">
                                        <button type="submit" name="submitRespuesta" class="btn btn-success">Responder</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <!--Respuestas generadas por JSP's-->
                
                <%
                    
                    String contenidoImprimir = "";
                    String fechaYHoraImprimir = "";
                    String usuarioImprimir="";
                    String votosImprimir= "";
                    
                    rs = respuesta.cargarRespuestas(idPublicacion);
                    while(rs.next()){
                        
                        contenidoImprimir = rs.getString("contenido");
                        fechaYHoraImprimir = rs.getString("fechaYHora");
                        usuarioImprimir = rs.getString("usuario.nombre");
                        votosImprimir = rs.getString("votos");
                        
                        String respuestaImprimir = respuesta.imprimirRespuestas(usuarioImprimir, contenidoImprimir, fechaYHoraImprimir, votosImprimir);
                        out.println(respuestaImprimir);
                    }
                    
                %>
                
            </div>
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
