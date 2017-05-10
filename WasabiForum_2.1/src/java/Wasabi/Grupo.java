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
public class Grupo {

    private String idGrupo;
    private String idSemestre;
    private String nombre;
    ResultSet rsindicesem = null;
    String semestre;
    int idSem;
    PreparedStatement ps = null;

    private DataBase db = new DataBase();

    public void creargrupo(String nombre, String semestre) throws SQLException {
        db.conectar();
        this.semestre = semestre;
        this.nombre = nombre;

        rsindicesem = db.consulta("Select * from semestre where nombre='" + semestre + "';");
        while (rsindicesem.next()) {
            idSem = rsindicesem.getInt(1);
        }
        String insert = ("insert into grupo (nombre,idSemestre) values(?,?);");
        ps = db.getC().prepareStatement(insert);
        ps.setString(1, nombre);
        ps.setInt(2, idSem);
        ps.execute();
        db.cierraConexion();
    }

     
    
     public void elimimargrupo(String nombre) throws SQLException {
        db.conectar();
        this.idSemestre=nombre;
        ps = db.getC().prepareStatement("{call eliminar_grupo(?)}");
        ps.setString(1,nombre);
        ps.executeUpdate();
        db.cierraConexion();
    }

    public String getNombrePorID() {
        String nombreGrupo = "";

        return nombreGrupo;
    }

    public String cargarComboGrupos() throws SQLException {

        db.conectar();

        ResultSet grup;
        String grupore;
        String semestre;
        String idgrup;

        String combos = "";

        grup = db.consulta("select * from grupo ORDER BY nombre;");
        while (grup.next()) {
            grupore = grup.getString("Nombre");
            semestre = grup.getString("idSemestre");
            idgrup = grup.getString("idGrupo");
            combos += "<option value='" + idgrup + "' class='" + semestre + "opcGrupo'>" + grupore + "</option>";

        }

        return combos;
    }

}
