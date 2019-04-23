/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import proyectolbd.interfaz.iniciosesion;

/**
 *
 * @author Sebastian
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        iniciosesion ini = new iniciosesion();
        ini.setVisible(true);
        Consulta fn = new Consulta();
        try {
            ResultSet rset = fn.consultaSP("Select * from v_clientes");
            while(rset.next()){
                System.out.println(rset.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
}
