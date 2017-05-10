<%-- 
    Document   : IngresarArea
    Created on : 22-abr-2017, 14:51:46
    Author     : Ricardo
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.io.*,Wasabi.Area,Wasabi.DataBase" %>
<%
            DataBase bd = new DataBase();
            bd.conectar();
           Area area=new Area();
           Connection c=null;
           Statement s= null;
           ResultSet r=null;
           String nombrearea=request.getParameter("NomArea");
           String nombrejefe=request.getParameter("injefearea");
           
           HttpSession sesion = request.getSession();
          
           try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               c=bd.getC();
               s=c.createStatement();
           }catch(SQLException error){
              out.print(error.toString());
           }
           
                try{
                    
                    area.crearArea(nombrearea, nombrejefe);
                    response.sendRedirect("AdmiEscolarFinal.jsp?exito='registroarea'");
                }catch(SQLException error){
                    out.println(error.toString());
                }

  %>
