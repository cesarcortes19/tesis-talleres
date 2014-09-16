package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 06/08/2014.
 */
@Entity
@Table(name = "alumno")
@DynamicUpdate
public class AlumnoModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_alumno", unique = true, nullable = false)
    private int id;
    @Column(name = "nombre", nullable = false)
    private String nombre;
    @Column(name = "apellido", nullable = false)
    private String apellido;
    @Column(name = "edad", nullable = false)
    private int edad;
    @Column(name = "grado", nullable = false)
    private String grado;
    @Column(name = "seccion", nullable = false)
    private String seccion;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user", nullable = false, updatable = true)
    private UserModel userModel;

/*    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "alumno_taller", joinColumns = {
            @JoinColumn(name = "id_alumno", nullable = false, updatable = true) },
            inverseJoinColumns = { @JoinColumn(name = "id_taller",
                    nullable = false, updatable = true) })
    private Set<TallerModel> tallerModelSet = new HashSet<TallerModel>(0);*/

    @OneToMany(fetch = FetchType.EAGER,  cascade = CascadeType.ALL, mappedBy = "alumnoModel")
    private Set<AlumnoTallerModel> alumnoTallerModelSet = new HashSet<AlumnoTallerModel>();

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


    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }


    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }


    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }


    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

/*    public Set<TallerModel> getTallerModelSet() {
        return tallerModelSet;
    }

    public void setTallerModelSet(Set<TallerModel> tallerModelSet) {
        this.tallerModelSet = tallerModelSet;
    }*/

    public Set<AlumnoTallerModel> getAlumnoTallerModelSet() {
        return alumnoTallerModelSet;
    }

    public void setAlumnoTallerModelSet(Set<AlumnoTallerModel> alumnoTallerModelSet) {
        this.alumnoTallerModelSet = alumnoTallerModelSet;
    }


}
