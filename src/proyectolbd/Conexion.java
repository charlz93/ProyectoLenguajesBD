/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;
import java.sql.*;
import oracle.jdbc.*;
/**
 *
 * @author carmo
 */
public class Conexion {
    Connection conec;

    Conexion(Connection conec) {
        this.conec = conec;
    }

    public Conexion() {
        
    }
    public Connection conexion(){
        try{
    conec = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","proyecto","proyecto");
   
    }catch(Exception e){
            System.err.println("No hay conexion error: " + e);
    }
         return conec;
    }
}    
