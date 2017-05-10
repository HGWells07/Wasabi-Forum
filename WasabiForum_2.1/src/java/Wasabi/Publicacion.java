/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Wasabi;

import java.sql.*;

/**
 *
 * @author Charly Anguiano
 */
public class Publicacion {

    private String idPublicacion;
    private String idMateria;
    private String fechaYHora;
    private String titulo;
    private String contenido;
    private String boleta;
    private String nombreUsuario;

    private final Date dt = new java.sql.Date(System.currentTimeMillis());

    private ResultSet rsPublicaciones = null;

    private PreparedStatement ps = null;

    private final DataBase db = new DataBase();

    //Crea la publicacion y la guarda en la base de datos
    public void crearPublicacion(String idMateria, String titulo, String contenido, String fechaYHora, String boleta, String idRol) throws SQLException {
        this.contenido = contenido;
        this.idMateria = idMateria;
        this.titulo = titulo;
        this.fechaYHora = fechaYHora;
        this.boleta = boleta;

        String idUsuario = "";

        db.conectar();
        ResultSet rsUsuarios;
        String query = "";

        if (idRol.equals("3")) {
            query = ("select * from alumnos inner join usuario on alumnos.idUsuario = usuario.idUsuario where alumnos.boleta = ?;");
        } else if(idRol.equals("2")||idRol.equals("4")||idRol.equals("5")){
            query = ("select * from profesores inner join usuario on profesores.idUsuario = usuario.idUsuario where profesores.NumeroEmpleado = ?");
        }
        
        ps = db.getC().prepareStatement(query);
            ps.setString(1, boleta);
            rsUsuarios = ps.executeQuery();

        while (rsUsuarios.next()) {
            idUsuario = rsUsuarios.getString("idUsuario");
            this.nombreUsuario = rsUsuarios.getString("usuario.nombre");
        }

        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fecha = sdf.format(dt);
        String insert = ("INSERT INTO publicacion(idMateria, titulo, contenido, fechaYHora, idUsuario) values("
                + "?, " //IdMateria
                + "?, " //titulo
                + "?, " //Contenido
                + "?," //fechaYHora
                + "?"
                + ");");
        ps = db.getC().prepareStatement(insert);
        ps.setString(1, idMateria);
        ps.setString(2, this.titulo);
        ps.setString(3, this.contenido);
        ps.setString(4, fecha);
        ps.setString(5, idUsuario);
        ps.executeUpdate();
        db.cierraConexion();
    }

    public ResultSet getRSPublicacionesAlumno(String boleta) throws SQLException {
        db.conectar();

        String query = ("select * from publicacion "
                + "inner join usuario on publicacion.idUsuario = usuario.idUsuario "
                + "inner join alumnos on usuario.idUsuario = alumnos.idUsuario "
                + " where boleta = ?");

        ps = db.getC().prepareStatement(query);

        ps.setString(1, boleta);

        return ps.executeQuery();
    }
    
    public ResultSet getRSPublicacionesProfesor(String numEmp) throws SQLException{
        db.conectar();

        String query = ("select * from publicacion "
                + "inner join usuario on publicacion.idUsuario = usuario.idUsuario "
                + "inner join profesores on usuario.idUsuario = profesores.idUsuario "
                + " where profesores.NumeroEmpleado = ?");

        ps = db.getC().prepareStatement(query);

        ps.setString(1, numEmp);

        return ps.executeQuery();
    }

    public ResultSet getRSPublicacionesForo() throws SQLException {
        db.conectar();
        rsPublicaciones = db.consulta("select * from publicacion order by fechaYHora desc limit 20;");
        return rsPublicaciones;
    }

    public ResultSet getRSPublicacionesMateria(String idMateria) throws SQLException {
        db.conectar();
        rsPublicaciones = db.consulta("select * from publicacion where idMateria = " + idMateria + " order by fechaYHora desc limit 20;");
        return rsPublicaciones;
    }

    public ResultSet getRSPublicacionPorId(String idPublicacion) throws SQLException {
        db.conectar();
        rsPublicaciones = db.consulta("select * from publicacion where idPublicacion = " + idPublicacion + ";");
        return rsPublicaciones;
    }

    public String imprimirPublicacionForo(String idPublicacion, String academiaPub, String materiaPub, String tituloPub, String fechaPub, String nombreUsuario, String color, String idRol) {
        String inverse = "class='card-block'";
        if (!"3".equals(idRol)) {
            inverse = "class='card-block card-inverse' style='background-color:#3D3F43;'";
        }
        String publicacion = ""
                + "<form name='" + idPublicacion + "' action='verPublicacionSeleccionada.jsp' method='post'>"
                + "<div class='card my-4' style='border-radius: 0px;'>"
                + "<input type='text' name='idPublicacion' value='" + idPublicacion + "' style='display: none;'>"
                + "<div class='card-block' style='background-color: " + color + ";'>"
                + "<div class='row'>"
                + "<div class='col-4'>"
                + "<i class='fa fa-user-o' aria-hidden='true'></i>&nbsp;<span class='card-text'><b>" + nombreUsuario + "</b></span>"
                + "</div>"
                + "<div class='col-8 text-right'>"
                + "<span class='badge badge-pill badge-default'>" + academiaPub + "</span> / <span class='badge badge-pill badge-success'>" + materiaPub + "</span>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "<div " + inverse + ">"
                + "<h5 class='card-title'>" + tituloPub + "</h5>"
                //+ "</div>"
                //+ "<div class='card-block text-muted'>"
                + "<hr/>"
                + "<div class='row'>"
                + "<div class='col-6'>"
                + "<button type='submit' class='btn btn-secondary btn-sm'>Respuestas</button>"
                + "</div>"
                + "<div class='col-6 text-right'>"
                + "<i class='fa fa-clock-o' aria-hidden='true'></i>&nbsp;" + fechaPub
                + "</div>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</form>";

        return publicacion;
    }

    public String imprimirPublicacionSeleccionada(String idPublicacion, String academiaPub, String materiaPub, String tituloPub, String fechaPub, String descripcionPub, String nombreUsuario, String color, String idRol) {
        String inverse = "class='card-block'";
        if (!"3".equals(idRol)) {
            inverse = "class='card-block card-inverse' style='background-color: " + color + ";'";
        }
        String publicacion = ""
                + "<form name='" + idPublicacion + "' action='verPublicacionSeleccionada.jsp' method='post'>"
                + "<div class='card my-4'>"
                + "<input type='text' name='idPublicacion' value='" + idPublicacion + "' style='display: none;'>"
                + "<div class='card-block' style='background-color: #3D3F43;'>"
                + "<div class='row'>"
                + "<div class='col-4'>"
                + "<i class='fa fa-user-o' aria-hidden='true'></i>&nbsp;<span  class='card-text'><b>" + nombreUsuario + "</b></span>"
                + "</div>"
                + "<div class='col-8 text-right'>"
                + "<span class='badge badge-pill badge-default'>" + academiaPub + "</span> / <span class='badge badge-success badge-pill'>" + materiaPub + "</span>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "<div " + inverse + ">"
                + "<h5 class='card-title'>" + tituloPub + "</h5>"
                + "<p class='card-text'>" + descripcionPub + "</p>"
                //+ "</div>"
                //+ "<div class='card-footer text-muted'>"
                + "<div class='row'>"
                + "<div class='col-12 text-right'>"
                + "<i class='fa fa-clock-o' aria-hidden='true'></i>&nbsp;" + fechaPub
                + "</div>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</form>";

        return publicacion;
    }

}
