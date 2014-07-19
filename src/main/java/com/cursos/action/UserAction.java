package com.cursos.action;

import com.cursos.model.UserModel;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Cesar on 08/06/14.
 */
public class UserAction extends ActionSupport implements ModelDriven<UserBean> {

    private static final long serialVersionUID = 1L;

    @Autowired
    private UserBean userBean;

    public String execute()
    {

        return "user";
    }

    public String addUser()
    {
        return "addUser";
    }

    @Override
    public UserBean getModel() {
        return userBean;
    }
    public String alia() {
        return "alia";
    }
    public String madhuri() {
        return "madhuri";
    }
    public String user() {
        return "user";
    }
}
