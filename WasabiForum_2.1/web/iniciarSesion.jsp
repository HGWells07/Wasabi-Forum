<%-- 
    Document   : iniciarSesion
    Created on : 2/05/2017, 04:11:46 PM
    Author     : Charly Anguiano
--%>

<%@page import="Wasabi.Profesor"%>
<%@page import="Wasabi.Alumno"%>
<%@page import="Wasabi.DataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    ResultSet rs = null;
    DataBase db = new DataBase();

    String identificador = request.getParameter("usuarioIn");
    String password = request.getParameter("contraIn");

    //Filtrar tipo de usuario
    //Numero de empleado: digitos = 5
    db.conectar();

    boolean esAlumno = (identificador.length() == 10);
    boolean esProfesor = (identificador.length() == 5);

    if (esAlumno) {
        Alumno alumno = new Alumno();

        if (alumno.iniciarSesion(identificador, password)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("identificador", identificador);
            rs = alumno.getAlumnoPorID(identificador);

            while (rs.next()) {
                sesion.setAttribute("idUsuario", rs.getString("usuario.idUsuario"));
                sesion.setAttribute("nombreUsuario", rs.getString("usuario.nombre"));
                sesion.setAttribute("grupo", rs.getString("grupo.nombre")); //Exclusivo Alumno
                sesion.setAttribute("email", rs.getString("usuario.correo"));
                sesion.setAttribute("tipoUsuario", rs.getString("usuario.idRol"));
            }

            response.sendRedirect("foro.jsp");
        } else {
            //out.println("<script>alert('La boleta / numero de empleado y contraseña no coinciden, intente de nuevo');</script>");
            response.sendRedirect("index.jsp?e='Error'");
        }
    } else if(esProfesor){
        Profesor profesor = new Profesor();
        
        if(profesor.iniciarSesion(identificador, password)){
            HttpSession sesion = request.getSession();
            sesion.setAttribute("identificador", identificador);
            rs = profesor.getProfesorPorID(identificador);
            

            while (rs.next()) {
                sesion.setAttribute("idUsuario", rs.getString("usuario.idUsuario"));
                sesion.setAttribute("nombreUsuario", rs.getString("usuario.nombre"));
                sesion.setAttribute("email", rs.getString("usuario.correo"));
                sesion.setAttribute("tipoUsuario", rs.getString("usuario.idRol"));
            }
            
            if(sesion.getAttribute("tipoUsuario").equals("5")){
                ResultSet rsArea = db.consulta("select * from area "
                        + "inner join usuario on area.jefe = usuario.idUsuario"
                        + "where usuario.idUsuario = '" + sesion.getAttribute("idUsuario") + "';");
            }

            response.sendRedirect("foro.jsp");
        } else {
            response.sendRedirect("index.jsp?e='Error'");
        }
    } else {
        response.sendRedirect("index.jsp?e='Error'");
    }


%>
