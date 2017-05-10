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
public class Academia {
    
    private String idAcademia;
    private String nombre;
    private String idArea;
    private String idPresidente;
    private String color;
    
    private DataBase db = new DataBase();
    
    private ResultSet rs = null;
    
    public String getNombrePorID(String idAcademia){
        String nombreAcademia = "";
        
        return nombreAcademia;
    }
    
    public String cargarAcademiasSelect() throws SQLException{
        String opciones = "";
        String nombreOpcion;
        String idAcademiaOpcion;
        String color;
        
        db.conectar();
        rs = db.consulta("SELECT * FROM academia inner join catcolores on academia.color = catcolores.idColor;");
        
        while(rs.next()){
            nombreOpcion = rs.getString("nombre");
            idAcademiaOpcion = rs.getString("idAcademia");
            color = rs.getString("catcolores.color");
            opciones += "<option value='" + idAcademiaOpcion + "' style='background-color: "+color+"'>" + nombreOpcion + "</option>";
        }
        
        return opciones;
    }
    
}
