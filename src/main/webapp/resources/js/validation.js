function onlyNumber(e) {
    var key;
    var keychar;

    if (window.event) {
        key = e.keyCode;
    }
    else if (e.which) {
        key = e.which;
    } else {
        return true;
    }


    if ((key == 9) || // Tabulador
        (key == 8) ||
        (key >= 48 && key <= 57)) {  //BACKSPACE,  || (key == 32)Espacio

        return true;
    }
    return false;

}

function onlyNumberColonAndDot(e) {
    var key;
    var keychar;

    if (window.event) {
        key = e.keyCode;
    }
    else if (e.which) {
        key = e.which;
    } else {
        return true;
    }


    if ((key == 9) || // Tabulador
        (key == 8) ||
        (key == 44) ||
        (key == 46) ||
        (key >= 48 && key <= 57)) {  //BACKSPACE,  || (key == 32)Espacio

        return true;
    }
    return false;

}

function onlyLetters(e) {

    var key;
    var keychar;

    if (window.event) {
        key = e.keyCode;
    }
    else if (e.which) {
        key = e.which;
    } else {
        return true;
    }


    if ((key >= 65 && key <= 90) || //LETRAS MAYUSCULAS
        (key >= 97 && key <= 122) || //LETRAS MINUSCULAS
        (key == 241) || (key == 209) || //� �
        (key == 225) || (key == 193) || //&aacute; �
        (key == 233) || (key == 201) || //&eacute; �
        (key == 237) || (key == 205) || //&iacute; �
        (key == 243) || (key == 211) || //&oacute; �
        (key == 250) || (key == 218) || //� �
        (key == 9) || // Tabulador
        (key == 8) || (key == 32)) {  //BACKSPACE,  || (key == 32)Espacio


        return true;
    }
    return false;


}


function validarText(){
    bandera=true;
    $('.requerido').each(function(){
        if($(this).val()==""){
            alert("Debe llenar todos los campos marcados como requeridos (*)")
            bandera = false;
            return false
        }
    });
    return bandera;
}