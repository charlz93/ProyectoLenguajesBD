/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sebastian
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Conexion con = new Conexion();
        
        try {
            Statement stmt = con.conexion().createStatement();
            ResultSet rset = stmt.executeQuery("Select (10-20), sysdate from dual");
            
            while(rset.next()){
                System.out.println(rset.getInt(1));
                System.out.println(rset.getDate(2));
                
            }
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
