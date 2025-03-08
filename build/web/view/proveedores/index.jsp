<%-- 
    Document   : index
    Created on : 27 Feb 2025, 18:48:45
    Author     : NauCreep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/view/default/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1 class="m-0">Modulo Proveedores</h1>
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
                            <h3 class="card-title">Lista de proveedores</h3>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="card-body">
                                <table id="tabla_proveedores" class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Razon social</th>
                                            <th>Email</th>
                                            <th>Telefono</th>                                          
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>11555</td>
                                            <td> Matthew </td>
                                            <td>Matthew@hotmail.es</td>
                                            <td> 5555555554</td>
                                            <td> 5555555554</td>
                                            <td>
                                    <center>
                                        <div class="btn-group">
                                            <a href="update.jsp" type="button" class="btn btn-success"><i class="fa fa-pencil-alt"></i></a>
                                            <a href="#" class="btn btn-danger btn-delete-client" data-id="123" data-toggle="modal" data-target="#confirmDeleteProveedorModal">
                                                <i class="fa fa-trash"></i>
                                            </a>


                                        </div>
                                    </center>
                                    </td>
                                    </tr>
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

<!-- Modal de Confirmación -->
<div class="modal fade" id="confirmDeleteProveedorModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Card de AdminLTE -->
            <div class="card card-danger">
                <div class="card-header">
                    <h3 class="card-title">Confirmar Eliminación</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="card-body">
                    <p>¿Estás seguro de que deseas eliminar este proveedor?</p>
                </div>
                <div class="card-footer d-flex justify-content-between">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <a href="#" id="deleteClientBtn" class="btn btn-danger">Eliminar</a>
                </div>
            </div>
        </div>
    </div>
</div>







<%@ include file="/view/default/footer.jsp" %>

<script>
    $(function () {
        $("#tabla_proveedores").DataTable({
            /* cambio de idiomas de datatable */
            "pageLength": 10,
            language: {
                "emptyTable": "No hay información",
                "decimal": "",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Proveedores",
                "infoEmpty": "Mostrando 0 - 0 de 0 Usuarios",
                "infoFiltered": "(Filtrado de _MAX_ _total_ Proveedores)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Proveedores",
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
        }).buttons().container().appendTo('#tabla_proveedores_wrapper .col-md-6:eq(0)');
    });
</script>