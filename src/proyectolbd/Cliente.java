/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectolbd;

/**
 *
 * @author carmo
 */
public class Cliente {
    private int id;
    private String nombre;
    private String correo;
    private int id_direccion;
    private int telefono;
    private String nif;
    private String n_comercial;

    public Cliente() {
    }

    public Cliente(int id, String nombre, String correo, int id_direccion, int telefono, String nif, String n_comercial) {
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.id_direccion = id_direccion;
        this.telefono = telefono;
        this.nif = nif;
        this.n_comercial = n_comercial;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(int id_direccion) {
        this.id_direccion = id_direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public String getN_comercial() {
        return n_comercial;
    }

    public void setN_comercial(String n_comercial) {
        this.n_comercial = n_comercial;
    }
    
}
