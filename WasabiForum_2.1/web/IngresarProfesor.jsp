
<%-- 
    Document   : IngresarProfesor
    Created on : 21/04/2017, 07:52:27 AM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*,Wasabi.Profesor,Wasabi.DataBase" %>
<%
            DataBase bd = new DataBase();
            bd.conectar();
           Profesor prof=new Profesor();
           Connection c=null;
           Statement s= null;
           ResultSet r=null;
           String contra=request.getParameter("Contrainput");
           String numempl=request.getParameter("NumEmplinput");
           String nombre = request.getParameter("NombreNuevoProfesor");
          
           try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               c=bd.getC();
               s=c.createStatement();
           }catch(SQLException error){
              out.print(error.toString());
           }
           
                try{
                     
                   prof.crearMaestro(nombre, numempl, contra);
                   response.sendRedirect("AdmiEscolarFinal.jsp?exito='registroarea'");
                }catch(SQLException error){
                    out.println(error.toString());
                }

  %>
  
