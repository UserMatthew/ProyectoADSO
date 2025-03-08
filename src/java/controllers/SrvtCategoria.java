/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.CategoriaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Categoria;

/**
 *
 * @author NauCreep
 */
public class SrvtCategoria extends HttpServlet {

    private CategoriaDAO cdao = new CategoriaDAO();
    Categoria cat = new Categoria();

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
            default ->
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }
    // Metodo de para mostrar las categorías

    private void mostrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categoria", cdao.MostrarCategoria());
        request.getRequestDispatcher("/view/categorias/index.jsp").forward(request, response);

    }

    // Metodo de para enviar ID a update
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            cat = cdao.buscarPorID(id);
            if (cat != null) {
                request.setAttribute("categoria", cat);
                request.getRequestDispatcher("view/categorias/update.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/SrvtCategoria?action=mostrar");
            }
        }
    }
    // Metodo de para eliminar categoria 
      private void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int resultado = cdao.eliminar(id);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtCategoria?action=mostrar");
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
            case "registrar" ->
                registrar(request, response);
            case "editar" ->
                editar(request, response);
            default ->
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
        }
    }

    // Metodo de para registrar categorias 
    private void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        cat.setId(Integer.parseInt(request.getParameter("id_categoria")));
        cat.setNombre(request.getParameter("categoria"));
        cat.setDescripcion(request.getParameter("descripcion"));
        int resultado = cdao.registrar(cat);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtCategoria?action=mostrar");
        } else {
            request.setAttribute("categoria", cat);
            request.getRequestDispatcher("view/categorias/create.jsp").forward(request, response);

        }
    }
// Metodo de para actualizar categorias 

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        cat.setNombre(request.getParameter("categoria"));
        cat.setDescripcion(request.getParameter("descripcion"));
        int resultado = cdao.editar(cat);
        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/SrvtCategoria?action=mostrar");
        } else {
            request.setAttribute("categoria", cat);
            request.getRequestDispatcher("view/categorias/update.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   
}
