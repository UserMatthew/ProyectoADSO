<%-- 
    Document   : header
    Created on : 27 Feb 2025, 13:25:32
    Author     : NauCreep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="config.Conexion" %>
<%@ page import="models.Usuario" %>
<%@ page session="true" %>
<%@ include file="/view/default/mensaje.jsp" %>


<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect(request.getContextPath() + "/view/login/index.jsp");
        return;
    }
%>


<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sistema de</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/dist/css/adminlte.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
        <!-- Libreria Sweetalert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-warning navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="<%= request.getContextPath() %>" class="nav-link">Inicio</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="#" class="nav-link">Soporte</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Notifications Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-bell"></i>
                            <span class="badge badge-light navbar-badge">15</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <span class="dropdown-header">15 Notifications</span>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fas fa-envelope mr-2"></i> 4 new messages
                                <span class="float-right text-muted text-sm">3 mins</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fas fa-users mr-2"></i> 8 friend requests
                                <span class="float-right text-muted text-sm">12 hours</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fas fa-file mr-2"></i> 3 new reports
                                <span class="float-right text-muted text-sm">2 days</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-warning elevation-4">
                <!-- Brand Logo -->
                <a href="<%= request.getContextPath() %>" class="brand-link">
                    <img src="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/dist/img/logo2.png" alt=" Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">SISTEMA </span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/dist/img/avatar.png" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block"> ${usuarioNombre}</a>
                            <a href="#" class="d-block text-center small"> ${usuarioId}</a>
                        </div>
                    </div>
                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
                            <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-users"></i>
                                    <p>
                                        Usuarios
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/SrvtUsuario?action=mostrar" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de usuarios</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/SrvtUsuario?action=formulario" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de usuarios</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-address-card"></i>
                                    <p>
                                        Roles
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/SrvtRol?action=mostrar" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de roles</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/roles/create.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de rol</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-th-list"></i>
                                    <p>
                                        Categorías
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/SrvtCategoria?action=mostrar" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de categorías</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/categorias/create.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de categorías</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-clipboard-list"></i>
                                    <p> Inventario  <i class="right fas fa-angle-left"></i> </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/SrvtProducto?action=mostrar" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de productos</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/SrvtProducto?action=formulario" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de producto</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-shopping-cart"></i>
                                    <p>  Compras <i class="right fas fa-angle-left"></i> </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/compras/" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de compra</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="prueba?action=salir" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de compra</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            

                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-people-arrows"></i>
                                    <p> Proveedor <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/proveedores/" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de proveedores</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/proveedores/create.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de proveedor</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-cash-register"></i>
                                    <p>
                                        Venta
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/ventas/" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de ventas</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/ventas/create.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de ventas</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="" class="nav-link active">
                                    <i class="nav-icon fas fa-address-book"></i>
                                    <p>
                                        Cliente
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/clientes/" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Listado de clientes</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="<%= request.getContextPath() %>/view/clientes/create.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Creacion de cliente</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>


                            <hr>
                            <li class="nav-item">
                                <a href="<%= request.getContextPath() %>/SrvtUsuario?action=Salir" class="nav-link bg-danger">

                                    <i class="nav-icon fas fa-door-closed"></i>
                                    <p>
                                        Cerrar sesión
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>


