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
@Table(name = "talleres")
@DynamicUpdate
public class TalleresModel {

    private int id;
    private String name;
    private int cantidadAlumnosMaxima;
    private int cantidadAlumnosactual;
    private String horario;
   /* private Set<AlumnoModel> alumnoModelSet = new HashSet<AlumnoModel>(0);*/

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "nombre")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "cantidad_alumnos_maxima")
    public int getCantidadAlumnosMaxima() {
        return cantidadAlumnosMaxima;
    }

    public void setCantidadAlumnosMaxima(int cantidadAlumnosMaxima) {
        this.cantidadAlumnosMaxima = cantidadAlumnosMaxima;
    }

    @Column(name = "cantidad_alumnos_actual")
    public int getCantidadAlumnosactual() {
        return cantidadAlumnosactual;
    }

    public void setCantidadAlumnosactual(int cantidadAlumnosactual) {
        this.cantidadAlumnosactual = cantidadAlumnosactual;
    }

    @Column(name = "horario")
    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }


/*    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }

    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }*/
}
