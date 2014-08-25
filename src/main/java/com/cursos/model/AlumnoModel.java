package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * Created by Cesar on 06/08/2014.
 */
@Entity
@Table(name = "alumno")
@DynamicUpdate
public class AlumnoModel {

    private int id;
    private String nombre;
    private String apellido;
    private int edad;
    private String grado;
    private String seccion;
    private UserModel userModel;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "nombre", nullable = false)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Column(name = "apellido", nullable = false)
    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user", nullable = false, updatable = true)
    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    @Column(name = "edad", nullable = false)
    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Column(name = "grado", nullable = false)
    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    @Column(name = "seccion", nullable = false)
    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    /*    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "stock_category", catalog = "mkyongdb", joinColumns = {
            @JoinColumn(name = "STOCK_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "CATEGORY_ID",
                    nullable = false, updatable = false) })
    public Set<Category> getCategories() {
        return this.categories;
    }*/
}
