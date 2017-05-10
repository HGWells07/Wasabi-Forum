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
public class Semestre {

    DataBase db = new DataBase();
    
    public String cargarComboSemestres() throws SQLException {

        db.conectar();

        ResultSet rsSemestre;
        String idSemestre;
        String nombreSemestre;
        String combos = "";
        
        try {
            rsSemestre = db.consulta("select * from semestre;");
            while (rsSemestre.next()) {
                idSemestre = rsSemestre.getString("idSemestre");
                nombreSemestre = rsSemestre.getString("Nombre");
                combos += "<option value='" + idSemestre + "'>" + nombreSemestre + "</option>";
            }
        } catch (SQLException error) {
            error.toString();
        }
        
        return combos;
    }
}
