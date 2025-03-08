<%-- 
    Document   : cuerpo
    Created on : 27 Feb 2025, 18:52:04
    Author     : NauCreep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/view/default/header.jsp" %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1 class="m-0">Modulo Clientes</h1>
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
                            <h3 class="card-title">Formulario de registro de cliente</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="../app/controllers/usuarios/create.php" method="post">
                                        <div class="form-group">
                                                <label for="name">Nombre completo del cliente</label>
                                            <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese el nombre completo del cliente" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Razón social</label>
                                            <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese la razón social" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Correo Electronico </label>
                                            <input type="email" name="email_user" class="form-control" id="name" placeholder="Ingrese el correo Electronico" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Cedula</label>
                                            <input type="number" name="cedula_usuario" class="form-control" id="name" placeholder="Ingrese la cedula" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Telefono</label>
                                            <input type="number" name="cedula_usuario" class="form-control" id="name" placeholder="Ingrese el telefono" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Municipio</label>
                                            <input type="text" name="password_user" class="form-control" id="name" placeholder="Ingrese el municipio" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Dirección</label>
                                            <input type="text" name="password_repeat" class="form-control" id="name" placeholder="Ingrese la dirección" required>
                                        </div>
                                        <div class="form-group">
                                            <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
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
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@ include file="/view/default/footer.jsp" %>