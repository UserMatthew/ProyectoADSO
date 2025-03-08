<%-- 
    Document   : update
    Created on : 27 Feb 2025, 21:25:55
    Author     : NauCreep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/view/default/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1 class="m-0">Modulo Usuarios</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Formulario de actualización de usuario</h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                </button>
                            </div>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        
                        <div class="card-body" style="display: block;">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="<%= request.getContextPath() %>/SrvtUsuario" method="post">
                                        <input type="hidden" name="action" value="editar">
                                        <input type="hidden" name="cedula_usuario" value="${usuario.id}">
                                        <div class="form-group">
                                            <label for="name">Nombre completo</label>
                                            <input type="text" name="nombre_user" class="form-control" id="name" value="${usuario.nombre}" placeholder="Ingrese su nombre completo" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Correo Electronico</label>
                                            <input type="email" name="email_user" class="form-control" id="name" value="${usuario.email}" placeholder="Ingrese su correo Electronico" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Cedula</label>
                                            <input type="number" name="cedula_usuario" class="form-control" id="name" value="${usuario.id}" placeholder="Ingrese su cedula" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Rol del usuario</label>
                                            <select name="rol" id="rol" class="form-control">
                                                <option value="">Seleccione un rol</option>
                                                <c:forEach var="item" items="${rol}">
                                                    <option value="${item.id}" 
                                                            ${item.id == usuario.idRol ? 'selected' : ''}>
                                                        ${item.nombre}
                                                    </option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <label for="name">Telefono</label>
                                            <input type="number" name="telefono_usuario" class="form-control" id="name" value="${usuario.telefono}" placeholder="Ingrese su telefono" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Contraseña</label>
                                            <input type="password" name="password_user" class="form-control" id="name" placeholder="Ingrese su contraseña" required>
                                        </div>
     <!--                                <div class="form-group">
                                            <label for="name">Confirmar contraseña</label>
                                            <input type="password" name="password_repeat" class="form-control" id="name" placeholder="Confirme la contraseña" required>
                                        </div> -->
                                        <div class="form-group">
                                            <a href="<%= request.getContextPath() %>/SrvtUsuario?action=mostrar" class="btn btn-secondary">Cancelar</a>
                                            <button type="submit" class="btn btn-primary">Actualizar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
            </div>

            <!-- /.row -->
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/view/default/footer.jsp" %>