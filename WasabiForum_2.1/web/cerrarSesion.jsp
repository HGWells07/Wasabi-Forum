<%-- 
    Document   : cerrarSesion
    Created on : 2/05/2017, 04:11:54 PM
    Author     : Charly Anguiano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    response.sendRedirect("index.jsp");
%>
