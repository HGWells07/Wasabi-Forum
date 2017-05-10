/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Wasabi;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author CECyT9
 */
public class Materia {
    private String idMateria = "";
    private String nombre = "";
    private String idAcademia = "";
    
    private DataBase db = new DataBase();
    
    private ResultSet rs = null;
    
    public String cargarMateriasSelect(String parte) throws SQLException{
        String opciones = "";
        String nombreOpcion;
        String idMateriaOpcion;
        String idAcademiaOpcion;
        
        db.conectar();
        rs = db.consulta("SELECT * FROM materia;");
        
        while(rs.next()){
            nombreOpcion = rs.getString("nombre");
            idMateriaOpcion = rs.getString("idMateria");
            idAcademiaOpcion = rs.getString("idAcademia");
            opciones += "<option value='" + idMateriaOpcion + "' class='"+idAcademiaOpcion+parte+"'>" + nombreOpcion + "</option>";
        }
        
        return opciones;
    }
    
}
