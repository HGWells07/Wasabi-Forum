<%-- 
    Document   : EliminarGrupo
    Created on : 8/05/2017, 08:25:28 AM
    Author     : Alumno
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
           String idgrup= request.getParameter("SelecGrupo");
           
           try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               c=bd.getC();
               s=c.createStatement();
           }catch(SQLException error){
              out.print(error.toString());
           }
           
                try{
                   grup.elimimargrupo(idgrup);
                   response.sendRedirect("AdmiEscolarFinal.jsp?exito='registroarea'");
                }catch(SQLException error){
                    out.println(error.toString() + "1 sdsds");
                }

  %>