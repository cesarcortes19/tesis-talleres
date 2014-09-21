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
    @Column(name = "id_taller", unique = true, nullable = false)
    private int id;
    @Column(name = "nombre")
    private String name;
    @Column(name = "cantidad_alumnos_maxima")
    private int cantidadAlumnosMaxima;
    @Column(name = "cantidad_alumnos_actual")
    private int cantidadAlumnosactual;
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "horario_lunes")
    private String horarioLunes;
    @Column(name = "horario_martes")
    private String horarioMartes;
    @Column(name = "horario_miercoles")
    private String horarioMiercoles;
    @Column(name = "horario_jueves")
    private String horarioJueves;
    @Column(name = "horario_viernes")
    private String horarioViernes;
    @Column(name = "horario_sabado")
    private String horarioSabado;
    @Column(name = "horario_domingo")
    private String horarioDomingo;
    @Column(name = "costo")
    private Double costo;
    @OneToMany(fetch = FetchType.EAGER,  cascade = CascadeType.ALL, mappedBy = "tallerModel")
    private Set<AlumnoTallerModel> alumnoTallerModelset = new HashSet<AlumnoTallerModel>();

/*    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "tallerModelSet")
    private Set<AlumnoModel> alumnoModelSet = new HashSet<AlumnoModel>(0);*/


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

    public String getHorarioLunes() {
        return horarioLunes;
    }

    public void setHorarioLunes(String horarioLunes) {
        this.horarioLunes = horarioLunes;
    }

    public String getHorarioMartes() {
        return horarioMartes;
    }

    public void setHorarioMartes(String horarioMartes) {
        this.horarioMartes = horarioMartes;
    }

    public String getHorarioMiercoles() {
        return horarioMiercoles;
    }

    public void setHorarioMiercoles(String horarioMiercoles) {
        this.horarioMiercoles = horarioMiercoles;
    }

    public String getHorarioJueves() {
        return horarioJueves;
    }

    public void setHorarioJueves(String horarioJueves) {
        this.horarioJueves = horarioJueves;
    }

    public String getHorarioViernes() {
        return horarioViernes;
    }

    public void setHorarioViernes(String horarioViernes) {
        this.horarioViernes = horarioViernes;
    }

    public String getHorarioSabado() {
        return horarioSabado;
    }

    public void setHorarioSabado(String horarioSabado) {
        this.horarioSabado = horarioSabado;
    }

    public String getHorarioDomingo() {
        return horarioDomingo;
    }

    public void setHorarioDomingo(String horarioDomingo) {
        this.horarioDomingo = horarioDomingo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Set<AlumnoTallerModel> getAlumnoTallerModelset() {
        return alumnoTallerModelset;
    }

    public void setAlumnoTallerModelset(Set<AlumnoTallerModel> alumnoTallerModelset) {
        this.alumnoTallerModelset = alumnoTallerModelset;
    }


    /*    public Set<AlumnoModel> getAlumnoModelSet() {
        return alumnoModelSet;
    }

    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet) {
        this.alumnoModelSet = alumnoModelSet;
    }*/


}
