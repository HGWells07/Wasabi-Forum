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
public class Area {

    private DataBase db = new DataBase();
    private String idArea;
    String nombre;
    private String idProfesor; // Jefe de area
    int indiceusuario;
    int indicerol=4; 
    private String jefe=null;

    PreparedStatement ps = null;
    Statement s = null;

    ResultSet rsindicearea = null;
    ResultSet rsindiceusu = null;

    public String getNombrePorID(String idArea) {
        String nombreArea = "";

        return nombreArea;
    }


    public void crearArea(String nombre, String jefe) throws SQLException {

        this.idProfesor = jefe;
        this.nombre = nombre;

        db.conectar();
        s = db.getC().createStatement();
        rsindiceusu = s.executeQuery("Select * from profesores where NumeroEmpleado='" + jefe + "';");
        while (rsindiceusu.next()) {
            indiceusuario = rsindiceusu.getInt("idUsuario");
        }

        String insert = ("INSERT INTO area(Nombre,Jefe) values(?,?);");
        ps = db.getC().prepareStatement(insert);
        ps.setString(1, nombre);
        ps.setInt(2, indiceusuario);

        ps.execute();
        String prof = ("update usuario set idRol=4 where idUsuario=" + indiceusuario + ";");
        ps = db.getC().prepareStatement(prof);
        ps.execute();
        db.cierraConexion();
    }
    
    public void eliminarArea(String nombre)throws SQLException{
        db.conectar();
        this.nombre = nombre;
        ps=db.getC().prepareStatement("{call eliminar_area(?)}");
        ps.setString(1, nombre);
        ps.executeUpdate();
        db.cierraConexion();
    }

    public String cargarComboArea() throws SQLException {

        db.conectar();

        ResultSet rsArea;
        String idAreaa;
        String nombreArea;
        String combos = "";

        try {
            rsArea = db.consulta("select * from area;");
            while (rsArea.next()) {
                idAreaa = rsArea.getString("idArea");
                nombreArea = rsArea.getString("nombre");
                combos += "<option value='" + idAreaa + "'>" + nombreArea + "</option>";
            }
        } catch (SQLException error) {
            error.toString();
        }

        return combos;
    }
    
}
