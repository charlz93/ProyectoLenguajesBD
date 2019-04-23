/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carmo
 */
public class Funciones {
    Conexion con = new Conexion();
    
    private Statement declaracion(){
        Statement stmt = null;
        try {
            stmt = con.conexion().createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(Funciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stmt;
    }
    public ResultSet consultaCliente(int id) throws SQLException{
        ResultSet rset = declaracion().executeQuery("Select * from v_clientes where id_cliente = "+id);
        declaracion().close();
        return rset;
    }
            
            
}
