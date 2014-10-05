package com.cursos.model;

import com.cursos.interfaces.UsuarioInterface;
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
public class UserModel implements UsuarioInterface {
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
    private boolean enable;
    @Transient
    private String userInfo;
    @Transient
    private String confirmPassword;
    private String fullName;

    @Override
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }
    @Override
    public void setId(int id) {
        this.id = id;
    }
    @Override
    @Column(name = "nombre", unique = false)
    public String getNombre() {
        return nombre;
    }
    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    @Override
    @Column(name = "apellido", unique = false)
    public String getApellido() {
        return apellido;
    }
    @Override
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    @Override
    @Column(name = "cedula", unique = true)
    public String getCedula() {
        return cedula;
    }
    @Override
    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
    @Override
    @Column(name = "email2", unique = true)
    public String getEmail2() {
        return email2;
    }
    @Override
    public void setEmail2(String email2) {
        this.email2 = email2;
    }
    @Override
    @Column(name = "email", unique = true)
    public String getEmail() {
        return email;
    }
    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "role_id", nullable = true)
    public RoleModel getRoleModel() {
        return roleModel;
    }
    @Override
    public void setRoleModel(RoleModel roleModel) {
        this.roleModel = roleModel;
    }
    @Override
    @Column(name = "password", nullable = false)
    public String getPassword() {
        return password;
    }
    @Override
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL,mappedBy = "userModel")
    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }
    @Override
    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }
    @Override
    @Column(name = "direccion")
    public String getDireccion() {
        return direccion;
    }
    @Override
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    @Override
    @Column(name = "telefono1")
    public String getTelefono1() {
        return telefono1;
    }
    @Override
    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }
    @Override
    @Column(name = "telefono2")
    public String getTelefono2() {
        return telefono2;
    }
    @Override
    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }
    @Override
    @Column(name = "observaciones")
    public String getObservaciones() {
        return observaciones;
    }
    @Override
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getUserInfo() {
        String userInfo = this.nombre+" "+this.apellido+" C.I:"+this.cedula;
        return userInfo;
    }

    public void setUserInfo(String userInfo) {
        this.userInfo = userInfo;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    @Column(name = "enable")
    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    @Transient
    public String getFullName() {
        String userInfo = this.nombre+" "+this.apellido;
        return userInfo;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
