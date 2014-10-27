package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by Cesar on 14/09/2014.
 */
@Entity
@Table(name = "alumno_taller")
@DynamicUpdate
public class AlumnoTallerModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private int id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_alumno", nullable = false)
    private AlumnoModel alumnoModel;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_taller", nullable = false)
    private TallerModel tallerModel;
    @Column(name = "enero", nullable = true)
    private boolean enero;
    @Column(name = "febrero", nullable = true)
    private boolean febrero;
    @Column(name = "marzo", nullable = true)
    private boolean marzo;
    @Column(name = "abril", nullable = true)
    private boolean abril;
    @Column(name = "mayo", nullable = true)
    private boolean mayo;
    @Column(name = "junio", nullable = true)
    private boolean junio;
    @Column(name = "julio", nullable = true)
    private boolean julio;
    @Column(name = "agosto", nullable = true)
    private boolean agosto;
    @Column(name = "septiembre", nullable = true)
    private boolean septiembre;
    @Column(name = "octubre", nullable = true)
    private boolean octubre;
    @Column(name = "noviembre", nullable = true)
    private boolean noviembre;
    @Column(name = "diciembre", nullable = true)
    private boolean diciembre;
    @Column(name = "inscripcion", nullable = true)
    private boolean inscripcion;
    @Column(name = "fecha_desinscripcion", nullable = true)
    private Date fechaDesinscripcion;
    @Column(name = "fecha_inscripcion", nullable = true)
    private Date fechaInscripcion;

    public AlumnoTallerModel() {
    }

    public AlumnoTallerModel(int id) {
        this.id=id;
    }

    public AlumnoTallerModel(TallerModel tallerModel, AlumnoModel alumnoModel) {
        this.tallerModel = tallerModel;
        this.alumnoModel = alumnoModel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public AlumnoModel getAlumnoModel() {
        return alumnoModel;
    }

    public void setAlumnoModel(AlumnoModel alumnoModel) {
        this.alumnoModel = alumnoModel;
    }

    public TallerModel getTallerModel() {
        return tallerModel;
    }

    public void setTallerModel(TallerModel tallerModel) {
        this.tallerModel = tallerModel;
    }

    public boolean getEnero() {
        return enero;
    }

    public void setEnero(boolean enero) {
        this.enero = enero;
    }

    public boolean getFebrero() {
        return febrero;
    }

    public void setFebrero(boolean febrero) {
        this.febrero = febrero;
    }

    public boolean getMarzo() {
        return marzo;
    }

    public void setMarzo(boolean marzo) {
        this.marzo = marzo;
    }

    public boolean getAbril() {
        return abril;
    }

    public void setAbril(boolean abril) {
        this.abril = abril;
    }

    public boolean getMayo() {
        return mayo;
    }

    public void setMayo(boolean mayo) {
        this.mayo = mayo;
    }

    public boolean getJunio() {
        return junio;
    }

    public void setJunio(boolean junio) {
        this.junio = junio;
    }

    public boolean getJulio() {
        return julio;
    }

    public void setJulio(boolean julio) {
        this.julio = julio;
    }

    public boolean getAgosto() {
        return agosto;
    }

    public void setAgosto(boolean agosto) {
        this.agosto = agosto;
    }

    public boolean getSeptiembre() {
        return septiembre;
    }

    public void setSeptiembre(boolean septiembre) {
        this.septiembre = septiembre;
    }

    public boolean getOctubre() {
        return octubre;
    }

    public void setOctubre(boolean octubre) {
        this.octubre = octubre;
    }

    public boolean getNoviembre() {
        return noviembre;
    }

    public void setNoviembre(boolean noviembre) {
        this.noviembre = noviembre;
    }

    public boolean getDiciembre() {
        return diciembre;
    }

    public void setDiciembre(boolean diciembre) {
        this.diciembre = diciembre;
    }

    public Date getFechaDesinscripcion() {
        return fechaDesinscripcion;
    }

    public void setFechaDesinscripcion(Date fechaDesinscripcion) {
        this.fechaDesinscripcion = fechaDesinscripcion;
    }

    public Date getFechaInscripcion() {
        return fechaInscripcion;
    }

    public void setFechaInscripcion(Date fechaInscripcion) {
        this.fechaInscripcion = fechaInscripcion;
    }


    public boolean getInscripcion() {
        return inscripcion;
    }

    public void setInscripcion(boolean inscripcion) {
        this.inscripcion = inscripcion;
    }
}
