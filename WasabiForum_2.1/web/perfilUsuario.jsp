<%-- 
    Document   : perfilUsuario
    Created on : 7/05/2017, 06:42:48 PM
    Author     : Charly Anguiano
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1" import="Wasabi.*, java.io.*, java.sql.*, java.util.Date" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
            Connection c = null;
            Statement s = null;
            ResultSet rs = null;
            
            Respuesta respuesta = new Respuesta();
            
            DataBase db = new DataBase();
            
            HttpSession sesion = request.getSession();

            try{
              db.conectar();
              c = db.getC();
              s=c.createStatement();
            } catch(SQLException e){
              out.println(e.toString());
            }
            
            try{
                
                String contenido = request.getParameter("respuesta");
                String idPublicacion =request.getParameter("idPublicacion");
                String idUsuario = sesion.getAttribute("idUsuario").toString();
                
                
                Emoji emoji = new Emoji();
                
                idPublicacion = idPublicacion.replaceAll("'"," ");
                idPublicacion = idPublicacion.replaceAll(";"," ");
                
                contenido = contenido.replaceAll("<", "&lt;");
                contenido = contenido.replaceAll(">", "&gt;");
                
                emoji.cargarEmojis();
                contenido = emoji.remplazarEmojis(contenido);
                
                respuesta.setValoresRespuesta(idUsuario, contenido, idPublicacion);
                
                respuesta.crearRespuesta();
                
                response.sendRedirect("verPublicacionSeleccionada.jsp?idPublicacion="+idPublicacion);
            }catch(SQLException e){
                out.println(e.toString());
            }
        %>
