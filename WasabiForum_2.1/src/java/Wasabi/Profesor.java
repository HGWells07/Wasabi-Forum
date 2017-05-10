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
public class Profesor {

    private String numeroEmpleado;
    private String idUsuario;
    private String nombre;

    PreparedStatement ps = null;
    DataBase db = new DataBase();
    CallableStatement rs;
    ResultSet rsindiceprof = null;

    int ind;

    public void crearMaestro(String nom, String numeroempl, String contra) throws SQLException {
        this.numeroEmpleado = numeroempl;
        this.nombre = nom;

        Usuario prof = new Usuario(nombre, contra);
        db.conectar();
        String insert = ("INSERT INTO usuario(contraseña,idRol,nombre) values(?,?,?);");
        ps = db.getC().prepareStatement(insert);
        ps.setString(1,contra);
        ps.setInt(2, 2);
        ps.setString(3,nom);
        ps.execute();
        rsindiceprof = db.consulta("select max(idUsuario) from usuario");
        while (rsindiceprof.next()) {
            ind = rsindiceprof.getInt(1);
        }

        String insertprof = ("INSERT INTO profesores(NumeroEmpleado,idUsuario) values(?,?);");
        ps = db.getC().prepareStatement(insertprof);
        ps.setString(1, numeroempl);
        ps.setInt(2, ind);
        ps.execute();
        db.cierraConexion();
    }
    
    public void eliminarProfesor(String nombre) throws SQLException{
        this.nombre = nombre;
       ps=db.getC().prepareStatement("{call eliminar_profesor(?)}");
       ps.setString(1, "julion");
       ps.executeUpdate();
       db.cierraConexion();

       rs=db.getC().prepareCall("call eliminar_profesor('"+nombre+"');");
        
    }
    
    public boolean iniciarSesion(String numEmpleado, String password) throws SQLException{
        ResultSet rsIniciarSesion;
        
        int contadorResultados = 0;
        
        db.conectar();

        String queryBuscar = ("SELECT * FROM profesores INNER JOIN usuario ON profesores.idUsuario = usuario.idUsuario WHERE NumeroEmpleado = ? AND usuario.contraseña = ?;");
        
        PreparedStatement psIniciarSesion = db.getC().prepareStatement(queryBuscar);
        
        psIniciarSesion.setString(1, numEmpleado);
        psIniciarSesion.setString(2, password);
        rsIniciarSesion = psIniciarSesion.executeQuery();
        
        while(rsIniciarSesion.next()){
            contadorResultados++;
            break;
        }
        
        return contadorResultados == 1;
    }
    
    public ResultSet getProfesorPorID(String numeroEmpleado) throws SQLException{
        String query = "SELECT * FROM usuario " +
"                INNER JOIN profesores ON usuario.idUsuario = profesores.idUsuario " +
"                WHERE profesores.NumeroEmpleado = ?;";
        db.conectar();
        PreparedStatement psQueryPerfil = db.getC().prepareStatement(query);
        psQueryPerfil.setString(1, numeroEmpleado);
        return psQueryPerfil.executeQuery();
    }
    
    public String imprimirPerfilProfesor(String boleta, String nombre, String correo){
        String perfil = "<h3>"+nombre+"<small>&nbsp;&nbsp;&nbsp;(Alumno)&nbsp;&nbsp;&nbsp;<input type=\"button\" value=\"Configuracion\" onclick=\"abrirVentana();\" class=\"btn btn-sm\"></small></h3>\n" +
"                        <span>Correo: "+correo+"&nbsp;&nbsp;|&nbsp;&nbsp;Boleta: "+boleta+"</span>";
        return perfil;
    }
    

}
