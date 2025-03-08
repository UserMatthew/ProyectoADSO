/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.RolDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Rol;

/**
 *
 * @author NauCreep
 */
public class SrvtRol extends HttpServlet {

    private RolDAO rdao = new RolDAO();
    Rol rol = new Rol();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action.toLowerCase()) {
            case "mostrar" -> mostrar(request, response);
            case "update" -> update(request, response);
            case "eliminar" -> eliminar(request, response);
            default -> response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
// Metodo de para mostrar roles 

    private void mostrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("rol", rdao.MostrarRol());
        request.getRequestDispatcher("/view/roles/index.jsp").forward(request, response);

    }

// Metodo de para Enviar update roles
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            rol = rdao.buscarPorID(id);
            if (rol != null) {
                request.setAttribute("rol", rol);
                request.getRequestDispatcher("view/roles/update.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/SrvtRol?action=mostrar");
            }
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
            case "registrar" -> registrar(request, response);
            case "editar" -> editar(request, response);
            default -> response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

// Metodo de para registrar roles 
    private void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        rol.setNombre(request.getParameter("rol"));
        int resultado = rdao.registrar(rol);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtRol?action=mostrar");
        } else {
            request.setAttribute("rol", rol);
            request.getRequestDispatcher("view/rol/create.jsp").forward(request, response);

        }
    }
// Metodo de para editar roles 

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        rol.setNombre(request.getParameter("rol_nombre"));
        int resultado = rdao.editar(rol);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtRol?action=mostrar");
        } else {
            request.setAttribute("rol", rol);
            request.getRequestDispatcher("view/roles/update.jsp").forward(request, response);

        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = rdao.eliminar(id);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtRol?action=mostrar");
        }
    }

}
