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
        Funciones fn = new Funciones();
        try {
            ResultSet rset = fn.consultaCliente(1);
            while(rset.next()){
                System.out.println(rset.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
}
