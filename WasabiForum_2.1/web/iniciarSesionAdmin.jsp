<%-- 
    Document   : iniciarSesionAdmin
    Created on : 7/05/2017, 10:26:11 AM
    Author     : Charly Anguiano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String identificador = request.getParameter("UsuPrivi");
    String password = request.getParameter("ContraPrivi");

    if(identificador.equals("admin")&&password.equals("123456789")){
        HttpSession sesion = request.getSession();
        sesion.setAttribute("Usu", "admin");
        sesion.setAttribute("Contra", "admin");
        
        response.sendRedirect("AdmiEscolarFinal.jsp");
    } else {
        response.sendRedirect("index.jsp?e='Error'");
    }

%>
