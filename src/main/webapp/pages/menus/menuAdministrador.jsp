<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<li><a href="#"><span>Gestionar Pagos</span></a>

    <div>
        <ul>
            <li>
                <a href="<s:url action="cargarTodosUsuariosGestionarPagos" namespace="/administrador/pagos"/>"><span>Control de pagos</span></a>
            </li>
            <li>
                <a href="<s:url action="cargarGestionarPagos" namespace="/administrador/pagos"/>"><span>Gestionar pago usuario </span></a>
            </li>
            <li>
                <a href="<s:url action="cargarTodosHistorialPagos" namespace="/administrador/pagos"/>"><span>Historial de pagos(todos) </span></a>
            </li>
            <li>
                <a href="<s:url action="cargarCedulaHistorialPagos" namespace="/administrador/pagos"/>"><span>Historial de pagos(usuario) </span></a>
            </li>
        </ul>
    </div>
</li>
<li><a href="#"><span>Gestionar Inscripcion</span></a>

    <div>
        <ul>
            <li>
                <a href="<s:url action="cargarInscribirTaller" namespace="/administrador/taller"/>"><span>Inscribir/Desinscribir</span></a>
            </li>
        </ul>
    </div>
</li>

<li><a href="#"><span>Administrar Taller</span></a>

    <div>
        <ul>
            <li>
                <a href="<s:url action="cargarCrearTaller" namespace="/administrador/taller"/>"><span>Crear Taller</span></a>
            </li>
            <li>
                <a href="<s:url action="cargarAdministrarTaller" namespace="/administrador/taller"/>"><span>Administrar Talleres</span></a>
            </li>
        </ul>
    </div>
</li>
<%--Solo lo puede ver el administrador--%>
<li><a href="#"><span>Administrar Cartelera</span></a>

    <div>
        <ul>
<%--            <li>
                <a href="<s:url action="cargarCartelera" namespace="/todos/cartelera"/>"><span>Ver Cartelera</span></a>
            </li>--%>

            <li>
                <a href="<s:url action="crearCartelera" namespace="/administrador/cartelera"/>"><span>Crear Noticia</span></a>
            </li>
            <li><a href="<s:url action="cargarEliminarCartelera" namespace="/administrador/cartelera"/>"><span>Administrar Noticias</span></a>
            </li>
        </ul>
    </div>
</li>
<%--Solo lo puede ver el administrador--%>
<li><a href="#"><span>Administrar Cuentas</span></a>

    <div>
        <ul>
            <li>
                <a href="<s:url action="cargarCrearUsuario" namespace="/administrador/usuario"/>"><span>Crear Usuario</span></a>
            </li>
            <li><a href="<s:url action="cargarAdministrarUsuario" namespace="/administrador/usuario"/>"><span>Administrar Usuarios</span></a>
            </li>
        </ul>
    </div>
</li>

<li><a href="#" class="parent"><span>Cuenta: Administrador</span></a>

    <div>
        <ul>

            <li>
                <a href="<s:url action="cargarEditarAdministrador" namespace="/administrador/usuario"/>"><span>Editar Cuenta</span></a>
            </li>
            <li><a href="<s:url value="/logout"/>"><span>Cerrar Sesi&oacute;n</span></a></li>
            <li>
                <a href="<s:url action="cargarVerContacto" namespace="/administrador/contacto"/>"><span>Ver Contactanos</span></a>
            </li>
            <li>
                <a href="<s:url action="cargarEditarContacto" namespace="/administrador/contacto"/>"><span>Editar Contactanos</span></a>
            </li>
        </ul>
    </div>
</li>
