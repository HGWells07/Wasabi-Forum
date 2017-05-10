<%-- 
    Document   : registrarAlumno
    Created on : 3/05/2017, 07:33:37 PM
    Author     : Charly Anguiano
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1" import="Wasabi.*, java.sql.*" %>
<%
    DataBase bd = new DataBase();
    bd.conectar();
    Statement s = bd.getC().createStatement();
    ResultSet rs;

    String email = request.getParameter("Correo");
    String nombreUsuario = request.getParameter("Nombre_Usuario");
    String password = request.getParameter("Password");
    String confirmPassword = request.getParameter("Confirm_Password");
    String boleta = request.getParameter("Boleta");
    String grupo = request.getParameter("Grupos");

    boolean lenBoleta = (boleta.length() == 10);
    boolean coincidePass = (password.equals(confirmPassword));
    
    if (lenBoleta && coincidePass) {

        Alumno alumno = new Alumno(boleta, grupo, nombreUsuario, email, password);
        
        String idUsuario;

        try {
            alumno.registrarAlumno();

            HttpSession sesion = request.getSession();
            sesion.setAttribute("identificador", boleta);
            sesion.setAttribute("nombreUsuario", nombreUsuario);
            session.setAttribute("tipoUsuario", "3");
            sesion.setAttribute("grupo", grupo);
            sesion.setAttribute("email", email);
            
            rs = alumno.getAlumnoPorID(boleta);
            
            while(rs.next()){
                idUsuario = rs.getString("alumnos.idUsuario");
                sesion.setAttribute("idUsuario", idUsuario);
            }

            response.sendRedirect("foro.jsp");
        } catch (SQLException e) {
            out.println(e.toString());
        }
    } else {
        response.sendRedirect("index.jsp");
    }

%>
