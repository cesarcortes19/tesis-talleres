package com.cursos.to;

import com.cursos.interfaces.UsuarioInterface;
import com.cursos.model.AlumnoModel;
import com.cursos.model.RoleModel;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 16/08/2014.
 */
public class UsuarioTo implements UsuarioInterface{

    private int id;
    private String nombre;
    private String apellido;
    private String cedula;
    private String email;
    private String email2;
    private RoleModel roleModel;
    private String password;
    private Set<AlumnoModel> alumnoModelSet = new HashSet<AlumnoModel>(0);
    private String direccion;
    private String telefono1;
    private String telefono2;
    private String observaciones;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }
    @Override
    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }
    @Override
    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }
    @Override
    public String getEmail2() {
        return email2;
    }
    @Override
    public void setEmail2(String email2) {
        this.email2 = email2;
    }
    @Override
    public String getEmail() {
        return email;
    }
    @Override
    public void setEmail(String email) {
        this.email = email;
    }
    @Override
    public String getApellido() {
        return apellido;
    }
    @Override
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    @Override
    public String getPassword() {
        return password;
    }
    @Override
    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public String getDireccion() {
        return direccion;
    }
    @Override
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    @Override
    public String getNombre() {
        return nombre;
    }
    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    @Override
    public String getCedula() {
        return cedula;
    }
    @Override
    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
    @Override
    public String getObservaciones() {
        return observaciones;
    }
    @Override
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    @Override
    public String getTelefono1() {
        return telefono1;
    }
    @Override
    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }
    @Override
    public String getTelefono2() {
        return telefono2;
    }
    @Override
    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }
    @Override
    public RoleModel getRoleModel() {
        return roleModel;
    }
    @Override
    public void setRoleModel(RoleModel roleModel) {
        this.roleModel = roleModel;
    }
}
