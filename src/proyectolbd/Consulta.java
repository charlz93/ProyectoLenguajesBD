/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carmo
 */
public class Consulta {
    Conexion con = new Conexion();
    
    private Statement declaracion(){
        Statement stmt = null;
        try {
            stmt = con.conexion().createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stmt;
    }
    public ResultSet consultaSP(String consulta) throws SQLException{
        ResultSet rset = declaracion().executeQuery(consulta);
        declaracion().close();
        return rset;
    }
    
    public CallableStatement consultaFN(String consulta) throws SQLException{
        CallableStatement cs = con.conexion().prepareCall(consulta);
        return cs;
    }
            
            
}
