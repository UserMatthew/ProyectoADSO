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
                    <h1 class="m-0">Modulo Categorías</h1>
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
                            <h3 class="card-title">Formulario de registro de categorías</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="<%= request.getContextPath() %>/SrvtCategoria" method="post">
                                        <input type="hidden" name="action" value="registrar">
                                        <div class="form-group">
                                            <label for="name">Codigo/Id de la categproa</label>
                                            <input type="number" name="id_categoria" class="form-control"  id="name" placeholder="Ingrese el código de la categoría" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Nombre de la categoría</label>
                                            <input type="text" name="categoria" class="form-control"  id="name" placeholder="Ingrese el nombre de la categoría" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Descripción</label>
                                            <input type="text" name="descripcion" class="form-control"  id="name" placeholder="Ingrese una descripción" required>
                                        </div>
                                        <div class="form-group">
                                            <a href="<%= request.getContextPath() %>/SrvtCategoria?action=mostrar" class="btn btn-secondary">Cancelar</a>
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