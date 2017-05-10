<%-- 
    Document   : EliminarProfesor
    Created on : 07-may-2017, 20:50:18
    Author     : Ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.io.*,Wasabi.Profesor,Wasabi.DataBase" %>
<%
            DataBase bd = new DataBase();
            bd.conectar();
           Profesor prof=new Profesor();
           Connection c=null;
           Statement s= null;
           ResultSet r=null;
           String nombre = request.getParameter("SelecProfesor");
          
           try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               c=bd.getC();
               s=c.createStatement();
           }catch(SQLException error){
              out.print(error.toString());
           }
           
                try{
                    r=s.executeQuery("select * from usuario where nombre='"+nombre+"';");
                   if(r.next()){
                      nombre=r.getString("nombre");
                   }
                   prof.eliminarProfesor(nombre);
                   response.sendRedirect("AdmiEscolarFinal.jsp?exito='registroarea'");
                }catch(SQLException error){
                    out.println(error.toString());
                }

  %>
