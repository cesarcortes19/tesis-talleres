/**
 * Created by Cesar on 30/08/2014.
 */

function validarText(){
    $('[name="requerido"]').each(function(){
        if(this.val()==""){
            $(".error").remove();
            this.focus().after("<span class='error' style='color: #CD0A0A'>&nbsp;&nbsp;Campo Requerido</span>");
            return false
        }
    });
    return true;
}
