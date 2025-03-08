package controllers;

import config.Conexion;
import dao.RolDAO;
import dao.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import models.Rol;
import models.Usuario;

public class SrvtUsuario extends HttpServlet {

    private UsuarioDAO udao = new UsuarioDAO();
    Usuario us = new Usuario();
    private RolDAO rdao = new RolDAO();
    Rol rol = new Rol();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        switch (action.toLowerCase()) {
            case "salir" -> cerrarSesion(request, response);
            case "mostrar" -> mostrar(request, response);
            case "formulario" -> formulario(request, response);
            case "update" -> formulario(request, response);
            case "eliminar" -> eliminarUsuario(request, response);
            default -> response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
// Metodo de cerrar sesion 

    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

// Metodo mostrar lista de usuarios
    protected void mostrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("usuarios", udao.MostrarUsuarios());
        request.getRequestDispatcher("/view/usuarios/index.jsp").forward(request, response);
    }

// Metodo registrar lista de usuarios  roles
    private void formulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("formulario".equalsIgnoreCase(action)) {
            request.setAttribute("rol", rdao.MostrarRol());
            request.getRequestDispatcher("/view/usuarios/create.jsp").forward(request, response);
        } else if ("update".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            us = udao.buscarPorID(id);
            if (us != null) {
                request.setAttribute("usuario", us);
                request.setAttribute("rol", rdao.MostrarRol());
                request.getRequestDispatcher("view/usuarios/update.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/SrvtUsuario?action=mostrar");
            }
        }
    }
// Metodo Eliminar usuarios  

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = udao.eliminar(id);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtUsuario?action=mostrar");
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect(request.getContextPath() + "/view/login/index.jsp");
            return;
        }
        switch (action.toLowerCase()) {
            case "ingresar" -> iniciarSesion(request, response);
            case "registrar" -> registrar(request, response);
            case "editar" -> editar(request, response);
            default -> response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
// Metodo de inicio de sesion 

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        us = udao.validar(email, pass);

        HttpSession session = request.getSession();
        if (us != null && us.getEmail() != null) {
            session.setAttribute("usuario", us);
            session.setAttribute("usuarioId", us.getId());
            session.setAttribute("usuarioNombre", us.getNombre());
            session.setAttribute("mensaje", "Bienvenido, " + us.getNombre() + "!");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            session.setAttribute("error", "❌ Credenciales incorrectas");
            response.sendRedirect(request.getContextPath() + "/view/login/index.jsp");
        }
    }

    // Metodo registrar lista de usuarios    
    private void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        us.setNombre(request.getParameter("nombre_user"));
        us.setEmail(request.getParameter("email_user"));
        us.setId(Integer.parseInt(request.getParameter("cedula_usuario")));
        us.setTelefono(Integer.parseInt(request.getParameter("telefono_usuario")));
        us.setIdRol(Integer.parseInt(request.getParameter("rol")));
        us.setPassword(request.getParameter("password_user"));

        int resultado = udao.registrar(us);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtUsuario?action=mostrar");
        } else {
            request.setAttribute("usuario", us);
            request.getRequestDispatcher("view/usuarios/create.jsp").forward(request, response);

        }
    }

    // Metodo actualizar lista de usuarios 
    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        us.setNombre(request.getParameter("nombre_user"));
        us.setEmail(request.getParameter("email_user"));
        us.setId(Integer.parseInt(request.getParameter("cedula_usuario")));
        us.setTelefono(Integer.parseInt(request.getParameter("telefono_usuario")));
        us.setIdRol(Integer.parseInt(request.getParameter("rol")));
        us.setPassword(request.getParameter("password_user"));

        int resultado = udao.editar(us);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtUsuario?action=mostrar");
        } else {
            request.setAttribute("usuario", us);
            request.getRequestDispatcher("view/usuarios/update.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
