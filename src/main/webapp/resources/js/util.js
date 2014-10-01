/**
 * Created by Cesar on 28/09/2014.
 */

/*redirecciona a la cartelera*/
function botonCancelar(){
    if (confirm('¿Está seguro que desea cancelar?'))
        window.location.href = '/todos/cartelera/cargarCartelera.action';
}

function addImage(e) {
    var file = e.target.files[0],
        imageType = /image.*/;

    if (!file.type.match(imageType))
        return;

    var reader = new FileReader();
    reader.onload = fileOnload;
    reader.readAsDataURL(file);
}

function fileOnload(e) {
    var result = e.target.result;
    $('#imgSalida').attr("src", result);
}


