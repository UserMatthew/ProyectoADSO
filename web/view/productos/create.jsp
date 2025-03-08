<%-- 
    Document   : create
    Created on : 27 Feb 2025, 20:18:43
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
                    <h1 class="m-0">Modulo Productos</h1>
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
                            <h3 class="card-title">Formulario de registro de productos</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="<%= request.getContextPath() %>/SrvtProducto" method="post">
                                        <input type="hidden" name="action" value="registrar">
                                        <div class="row ">
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label for="name">Código del producto</label>
                                                    <input type="number" name="id_producto" class="form-control" id="name" placeholder="Ingrese el código del producto" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Nombre del producto</label>
                                                    <input type="text" name="nombre_producto" class="form-control" id="name" placeholder="Ingrese el nombre del producto " required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Descripción del producto</label>
                                                    <input type="text" name="descripcion_producto" class="form-control" id="name" placeholder="Ingrese una descripción producto" required>
                                                </div>
                                            </div>

                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label for="name">Categoría del producto</label>
                                                    <select name="categoria" id="categoria" class="form-control">
                                                        <option value="">Seleccione una categoría</option>
                                                        <c:forEach var="item" items="${categoria}">
                                                            <option value="${item.id}">${item.nombre}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Inventario del producto</label>
                                                    <input type="number" name="inventario" class="form-control" id="name" placeholder="Ingrese la cantidad en existencia del producto" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name">Precio de venta del producto </label>
                                                    <input type="number" name="pventa" class="form-control" id="name" placeholder="Ingrese el precio de venta del producto" required>
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