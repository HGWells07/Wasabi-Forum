<%-- 
    Document   : ConfigCuentaAlumno
    Created on : 8/05/2017, 08:14:21 AM
    Author     : Alumno
--%>

<%@page import="java.sql.*"%>
<%@page import="Wasabi.*"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    DataBase bd = new DataBase();

    bd.conectar();

    Connection c = bd.getC();
    Statement s = c.createStatement();
    ResultSet rs;

    HttpSession sesion = request.getSession();

    String newPassword = request.getParameter("contraAlum").toString();

    Usuario u = new Usuario();
    String formerPassword = u.getPasswordPorID(sesion.getAttribute("idUsuario").toString());
    if (formerPassword.equals(newPassword)) {
        response.sendRedirect("ConfigCuentaValidAlum.jsp");
    } else {
        response.sendRedirect("ConfigCuentaAlumno.jsp?e='error'");
    }

%>

