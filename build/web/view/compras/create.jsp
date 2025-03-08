<%-- 
    Document   : create
    Created on : 27 Feb 2025, 20:18:43
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
                    <h1 class="m-0">Modulo Compras</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Formulario de registro de compras</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="../app/controllers/usuarios/create.php" method="post">

                                        <div class="row ">
                                            <div class="col-md-4"> 
                                                <div class="form-group">
                                                    <label for="name">Código de la compra</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese de la compra" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Descripción del producto</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese una descripción producto" required>
                                                </div>
                                                 <div class="form-group">
                                                    <label for="name">Fecha de compra</label>
                                                    <input type="date" name="nombre_user" class="form-control" id="name" placeholder="Ingrese el nombre del proveedor" required>
                                                </div>
                                            </div>
                                            <div class="col-md-4"> 
                                                <div class="form-group">
                                                    <label for="name">Nombre del producto</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese el nombre del producto " required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Nombre del proveedor</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese el nombre del proveedor " required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Nota de compra</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese una nota de... ">
                                                </div>
                                            </div>
                                            <div class="col-md-4"> 
                                                <div class="form-group">
                                                    <label for="name">Categoría del producto</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese la categoría del producto" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Cantidad del producto</label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese la cantidad de compra del producto" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Precio de compra del producto </label>
                                                    <input type="text" name="nombre_user" class="form-control" id="name" placeholder="Ingrese el precio de compra del producto" required>
                                                </div>
                                            </div>                                        
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