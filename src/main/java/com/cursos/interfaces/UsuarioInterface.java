package com.cursos.interfaces;

import com.cursos.model.AlumnoModel;
import com.cursos.model.RoleModel;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Cesar on 31/08/2014.
 */
public interface UsuarioInterface {

    public int getId();

    public void setId(int id);


    public String getNombre();

    public void setNombre(String nombre);


    public String getApellido();

    public void setApellido(String apellido);

    public String getCedula();

    public void setCedula(String cedula);

    public String getEmail2();

    public void setEmail2(String email2);


    public String getEmail();

    public void setEmail(String email);

    public RoleModel getRoleModel();

    public void setRoleModel(RoleModel roleModel);

    public String getPassword();

    public void setPassword(String password);

    public Set<AlumnoModel> getAlumnoModelSet();

    public void setAlumnoModelSet(Set<AlumnoModel> alumnoModelSet);

    public String getDireccion();

    public void setDireccion(String direccion);

    public String getTelefono1();

    public void setTelefono1(String telefono1);

    public String getTelefono2();

    public void setTelefono2(String telefono2);


    public String getObservaciones();


    public void setObservaciones(String observaciones);
}
