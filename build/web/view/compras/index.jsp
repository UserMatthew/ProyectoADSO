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
                <div class="col-md-10" >
                    <div class="card card-outline card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Lista de compra</h3>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body" style="display: block;">
                            <div class="card-body">
                                <table id="tabla_compras" class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Producto</th>
                                            <th>Proveedor</th>
                                            <th>Cantidad</th>
                                            <th>Precio unitario</th>
                                            <th>Precio total</th>
                                            <th>Fecha</th>
                                            <th>Nota</th>                                            
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>11555</td>
                                            <td> Matthew </td>
                                            <td>Matthew@hotmail.es</td>
                                            <td> 5555555554</td>
                                            <td> Admi</td>
                                            <td> Admi</td>
                                            <td> Admi</td>
                                            <td> Admi</td>
                                            <td>
                                    <center>
                                        <div class="btn-group">
                                            <a href="update.jsp" type="button" class="btn btn-success"><i class="fa fa-pencil-alt"></i></a>
                                        </div>
                                    </center>
                                    <tr>
                                            <td>11555</td>
                                            <td> hfdhgdhf </td>
                                            <td>hfdgh@hotmail.es</td>
                                            <td> 5555555554</td>
                                            <td> Admi</td>
                                            <td> Admi</td>
                                            <td> Admi</td>
                                            <td> Admi</td>
                                            <td>
                                    <center>
                                        <div class="btn-group">
                                            <a href="update.jsp" type="button" class="btn btn-success"><i class="fa fa-pencil-alt"></i></a>
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





<%@ include file="/view/default/footer.jsp" %>

<script>
    $(function () {
        $("#tabla_compras").DataTable({
            /* cambio de idiomas de datatable */
            "pageLength": 10,
            language: {
                "emptyTable": "No hay información",
                "decimal": "",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Compras",
                "infoEmpty": "Mostrando 0 - 0 de 0 Usuarios",
                "infoFiltered": "(Filtrado de _MAX_ _total_ Compras)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Compras",
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
        }).buttons().container().appendTo('#tabla_compras_wrapper .col-md-6:eq(0)');
    });
</script>