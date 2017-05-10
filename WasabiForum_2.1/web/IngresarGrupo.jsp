<%-- 
    Document   : IngresarGrupo
    Created on : 22-abr-2017, 18:40:49
    Author     : Ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.io.*,Wasabi.Grupo,Wasabi.DataBase" %>
<%
            DataBase bd = new DataBase();
            bd.conectar();
           Grupo grup=new Grupo();
           Connection c=null;
           Statement s= null;
           ResultSet r=null;
           String nombregrupo=request.getParameter("NomGrupo");
           String nombresem=request.getParameter("SelecSemestre1");
          
           try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               c=bd.getC();
               s=c.createStatement();
           }catch(SQLException error){
              out.print(error.toString());
           }
           
                try{
                    grup.creargrupo(nombregrupo, nombresem);
                   response.sendRedirect("AdmiEscolarFinal.jsp?exito='registroarea'");
                }catch(SQLException error){
                    out.println(error.toString());
                }

  %>
