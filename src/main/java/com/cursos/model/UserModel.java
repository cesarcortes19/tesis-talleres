package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 15/06/14.
 */

@Entity
@Table(name = "user")
@DynamicUpdate
public class UserModel {

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


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "nombre", unique = false)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Column(name = "apellido", unique = false)
    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Column(name = "cedula", unique = true)
    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    @Column(name = "email2", unique = true)
    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    @Column(name = "email", unique = true)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "role_id", nullable = true)
    public RoleModel getRoleModel() {
        return roleModel;
    }

    public void setRoleModel(RoleModel roleModel) {
        this.roleModel = roleModel;
    }

    @Column(name = "password", nullable = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL,mappedBy = "userModel")
    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }

    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }

    @Column(name = "direccion")
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Column(name = "telefono1")
    public String getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    @Column(name = "telefono2")
    public String getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    @Column(name = "observaciones")
    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}
