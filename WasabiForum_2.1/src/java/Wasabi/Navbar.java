/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Wasabi;


/**
 *
 * @author Charly Anguiano
 */
public class Navbar {
    
    public String imprimirNavbar(String identificador, String tipoUsuario) {
        String navbar;
        String gestionArea = "";
        String area;
        
        boolean esJefe = ("5".equals(tipoUsuario));
        
        if(esJefe){
            gestionArea = "<form name=\"formGestoArea\" action=\"gestorArea.jsp\" method=\"post\">\n"
                + "<input type=\"text\" name=\"numEmpleado\" value=\""+identificador+"\" style='display: none;' />\n"
                + "<p><input type=\"submit\" class=\"navbar-a2\" value=\"Cerrar Sesión\" style=\"\n"
                + "background: none;\n"
                + "border: none;\n"
                + "cursor: pointer;\n"
                + "text-align: left;\n"
                + "\"></p>\n"
                + "</form>";
        }
        
        navbar = "<div id='navbar-container'>" //Navbar Comprimida
                + "<div class='navbar-img-div' id='navbar-imagen-menu' onClick='open_navbar();'>\n"
                + "<img id=\"imagen-menu\" class=\"imagen-navbar\" src=\"imagenes/menu.png\">\n"
                + "</div>\n"
                + "<div class=\"navbar-img-div\" id=\"navbar-imagen-close\" onClick=\"close_navbar();\">\n"
                + "<img id=\"imagen-close\" class=\"imagen-navbar\" src=\"imagenes/close.png\" >\n"
                + "</div>\n"
                + "<div class=\"outer\">\n"
                + "<div id=\"navbar-image-container\" class=\"middle\">\n"
                + "<div class=\"navbar-img-div\" id=\"navbar-imagen-home\">\n"
                + "<a href=\"foro.jsp\">\n"
                + "<img class=\"imagen-navbar\" src=\"imagenes/home.png\">\n"
                + "</a>\n"
                + "</div>\n"
                + "<form name=\"formularioPerfilComprimido\" method=\"post\" action=\"miPerfil.jsp\">\n"
                + "<div class=\"navbar-img-div\" id=\"navbar-imagen-profile\">"
                + "<input type=\"text\" value=\"" + identificador + "\""
                + "style=\"display: none;\">"
                + "<input type=\"image\" class=\"imagen-navbar\" src=\"imagenes/profile.png\">\n"
                + "</div>\n"
                + "</form>\n"
                + "<div class=\"navbar-img-div\" id=\"navbar-imagen-notification\" onclick=\"open_notification_bar();\">\n"
                + "<img class=\"imagen-navbar\" src=\"imagenes/notification.png\">\n"
                + "</div>\n"
                + "<div class=\"navbar-img-div\" id=\"navbar-imagen-search\">\n"
                + "<a href=\"busquedaUsuario.jsp\">\n"
                + "<img class=\"imagen-navbar\" src=\"imagenes/search.png\">\n"
                + "</a>\n"
                + "</div>\n"
                + "</div>\n"
                + "</div>\n"
                + "</div>"
                //Imprimir navbar extendida
                + "<div id=\"extended-navbar-container\">\n"
                + "<div id=\"titulo-navbar\">\n"
                + "<p>Wasabi Forum<p>\n"
                + "</div>\n"
                + "<div class=\"outer\">\n"
                + "<div class=\"middle\">\n"
                + "<div class=\"navbar-texto\">\n"
                + "<p><a href=\"foro.jsp\" class=\"navbar-a\">Inicio</a></p>\n"
                + "</div>\n"
                + "<div class=\"navbar-texto\">\n"
                + "<form name=\"formularioPerfil\" method=\"post\" action=\"miPerfil.jsp\">\n"
                + "<input type=\"text\" value=\"" + identificador + "\" \n"
                + "style=\"display: none;\">\n"
                + "<p><input type=\"submit\" class=\"navbar-a\" value=\"Mi perfil\" style=\"\n"
                + "background: none;\n"
                + "border: none;\n"
                + "cursor: pointer;\n"
                + "\"></p>\n"
                + "</form>\n"
                + "</div>\n"
                + "<div class=\"navbar-texto\">\n"
                + "<p><a href=\"#\" class=\"navbar-a\" onclick=\"open_notification_bar();\">Notificaciones</a></p>\n"
                + "</div>\n"
                + "<div class=\"navbar-texto\">\n"
                + "<p><a href=\"busquedaUsuario.jsp\" class=\"navbar-a\">Buscar usuario</a></p>\n"
                + "</div>\n"
                + "</div>\n"
                + "</div>\n"
                + "<div id=\"navbar-opc\">\n"
                + gestionArea 
                + "<form action=\"cerrarSesion.jsp\" method=\"post\" name=\"logout\">\n"
                + "<p><input type=\"submit\" class=\"navbar-a2\" value=\"Cerrar Sesión\" style=\"\n"
                + "background: none;\n"
                + "border: none;\n"
                + "cursor: pointer;\n"
                + "text-align: left;\n"
                + "\"></p>\n"
                + "</form>\n"
                + "</div>\n"
                + "</div>";
        return navbar;
    }
}
