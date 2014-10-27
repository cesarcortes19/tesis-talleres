/**
 * Created by equipo12 on 13/03/14.
 */

function addInformativeMessage(idElement, message) {

    $("#" + idElement).append("<div class='ui-widget actionMessage'><div class='ui-state-highlight ui-corner-all' style='margin-top: 20px; padding: 0 .7em;'>" +
        "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>" +
        "<strong>" + message + "</strong></p></div></div>");

}


function addErrorMessage(idElement, message) {

    $("#" + idElement).append("<p><span class='errorMessage' style='float: left; margin-right: .3em;'></span>" +
        "<strong>" + message + "</strong></p>");


}

function showMsgError(idElement, message) {

    $(".error").remove();
    if
        (message!=null) $("#"+idElement).focus().after("<span class='error' style='color: #CD0A0A'>&nbsp;&nbsp;"+ message +"</span>");
    else
        $("#"+idElement).focus().after("<span class='error' style='color: #CD0A0A'>&nbsp;&nbsp;Error</span>");

}




