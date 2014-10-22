<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<li><a href="#"><span>Cartelera</span></a>
    <div>
        <ul>
            <li><a href="<s:url action="cargarCartelera" namespace="/todos/cartelera"/>"><span>Ver Cartelera</span></a></li>
        </ul>
    </div>
</li>

<li><a href="#"><span>Talleres</span></a>

    <div>
        <ul>
            <li><a href="<s:url action="cargarVerTaller" namespace="/todos/taller"/>"><span>Ver Talleres</span></a></li>
        </ul>
    </div>
</li>

<li><a href="<s:url action="cargarVerContacto" namespace="/todos/contacto"/>"><span>Contactanos</span></a></li>



