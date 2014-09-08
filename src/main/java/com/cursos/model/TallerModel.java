package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 03/08/2014.
 */
@Entity
@Table(name = "taller")
@DynamicUpdate
public class TallerModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private int id;
    @Column(name = "nombre")
    private String name;
    @Column(name = "cantidad_alumnos_maxima")
    private int cantidadAlumnosMaxima;
    @Column(name = "cantidad_alumnos_actual")
    private int cantidadAlumnosactual;
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "horario")
    private String horario;
   /* private Set<AlumnoModel> alumnoModelSet = new HashSet<AlumnoModel>(0);*/


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public int getCantidadAlumnosMaxima() {
        return cantidadAlumnosMaxima;
    }

    public void setCantidadAlumnosMaxima(int cantidadAlumnosMaxima) {
        this.cantidadAlumnosMaxima = cantidadAlumnosMaxima;
    }


    public int getCantidadAlumnosactual() {
        return cantidadAlumnosactual;
    }

    public void setCantidadAlumnosactual(int cantidadAlumnosactual) {
        this.cantidadAlumnosactual = cantidadAlumnosactual;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    /*    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }

    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }*/
}
