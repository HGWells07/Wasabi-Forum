<%-- 
    Document   : crearPublicacion
    Created on : 2/05/2017, 04:16:10 PM
    Author     : Charly Anguiano
--%>

<%@page import="Wasabi.*, java.sql.*, java.util.Date, java.io.*"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
            
            //Cambiar conexion vieja por la nueva remasterizada de la clase
            DataBase bd = new DataBase();
            
            bd.conectar();
            
            Publicacion pub = new Publicacion();
            
            HttpSession sesion = request.getSession();
            String boleta = sesion.getAttribute("identificador").toString();
            
            try{
                
                String titulo = request.getParameter("inputTituloPublicacion");
                String descripcion = request.getParameter("inputDescripcion");
                String fecha;
                String idMateria = request.getParameter("selectMateria");
                
                Date dt = new java.util.Date();
                
                descripcion = descripcion.replaceAll("<", "&lt;");
                titulo = titulo.replaceAll(">", "&gt;");

                descripcion = descripcion.replaceAll(">", "&gt;");
                titulo = titulo.replaceAll("<", "&lt;");
                
                Emoji emoji = new Emoji();
                emoji.cargarEmojis();
                descripcion = emoji.remplazarEmojis(descripcion);
                
                titulo = emoji.remplazarEmojis(titulo);

                titulo = titulo.replaceAll("//cora;", "<i class='fa fa-heart' aria-hidden='true'></i>");

                java.text.SimpleDateFormat sdf = 
                     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                fecha = sdf.format(dt);

                pub.crearPublicacion(idMateria, titulo, descripcion, fecha, boleta);

                response.sendRedirect("foro.jsp");
            }catch(SQLException e){
                out.println(e.toString());
            }
        %>
