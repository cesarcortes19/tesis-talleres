package com.cursos.model;

import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Cesar on 15/06/14.
 */
@Entity
@Table(name = "roles")
@DynamicUpdate
public class RoleModel {

    private int id;
    private String name;
    private Set<UserModel> userModelList = new HashSet<UserModel>(0);

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "name", unique = false, nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "roleModel")
    public Set<UserModel> getUserModelList() {
        return userModelList;
    }

    public void setUserModelList(Set<UserModel> userModelList) {
        this.userModelList = userModelList;
    }
}
