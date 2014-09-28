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
            <%--<li><a href="<s:url action="cargarInscribirTaller" namespace="/administrador/taller"/>"><span>Inscribir en Taller</span></a></li>--%>
            <%--<li><a href="<s:url action="cargarTaller" namespace="/usuario/taller"/>"><span>Ver Talleres</span></a></li>--%>
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
                <a href="<s:url action="cargarAdministrarTaller" namespace="/administrador/taller"/>"><span>Administrar Taller</span></a>
            </li>
            <%--<li><a href="<s:url action="cargarTaller" namespace="/usuario/taller"/>"><span>Ver Talleres</span></a></li>--%>
        </ul>
    </div>
</li>
<%--Solo lo puede ver el administrador--%>
<li><a href="#"><span>Administrar Cartelera</span></a>

    <div>
        <ul>
            <li>
                <a href="#" onclick="submitFormulario('cargarCartelera')"><span>Ver Cartelera</span></a>
            </li>
            <li>
                <a href="#"
                   onclick="submitFormulario('crearCartelera')"><span>Crear Noticia</span></a>
            </li>
            <li>
                <a href="#"
                   onclick="submitFormulario('cargarEliminarCartelera')"><span>Eliminar Noticia</span></a>
            </li>
        </ul>
    </div>
</li>
<%--Solo lo puede ver el administrador--%>
<li><a href="#"><span>Administrar Cuentas</span></a>
    <div>
        <ul>
            <li>
                <a href="#"
                   onclick="submitFormulario('crearUsuario')"><span>Crear Usuario</span></a>
            </li>
            <li>
                <a href="#"
                   onclick="submitFormulario('editarEliminarUsuario')"><span>Administrar Usuarios</span></a>
            </li>
            <%--                    <li>
                                    <a href="#" onclick="submitFormulario('consultarUsuario')"><span>Consultar Usuarios</span></a>
                                </li>--%>
        </ul>
    </div>
</li>

<%--Solo lo deben ver los represententaste y usuarios invitados--%>
<%--<li><a href="#"><span>Taller</span></a>

    <div>
        <ul>
            <li>
                <a href="#" onclick="submitFormulario('cargarTaller')"><span>Ver Taller</span></a>
            </li>
            <li>
                <a href="#" ><span>Inscripci&oacute;n</span></a>
            </li>
        </ul>
    </div>
</li>

&lt;%&ndash;Solo lo deben ver los represententaste y usuarios invitados&ndash;%&gt;
<li><a href="#"><span>Cartelera</span></a></li>--%>

<%--Solo lo deben ver los represententaste--%>
<li><a href="#" class="parent"><span>Configuraci&oacute;n</span></a>

    <div>
        <ul>
            <li><a href="#" class="parent"><span>Cambiar Contrasena</span></a></li>
            <li><a href="#" class="parent"><span>Editar Cuenta</span></a></li>
            <li><a href="#" class="parent"><span>Registrar Alumno</span></a></li>
        </ul>
    </div>
</li>
<li><a href="<s:url value="/logout"/>" class="parent"><span>Logout</span></a>
</li>