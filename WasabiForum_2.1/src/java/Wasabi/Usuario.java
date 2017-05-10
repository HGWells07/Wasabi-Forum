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
public class Usuario {
    
    private String idUsuario;
    private String nombreUsuario;
    private String email;
    private String password;
    private String idRol;
    private String tipoUsuario;
    
    private DataBase db = new DataBase();
    
    // Método para buscar usuarios por su id
    
    public String getNombrePorID(String idUsuario) throws SQLException{
        db.conectar();
        String nombre = "Usuario de WF";
        ResultSet rsCuentas = db.consulta("select * from usuario where idUsuario = "+idUsuario+";"); //Busqueda de usuario
        while(rsCuentas.next()){
            nombre = rsCuentas.getString("nombre");
        }
        return nombre;
    }
    
    // Constructor para crear alumnos:
    
    public Usuario(String nombreUsuario, String email, String password) {
        this.nombreUsuario = nombreUsuario;
        this.email = email;
        this.password = password;
        this.tipoUsuario = "3";
    }
    
    //Constructor para crear profesores desde el módulo administración
    
    public Usuario(String nombre, String password) {
        this.nombreUsuario = nombre;
        this.email = "email@ejemplo";
        this.password = password;
        this.tipoUsuario = "2"; //Id del rol usuario de profesor
    }
    
    public Usuario(){
     // Para usar los métodos que no requieren registrar un usuario    
    }
    
    public ResultSet buscarUsuario(String idUsuario) throws SQLException{
        db.conectar();
        ResultSet rsCuentas = db.consulta("select * from usuario where idUsuario = "+idUsuario+";"); //Busqueda de usuario
        return rsCuentas;
    }
    
    
    public String getPasswordPorID(String idUsuario) throws SQLException{
        db.conectar();
        String pass="";
        String query = "select contraseña from usuario where idUsuario = "+idUsuario+";";
        ResultSet rsCuentas = db.consulta(query);
        while(rsCuentas.next()){
            pass = rsCuentas.getString("contraseña");
        }
        return pass;
    }
    //Para eliminar la cuenta
    
    public void eliminarCuenta(String idUsuario){
        
    }
    
    public void editarPerfil(String nombreUsuario, String email){
        this.nombreUsuario = nombreUsuario;
        this.email = email;
    }
    
    public void cambiarPassword(String newPassword){
        this.password = newPassword;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getIdUsuario() {
        return idUsuario;
    }
    
}
