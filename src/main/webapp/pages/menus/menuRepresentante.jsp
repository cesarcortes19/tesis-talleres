<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<li><a href="#"><span>Gestionar Pagos</span></a>

    <div>
        <ul>
            <li>
                <a href="<s:url action="buscarUsuarioGestionarPagosRepresentante" namespace="/usuario/pagos"/>"><span>Gestionar pago usuario </span></a>
            </li>
            <li>
                <a href="<s:url action="buscarUsuarioHistorialPagos" namespace="/usuario/pagos"/>"><span>Historial de pagos</span></a>
            </li>
        </ul>
    </div>
</li>
<li><a href="#"><span>Talleres</span></a>

    <div>
        <ul>
            <li>
                <a href="<s:url action="cargarVerTaller" namespace="/todos/taller"/>"><span>Ver Talleres</span></a>
            </li>
            <li>
                <a href="<s:url action="cargarRepresentadosInscribirTaller" namespace="/usuario/taller"/>"><span>Inscribir/Desinscribir</span></a>
            </li>
        </ul>
    </div>
</li>
<%--Solo lo puede ver el administrador--%>
<li><a href="#"><span>Cartelera</span></a>

    <div>
        <ul>
            <li><a href="<s:url action="cargarCartelera" namespace="/todos/cartelera"/>"><span>Ver Cartelera</span></a>
            </li>
        </ul>
    </div>
</li>

<%--Solo lo deben ver los represententaste--%>
<li><a href="#" class="parent"><span>Usuario: <s:property value="#session.currentUser"/></span></a>

    <div>
        <ul>
            <li><a href="<s:url action="cargarEditarUsuario" namespace="/usuario"/>"><span>Editar Cuenta</span></a></li>
            <li><a href="<s:url value="/logout"/>"><span>Cerrar Sesi&oacute;n</span></a></li>
        </ul>
    </div>
</li>
<li><a href="<s:url action="cargarVerContacto" namespace="/todos/contacto"/>"><span>Contactanos</span></a></li>
