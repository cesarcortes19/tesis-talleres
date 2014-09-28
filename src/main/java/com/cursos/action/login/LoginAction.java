package com.cursos.action.login;

import com.cursos.model.UserModel;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Cesar on 23/09/2014.
 */
public class LoginAction extends ActionSupport {
    UserModel userModel;
    private String error;
    private AuthenticationManager authenticationManager;

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
        } catch (Exception e) {
            if(e instanceof org.springframework.security.core.AuthenticationException){
                /*Este mensaje se envia al otro action*/
                error = "Cédula o contraseña incorrecta";
                return INPUT;
            }
            return ERROR;

        }
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
}
