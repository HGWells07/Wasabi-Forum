<%-- 
    Document   : BAlumno
    Created on : 7/05/2017, 04:20:43 PM
    Author     : net_m
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*" %>
        <%
            String semestre= request.getParameter("semestree");
            String grupo= request.getParameter("grupoo");
            Connection con = null;
            Statement sta = null;
            ResultSet cuadritos = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost/foroprueba", "root", "n0m3l0");
                sta = con.createStatement();

            } catch (SQLException error) {
                out.print(error.toString());
            }

            try {
                cuadritos = sta.executeQuery("select usuario.nombre from alumnos inner join usuario inner join grupo inner join semestre on alumnos.idUsuario  = usuario.idUsuario where grupo.idGrupo='"+grupo+"'and semestre.idSemestre='"+semestre+"';");
                out.println("<table border='1'>");
                while (cuadritos.next()) {
                    String nom = cuadritos.getString("nombre");
                    
                    out.println("<tr>");
                    out.println("<td>" + nom + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            } catch (SQLException error) {
                out.print(error.toString());
            }

        %>
</html>
