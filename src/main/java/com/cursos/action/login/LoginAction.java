package com.cursos.action.login;

import com.cursos.ViewNames;
import com.cursos.model.UserModel;
import com.cursos.service.usuario.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Cesar on 23/09/2014.
 */
public class LoginAction extends ActionSupport {
    UserModel userModel;
    private String error;
    private AuthenticationManager authenticationManager;
    private UsuarioService userService;
    private Map <String, Object> model = new HashMap<String, Object>();

    public String execute(){
        return SUCCESS;
    }

    public String cargar(){
        return "cargar";
    }

    public String autenticar(){

        try {
            Authentication req = new UsernamePasswordAuthenticationToken(userModel.getCedula(),userModel.getPassword());
            Authentication result = authenticationManager.authenticate(req);
            SecurityContextHolder.getContext().setAuthentication(result);
            userModel = userService.getUsuarioByCi(userModel);
        } catch (Exception e) {
            if(e instanceof org.springframework.security.core.AuthenticationException){
                /*Este mensaje se envia al otro action*/
                //error = "Cédula o contraseña incorrecta";
                model.put(ViewNames.MENSAJE,"Cédula o contraseña incorrecta");
                return INPUT;
            }
            return ERROR;

        }
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        session.setAttribute("currentUser", userModel.getFullName());
        addActionMessage("Bienvenido " + userModel.getFullName());
        model.put(ViewNames.MENSAJE,"Bienvenido " + userModel.getFullName());
        return SUCCESS;
    }

    public String logout(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        auth.setAuthenticated(false);
        User userAuth = (User)auth.getPrincipal();
        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        return SUCCESS;
    }

    public void setAuthenticationManager(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    public AuthenticationManager getAuthenticationManager() {
        return authenticationManager;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setUserService(UsuarioService userService) {
        this.userService = userService;
    }

    public UsuarioService getUserService() {
        return userService;
    }

    public Map<String, Object> getModel() {
        return model;
    }

    public void setModel(Map<String, Object> model) {
        this.model = model;
    }
}
