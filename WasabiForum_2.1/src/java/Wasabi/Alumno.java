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
public class Alumno {
    
    private String boleta;
    private String grupo;
    private Usuario usuario;
    
    Statement s = null;
    ResultSet rs = null;
    
    private DataBase db = new DataBase();
    PreparedStatement ps = null;
    /*
    String nombreUsuario;
    String email;
    String password;
    String tipoUsuario;
    String idUsuario;
    */
    
    public Alumno(){
        
    }
    
    public Alumno(String boleta, String grupo, String nomUsuario, String email, String password){
        this.boleta = boleta;
        this.grupo = grupo;
        this.usuario = new Usuario(nomUsuario, email, password);
    }
    
    public void registrarAlumno() throws SQLException{
        
        String idGrupo = this.grupo;
        String idUsuario = "0";
        
        db.conectar();
        PreparedStatement ps;
        
        String insertUsuario = ("INSERT INTO usuario(nombre, correo, contraseña, idRol) values("
                        + "?, " //NombreUsuario
                        + "?, " //ContraseñaUsuario
                        + "?, " //CorreoUsuario
                        + "?" //idRolUsuario
                        + ");");
        ps = db.getC().prepareStatement(insertUsuario);
        ps.setString(1, this.usuario.getNombreUsuario());
        ps.setString(2, this.usuario.getEmail());
        ps.setString(3, this.usuario.getPassword());
        ps.setString(4, "3");
        ps.executeUpdate();
        
        s = db.getC().createStatement();
        ResultSet rsIdUsuario = s.executeQuery("SELECT idUsuario FROM usuario\n" +
                            "ORDER BY idUsuario DESC\n" +
                            "LIMIT 1;");
        
        while(rsIdUsuario.next()){
            idUsuario = rsIdUsuario.getString("idUsuario");
        }
        
        s = db.getC().createStatement();
        
        String insertAlumno = ("INSERT INTO alumnos(boleta, idGrupo, idUsuario) values"
                + "(?," //Boleta
                + "?," //IdGrupo
                + "?);"); //IdUsuario
        ps = db.getC().prepareStatement(insertAlumno);
        ps.setString(1, boleta);
        ps.setString(2, idGrupo);
        ps.setString(3, idUsuario);
        ps.executeUpdate();
        
        db.cierraConexion();
    }
    
    public void cambiarGrupo(String boleta){
        
    }
    
    public boolean iniciarSesion(String boleta, String password) throws SQLException{
        ResultSet rsIniciarSesion;
        
        int contadorResultados = 0;
        
        db.conectar();
        
        String queryBuscar = ("SELECT * FROM alumnos INNER JOIN usuario ON alumnos.idUsuario = usuario.idUsuario WHERE boleta = ? AND contraseña = ?;");
        
        PreparedStatement psIniciarSesion = db.getC().prepareStatement(queryBuscar);
        
        psIniciarSesion.setString(1, boleta);
        psIniciarSesion.setString(2, password);
        rsIniciarSesion = psIniciarSesion.executeQuery();
        
        while(rsIniciarSesion.next()){
            contadorResultados++;
            break;
        }
        
        return contadorResultados == 1;
    }
    
    public void actualizarSesionPerfil(){
        
    }
    
    public String imprimirPerfil(String boleta, String nombre, String correo, String grupo){
        String perfil = "<h3>"+nombre+"<small>&nbsp;&nbsp;&nbsp;(Alumno)&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\"Configuracion\" onclick=\"abrirVentana();\" class=\"btn btn-sm\"></small></h3>\n" +
"                        <span>Correo: "+correo+"&nbsp;&nbsp;|&nbsp;&nbsp;Grupo: "+grupo+"&nbsp;&nbsp;|&nbsp;&nbsp;Boleta: "+boleta+"</span>";
        return perfil;
    }
    
    public ResultSet getAlumnoPorID(String idAlumno) throws SQLException{
        String query = "SELECT * FROM usuario " +
"                INNER JOIN alumnos ON usuario.idUsuario = alumnos.idUsuario " +
"                INNER JOIN grupo ON alumnos.idGrupo = grupo.idGrupo " +
"                WHERE alumnos.Boleta = ?;";
        db.conectar();
        PreparedStatement psQueryPerfil = db.getC().prepareStatement(query);
        psQueryPerfil.setString(1, idAlumno);
        return psQueryPerfil.executeQuery(); 
    } 

    public String getBoleta() {
        return boleta;
    }

    public String getIdGrupo() {
        return grupo;
    }

    public Usuario getIdUsuario() {
        return usuario;
    }

    public Statement getS() {
        return s;
    }

    public ResultSet getRs() {
        return rs;
    }
}
