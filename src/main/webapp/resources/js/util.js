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

function marcarInscripcionDeisncripcion(){
    gridPagos = $("#pagosGrid").jqGrid('getRowData');

    for(i=0; i< gridPagos.length ; i++){
        monthInscripcion = gridPagos[i]["fechaInscripcion"].split("/")[1];
        monthDesiscripcion = gridPagos[i]["fechaDesinscripcion"].split("/")[1];

        if(monthInscripcion == "01")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"enero","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "01")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"enero","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});
        if(monthInscripcion == "02")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"febrero","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "02")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"febrero","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "03")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"marzo","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "03")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"marzo","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "04")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"abril","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "04")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"abril","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "05")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"mayo","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "05")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"mayo","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "06")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"junio","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "06")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"junio","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "07")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"julio","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "07")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"julio","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "08")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"agosto","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "08")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"agosto","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "09")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"septiembre","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "09")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"septiembre","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "10")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"octubre","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "10")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"octubre","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "11")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"noviembre","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "11")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"noviembre","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});

        if(monthInscripcion == "12")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"diciembre","",{ 'border-style': 'solid','border-color':'green', 'border-width':'1px'});
        if(monthDesiscripcion == "12")
            $("#pagosGrid").jqGrid('setCell',gridPagos[i]["id"],"diciembre","",{ 'border-style': 'solid','border-color':'red', 'border-width':'1px'});
    }
}
