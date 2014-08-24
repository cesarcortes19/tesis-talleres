package com.cursos.to;

import com.cursos.model.AlumnoModel;
import com.cursos.model.RoleModel;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 16/08/2014.
 */
public class UsuarioTo {

    private int id;
    private String firstName;
    private String lastName;
    private String cedulaPadre;
    private String cedulaMadre;
    private String email;
    private RoleModel roleModel;
    private String password;
    private Set<AlumnoModel> alumnoModelSet = new HashSet<AlumnoModel>(0);
    private String direccion;
    private String telefono1;
    private String telefono2;
    private String observaciones;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCedulaPadre() {
        return cedulaPadre;
    }

    public void setCedulaPadre(String cedulaPadre) {
        this.cedulaPadre = cedulaPadre;
    }

    public String getCedulaMadre() {
        return cedulaMadre;
    }

    public void setCedulaMadre(String cedulaMadre) {
        this.cedulaMadre = cedulaMadre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public RoleModel getRoleModel() {
        return roleModel;
    }

    public void setRoleModel(RoleModel roleModel) {
        this.roleModel = roleModel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }

    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    public String getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}
