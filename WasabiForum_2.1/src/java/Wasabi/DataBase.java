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
public class DataBase {
    private Connection c = null;
    private Statement s = null;
    
    private final String nombre = "jdbc:mysql://localhost/wasbiforum";
    private final String usuario = "root";

    private final String password = "n0m3l0";
    private final String driver = "com.mysql.jdbc.Driver";
    
    //=== MÉTODOS DE LA BASE DE DATOS =====================================================================

    public Connection getC() {
        return c;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void conectar(){
        try{
            Class.forName(this.driver).newInstance();
            c = DriverManager.getConnection(this.nombre, this.usuario, this.password);
            s = c.createStatement();
        } catch(ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e){
            System.out.println("Error " + e.getMessage());
        }
    }
    
    public void cierraConexion() throws SQLException{
        this.c.close();
    }
    
    public ResultSet consulta(String consulta) throws SQLException{
        return s.executeQuery(consulta);
    }
    
}
