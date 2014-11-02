package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * Created by Cesar on 02/11/2014.
 */
@Entity
@Table(name = "configuraciones")
@DynamicUpdate
public class ConfiguracionModel {

    private int id;
    private String correo;
    private String passwordCorreo;
    private String carpetaScriptRespaldo;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "correo", nullable = true)
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Column(name = "password_correo", nullable = true)
    public String getPasswordCorreo() {
        return passwordCorreo;
    }

    public void setPasswordCorreo(String passwordCorreo) {
        this.passwordCorreo = passwordCorreo;
    }

    @Column(name = "carpeta_script_respaldo", nullable = true)
    public String getCarpetaScriptRespaldo() {
        return carpetaScriptRespaldo;
    }

    public void setCarpetaScriptRespaldo(String carpetaScriptRespaldo) {
        this.carpetaScriptRespaldo = carpetaScriptRespaldo;
    }
}
