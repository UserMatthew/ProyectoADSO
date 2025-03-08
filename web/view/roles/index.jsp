<%-- 
    Document   : index
    Created on : 27 Feb 2025, 18:48:45
    Author     : NauCreep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/view/default/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1 class="m-0">Modulo Roles
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row"> 
                <div class="col-md-10" >
                    <div class="card card-outline card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Lista de roles</h3>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="card-body">
                                <table id="tabla_roles" class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre del rol</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${rol}" var="item">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.nombre} </td>
                                                <td>
                                        <center>
                                            <div class="btn-group">
                                                <a href="<%= request.getContextPath() %>/SrvtRol?action=update&id=${item.id}" type="button" class="btn btn-success"><i class="fa fa-pencil-alt"></i></a>
                                                <a href="<%= request.getContextPath() %>/SrvtRol?action=eliminar&id=${item.id}" class="btn btn-danger btn-delete-user">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </div>
                                        </center>
                                        </td>
                                        </tr>
                                    </c:forEach>                                                                   
                                    </tbody>
                                </table>
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

<script>
    $(function () {
        $("#tabla_roles").DataTable({
            /* cambio de idiomas de datatable */
            "pageLength": 10,
            language: {
                "emptyTable": "No hay información",
                "decimal": "",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Roles",
                "infoEmpty": "Mostrando 0 - 0 de 0 Usuarios",
                "infoFiltered": "(Filtrado de _MAX_ _total_ Roles)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Roles",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscador:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },
            /* fin de idiomas */
            "responsive": true,
            "lengthChange": true,
            "autoWidth": false,
            buttons: [{
                    extend: 'collection',
                    text: 'Reportes',
                    orientation: 'landscape',
                    buttons: [{
                            text: 'Copiar',
                            extend: 'copy'
                        }, {
                            extend: 'pdf',
                        }, {
                            extend: 'csv',
                        }, {
                            extend: 'excel',
                        }, {
                            text: 'Imprimir',
                            extend: 'print'
                        }]
                },
                {
                    extend: 'colvis',
                    text: 'Visol de columnas'
                }
            ],
        }).buttons().container().appendTo('#tabla_roles_wrapper .col-md-6:eq(0)');
    });
</script>