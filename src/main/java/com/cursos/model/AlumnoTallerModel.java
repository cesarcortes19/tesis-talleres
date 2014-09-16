package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

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
    private Boolean enero;
    @Column(name = "febrero", nullable = true)
    private Boolean febrero;
    @Column(name = "marzo", nullable = true)
    private Boolean marzo;
    @Column(name = "abril", nullable = true)
    private Boolean abril;
    @Column(name = "mayo", nullable = true)
    private Boolean mayo;
    @Column(name = "junio", nullable = true)
    private Boolean junio;
    @Column(name = "julio", nullable = true)
    private Boolean julio;
    @Column(name = "agosto", nullable = true)
    private Boolean agosto;
    @Column(name = "septiembre", nullable = true)
    private Boolean septiembre;
    @Column(name = "octubre", nullable = true)
    private Boolean octubre;
    @Column(name = "noviembre", nullable = true)
    private Boolean noviembre;
    @Column(name = "diciembre", nullable = true)
    private Boolean diciembre;

    public AlumnoTallerModel() {
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

    public Boolean getEnero() {
        return enero;
    }

    public void setEnero(Boolean enero) {
        this.enero = enero;
    }

    public Boolean getFebrero() {
        return febrero;
    }

    public void setFebrero(Boolean febrero) {
        this.febrero = febrero;
    }

    public Boolean getMarzo() {
        return marzo;
    }

    public void setMarzo(Boolean marzo) {
        this.marzo = marzo;
    }

    public Boolean getAbril() {
        return abril;
    }

    public void setAbril(Boolean abril) {
        this.abril = abril;
    }

    public Boolean getMayo() {
        return mayo;
    }

    public void setMayo(Boolean mayo) {
        this.mayo = mayo;
    }

    public Boolean getJunio() {
        return junio;
    }

    public void setJunio(Boolean junio) {
        this.junio = junio;
    }

    public Boolean getJulio() {
        return julio;
    }

    public void setJulio(Boolean julio) {
        this.julio = julio;
    }

    public Boolean getAgosto() {
        return agosto;
    }

    public void setAgosto(Boolean agosto) {
        this.agosto = agosto;
    }

    public Boolean getSeptiembre() {
        return septiembre;
    }

    public void setSeptiembre(Boolean septiembre) {
        this.septiembre = septiembre;
    }

    public Boolean getOctubre() {
        return octubre;
    }

    public void setOctubre(Boolean octubre) {
        this.octubre = octubre;
    }

    public Boolean getNoviembre() {
        return noviembre;
    }

    public void setNoviembre(Boolean noviembre) {
        this.noviembre = noviembre;
    }

    public Boolean getDiciembre() {
        return diciembre;
    }

    public void setDiciembre(Boolean diciembre) {
        this.diciembre = diciembre;
    }
}
