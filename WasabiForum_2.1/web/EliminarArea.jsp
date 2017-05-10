<%-- 
    Document   : EliminarArea
    Created on : 8/05/2017, 12:16:46 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.io.*,Wasabi.Area,Wasabi.DataBase" %>
<%
            DataBase bd = new DataBase();
            bd.conectar();
           Area are=new Area();
           Connection c=null;
           Statement s= null;
           ResultSet r=null;
           String nombre=null;
           String snombre= request.getParameter("ElimArea");
           
           try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               c=bd.getC();
               s=c.createStatement();
           }catch(SQLException error){
              out.print(error.toString());
           }
           
                try{
                     r=s.executeQuery("select * from area where nombre='"+snombre+"';");
                     if(r.next()){
                        nombre=r.getString("nombre"); 
                     }
                   are.eliminarArea(nombre);
                   response.sendRedirect("AdmiEscolarFinal.jsp?exito='registroarea'");
                }catch(SQLException error){
                    out.println(error.toString() + "1 sdsds");
                }

  %>