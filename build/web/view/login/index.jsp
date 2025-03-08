<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="config.Conexion" %>
<%@ page session="true" %>
<%@ include file="/view/default/mensaje.jsp" %>





<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Iniciar sesión</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/plugins/fontawesome-free/css/all.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/dist/css/adminlte.min.css">
        <link rel="stylesheet" href="../../public/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>

    <body class="hold-transition login-page">



        <div class="container w-75 d-flex justify-content-center align-items-center vh-100">
            <div class="bg-cont row border rounded-5 p-3 shadow bg-white" style="width: 60%; max-width: 1200px;">
                <div class="col-lg-6 d-flex justify-content-center align-items-center left-box bg rounded-start-5 d-none d-lg-block col-md-5 col-lg-5 col-xl-6 ">
                </div>
                <div class="col-lg-6 bg-cont d-flex flex-column justify-content-center align-items-center p-1 rounded-end-5 ">
                    <h2 class="fw-bold text-center pt-1 mb-1">Bienvenido</h2>
                    <div class="text-end pt-3 pb-3">
                        <img src="<%= request.getContextPath() %>/public/templates/AdminLTE-3.2.0/dist/img/inventario.png" alt="Logo" class="img-fluid" style="width: 75px; hight: 75px;">
                    </div>

                     <div class="card-body">
                    <p class="login-box-msg">Iniciar sesión para continuar</p>

                    <!-- Formulario corregido -->
                    <form action="<%= request.getContextPath() %>/SrvtUsuario" method="post">
                        <div class="input-group mb-3">
                            <input type="email" name="email" class="form-control" placeholder="Ingrese su Email" required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="password" class="form-control" placeholder="Ingrese su contraseña" required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-6 d-flex justify-content-center">
                                <button type="submit" name="action" value="Ingresar" class="btn btn-primary btn-block">Ingresar</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>


                    <!-- Mostrar mensajes de error -->
                    <%
                        String message = request.getParameter("message");
                        if (message != null) {
                    %>
                    <p class="text-danger text-center mt-3"><%= message %></p>
                    <%
                        }
                    %>
          

        <!-- jQuery -->
        <script src="<%= Conexion.BASE_URL %>public/templates/AdminLTE-3.2.0/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="<%= Conexion.BASE_URL %>public/templates/AdminLTE-3.2.0/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="<%= Conexion.BASE_URL %>public/templates/AdminLTE-3.2.0/dist/js/adminlte.min.js"></script>
    </body>
</html>
