/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import proyectolbd.interfaz.InicioSesion;

/**
 *
 * @author Sebastian
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Consulta c = new Consulta();
        try {
            c.update("update direccion set pais = 'CR' where id_cliente = 4");
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
