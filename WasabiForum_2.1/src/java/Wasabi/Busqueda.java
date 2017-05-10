/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Wasabi;
import java.sql.*;
/**
 *
 * @author net_m
 */
public class Busqueda {
    
    private DataBase db = new DataBase();

    private Date dt = new java.sql.Date(System.currentTimeMillis());

    private PreparedStatement ps = null;

    private ResultSet rs = null;

    private String contenido = "";
    private String fechaYHora = "";
    private String idPublicacion = "";
    private String idUsuario = "";
    private int votos = 0;

    //private boolean datosValidos = false;

    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public void setValoresRespuesta(String idUsuario, String contenido, String idPublicacion) {
        this.contenido = contenido;
        this.idPublicacion = idPublicacion;
        this.fechaYHora = sdf.format(dt);
        this.idUsuario = idUsuario;

        //datosValidos = true; //(contenido!=null&&idPublicacion!=null&&!"".equals(contenido));

    }

    public void crearRespuesta() throws SQLException {

        db.conectar();

        String statement = "INSERT INTO respuestas(contenido, fechaYHora, idPublicacion, idUsuario) values(?,?,?,?);";

        ps = db.getC().prepareStatement(statement);
        ps.setString(1, this.contenido);
        ps.setString(2, this.fechaYHora);
        ps.setString(3, this.idPublicacion);
        ps.setString(4, this.idUsuario);
        ps.executeUpdate();
        db.cierraConexion();
    }

    public ResultSet cargarRespuestas(String idPublicacionQuery) throws SQLException {
        db.conectar();

        String statement = "SELECT * FROM respuestas INNER JOIN usuario ON respuestas.idUsuario = usuario.idUsuario WHERE idPublicacion = ?";

        ps = db.getC().prepareStatement(statement);
        ps.setString(1, idPublicacionQuery);
        rs = ps.executeQuery();

        return rs;        
    }
    
    public String imprimirRespuestas(String nomUsuario, String contenidoImprimir, String fechaYHoraImprimir, String votos){
        String respuesta = "<div class='card my-3'>"
                    + "<div class='card-header'>"
                    + "<div class='row'>"
                    + "<div class='col-4'>"
                    //Agregar usuario después de agregar sesiones...

                    + "<i class='fa fa-user-o' aria-hidden='true'></i>&nbsp;<a href='#' class='card-text'>"+nomUsuario+"</a>"
                    + "</div>"
                    + "<div class='col-8 text-right'>"
                    + "<span class='badge badge-secondary text-muted'>"
                    + "<i class='fa fa-clock-o' aria-hidden='true'></i>&nbsp;" + fechaYHoraImprimir
                    + "</span></div></div></div>"
                    + "<div class='card-block'>"
                    + "<div class='row clearfix visible-sm'>"
                    + "<div class='col-sm-11'>"
                    + "<p class='card-text'>" + contenidoImprimir + "</p>"
                    + "</div>"
                    + "<div class='col-sm-1 justify-content-left'>"
                    + "<div class='row'>"
                    + "<i class='fa fa-sort-asc' aria-hidden='true'></i>"
                    + "</div>"
                    + "<div class='row'>" + votos + "</div>"
                    + "<div class='row'>"
                    + "<i class='fa fa-sort-desc' aria-hidden='true'></i>"
                    + "</div></div></div></div></div>";
        
        return respuesta;
    }

    public void votarRespuesta(int voto) {

    }
    
}
